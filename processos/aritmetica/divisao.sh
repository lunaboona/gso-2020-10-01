#!/bin/bash

echo "DIVISÃO"

VAL1=$( ./leitura.sh "NUMBER" "Insira o dividendo: " )
VAL2=$( ./leitura.sh "NUMBER" "Insira o divisor: " )

./imprime.sh "O quociente de $VAL1/$VAL2 = $(echo "scale=2; ($VAL1/$VAL2)"| bc)"
