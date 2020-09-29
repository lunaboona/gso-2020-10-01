#!/bin/bash

echo ""
echo "-----------------------------------------------"
echo ""
echo "Bem-vindo ao Cronômetro 2020 Pro Max Free Trial"
echo ""
echo "-----------------------------------------------"
echo ""
echo "Lista de comandos:"
echo "[E]xecutar"
echo "[F]inalizar"
echo "[S]air"
echo ""
echo "-----------------------------------------------"
echo ""

executando=false
timer=0
input=""

formatsecs() {
  # Format seconds to HH:MM:SS
  ((H=${1}/3600))
  ((M=(${1}%3600)/60))
  ((S=${1}%60))
  printf "%02d:%02d:%02d" $H $M $S
}

# Allow for listening to keystrokes in a non-blocking way
stty -icanon time 0 min 0

while [ "$input" != "s" ] && [ "$input" != "S" ]; do
  read -s input # Read keystroke (non-blocking, see above), silent (-s) so it doesn't print the input

  if [ "$input" = "s" ] || [ "$input" = "S" ]; then
    echo ""
    echo "Programa finalizado"
  elif [ $executando = false ] && { [ "$input" = "e" ] || [ "$input" = "E" ]; }; then
    executando=true
  elif [ $executando = true ] && { [ "$input" = "f" ] || [ "$input" = "F" ]; }; then
    executando=false
    clear
    echo "Status: PAUSADO"
    echo $(formatsecs $timer)
  fi

  if [ $executando = true ]; then
    clear
    echo "Status: EXECUTANDO"
    echo $(formatsecs $timer)
    sleep 1 # Wait a second
    timer=$(($timer+1)) # Increment timer
  fi
done

# Reset stty
stty sane
