#!/bin/bash

echo "ÁREA DO CÍRCULO"

VAL1=$( ./leitura.sh "NUMBER" "Insira o raio do círculo: " )

./imprime.sh "A área do círculo de raio $VAL1 u.m. é $(echo "scale=2; (3.14 * ($VAL1*$VAL1))"| bc) u.m.²"
