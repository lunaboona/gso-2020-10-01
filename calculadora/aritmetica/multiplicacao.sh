#!/bin/bash

echo "MULTIPLICAÇÃO"

VAL1=$( ./leitura.sh "NUMBER" "Insira o primeiro fator: " )
VAL2=$( ./leitura.sh "NUMBER" "Insira o segundo fator: " )

./imprime.sh "O produto de $VAL1*$VAL2 = $(echo "scale=2; ($VAL1*$VAL2)"| bc)"
