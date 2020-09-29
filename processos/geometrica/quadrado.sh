#!/bin/bash

echo "Área do quadrado"

VAL1=$( ./leitura.sh "NUMBER" "Insira o lado do quadrado: " )

./imprime.sh "A área do quadrado com lado $VAL1 é de $(echo "scale=2; ($VAL1*$VAL1)"| bc)"
