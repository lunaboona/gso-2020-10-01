#!/bin/bash

REPETE=true

while [ $REPETE = true ]; 
do
  echo ""
  echo "-----------------------------------------------"
  echo ""
  echo "Bem-vindo à Calculadora 2020 Pro Max Free Trial"
  echo ""
  echo "-----------------------------------------------"
  echo ""
  echo "Escolha a calculadora:"
  echo "[A]ritmética"
  echo "[G]eométrica"
  echo ""
  echo "-----------------------------------------------"
  echo ""

  OP="x"
  while [ "$OP" != "a" ] && [ "$OP" != "A" ] && [ "$OP" != "g" ] && [ "$OP" != "G" ];
  do
    OP=$( ./leitura.sh "STRING" "Selecione: " )

    if [ "$OP" != "a" ] && [ "$OP" != "A" ] && [ "$OP" != "g" ] && [ "$OP" != "G" ];
    then
      echo "Opção inválida, tente novamente."
    fi
  done

  if [ "$OP" = "a" ] || [ "$OP" = "A" ];
  then
    ./main_aritmetica.sh
  else
    ./main_geometrica.sh
  fi

  echo ""
  echo "-----------------------------------------------"
  echo ""
  echo "Deseja iniciar um novo cálculo? (S/n)"
  NOVO=$( ./leitura.sh "STRING" "" )

  if [ "$NOVO" = "S" ] || [ "$NOVO" = "s" ];
  then 
    REPETE=true
    echo "Reiniciando..."
    clear
  else
    REPETE=false
    echo "Encerrando..."
  fi
done
