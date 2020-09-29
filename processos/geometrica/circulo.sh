#!/bin/bash

echo "Área do círculo"

VAL1=$( ./leitura.sh "NUMBER" "Insira o raio do círculo: " )

./imprime.sh "A área do círculo com raio $VAL1 é de $(echo "scale=2; (3.14 * ($VAL1*$VAL1))"| bc)"
