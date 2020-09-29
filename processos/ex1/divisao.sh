#!/bin/bash

echo "DIVISÃO"

VAL1=$( ./leitura.sh "NUMBER" "Insira a primeira parcela: " )
VAL2=$( ./leitura.sh "NUMBER" "Insira a segunda parcela: " )

./imprime.sh "A divisão de $VAL1/$VAL2 = $(echo "scale=2; ($VAL1/$VAL2)"| bc)"
