#!/bin/bash

echo "ADIÇÃO"

VAL1=$( ./leitura.sh "NUMBER" "Insira a primeira parcela: " )
VAL2=$( ./leitura.sh "NUMBER" "Insira a segunda parcela: " )

./imprime.sh "A soma de $VAL1+$VAL2 = $(echo "scale=2; ($VAL1+$VAL2)"| bc)"
