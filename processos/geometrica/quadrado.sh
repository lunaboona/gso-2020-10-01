#!/bin/bash

echo "ÁREA DO QUADRADO"

VAL1=$( ./leitura.sh "NUMBER" "Insira a medida do lado do quadrado: " )

./imprime.sh "A área do quadrado de lado $VAL1 u.m. é $(echo "scale=2; ($VAL1*$VAL1)"| bc) u.m.²"
