#!/bin/bash

echo ""
echo "-----------------------------------------------"
echo ""
echo "BLACKJACK"
echo ""
echo "-----------------------------------------------"
echo ""

NOMESCARTAS[1]="A"
NOMESCARTAS[11]="J"
NOMESCARTAS[12]="Q"
NOMESCARTAS[13]="K"
for NUM in $(seq 2 10)
do
  NOMESCARTAS[$NUM]="$NUM"
done

novacarta() {
  echo $( shuf -i 1-13 -n 1 )
}

checksoma() {
  cSOMA=${1}
  cCONTCARTAS=${2}

  # echo "novo checksoma $cSOMA $cCONTCARTAS" > /dev/tty

  if [ $cSOMA -gt 21 ];
  then
    echo "Você estourou, perdeu :(" > /dev/tty
    echo $(($cSOMA))
  elif [ $cSOMA -eq 21 ];
  then
    echo "Você ganhou, parabéns!!!" > /dev/tty
    echo $(($cSOMA))
  else
    MAIS=true
    until [ $MAIS = false ];
    do
      NOVO=$( ./leitura.sh "STRING" "Quer pedir mais uma carta? (S/n) " )
      if [ "$NOVO" = "S" ] || [ "$NOVO" = "s" ];
      then 
        C3=$(novacarta)
        cCONTCARTAS=$(($cCONTCARTAS+1))
        echo "CARTA $cCONTCARTAS: ${NOMESCARTAS[$C3]}" > /dev/tty
        cSOMA=$(($cSOMA+$C3))
        echo "" > /dev/tty
        echo "Soma: $cSOMA" > /dev/tty

        cSOMA=$(checksoma $cSOMA $cCONTCARTAS)
        echo $(($cSOMA))
        break
      else
        echo "Passando a vez..." > /dev/tty
        MAIS=false

        echo $(($cSOMA))
        break
      fi
    done
  fi
}

REPETE=true
while [ $REPETE = true ];
do

  NUMJOGINVALIDO=true
  while [ $NUMJOGINVALIDO = true ];
  do
    NUMJOG=$( ./leitura.sh "NUMBER" "Número de pessoas jogadoras [1 - 5]: " )
    if [ $NUMJOG -lt 1 ];
    then
      echo "É necessário ao menos 1 jogador."
    elif [ $NUMJOG -gt 5 ];
    then 
      echo "O máximo de jogadores é 5."
    else
      NUMJOGINVALIDO=false
    fi
  done

  for CONT in $(seq $NUMJOG)
  do
    echo ""
    echo "-----------------------------------------------"
    echo ""
    echo "VEZ DO JOGADOR $CONT"
    echo ""
    echo "-----------------------------------------------"
    echo ""

    CONTCARTAS=0

    C1=$(novacarta)
    CONTCARTAS=$(($CONTCARTAS+1))
    echo "CARTA $CONTCARTAS: ${NOMESCARTAS[$C1]}"

    C2=$(novacarta)
    CONTCARTAS=$(($CONTCARTAS+1))
    echo "CARTA $CONTCARTAS: ${NOMESCARTAS[$C2]}"
    
    PONTUACOES[$CONT]=$(($C1+$C2))
    echo ""
    echo "Soma: ${PONTUACOES[$CONT]}"

    PONTUACOES[$CONT]=$(checksoma ${PONTUACOES[$CONT]} $CONTCARTAS)

    sleep 1

    if [ ${PONTUACOES[$CONT]} -gt 21 ];
    then
      PONTUACOES[$CONT]=0
      continue
    elif [ ${PONTUACOES[$CONT]} -eq 21 ];
    then
      break
    fi
  done

  echo ""
  echo "-----------------------------------------------"
  echo ""
  echo "PONTUAÇÃO FINAL"
  echo ""
  for CONT in $(seq $NUMJOG)
  do
    echo "JOGADOR $CONT: ${PONTUACOES[$CONT]}"
  done
  echo ""
  echo ""
  IC=($(echo ${PONTUACOES[*]} | tr " " "\n" | cat -n | sort -k2,2nr | head -n1))
  NUMVENCEDOR=${IC[0]}
  echo "VENCEDOR É O JOGADOR $NUMVENCEDOR!!!!!"
  echo ""
  echo "-----------------------------------------------"
  echo ""



  echo "Deseja iniciar um novo jogo? (S/n)"
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
