#!/bin/bash

echo "Área do triângulo"

VAL1=$( ./leitura.sh "NUMBER" "Insira a primeira parcela: " )
VAL2=$( ./leitura.sh "NUMBER" "Insira a segunda parcela: " )

./imprime.sh "A área do triangulo com lados $VAL1 e $VAL2 é $(echo "scale=2; (($VAL1*$VAL2)/2)"| bc)"