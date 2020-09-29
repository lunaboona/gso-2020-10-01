#!/bin/bash

echo "SUBTRAÇÃO"

VAL1=$( ./leitura.sh "NUMBER" "Insira o minuendo: " )
VAL2=$( ./leitura.sh "NUMBER" "Insira o subtraendo: " )

./imprime.sh "A diferença de $VAL1-$VAL2 = $(echo "scale=2; ($VAL1-$VAL2)"| bc)"
