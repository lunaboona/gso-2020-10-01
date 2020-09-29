#!/bin/bash

echo ""
echo "-----------------------------------------------"
echo ""
echo "Bem-vindo à Calculadora 2020 Pro Max Free Trial"
echo ""
echo "-----------------------------------------------"
echo ""
echo "Lista de comandos:"
echo "[+] Adição"
echo "[-] Subtração"
echo "[/] Divisão"
echo "[*] Multiplicação"
echo ""
echo "-----------------------------------------------"
echo ""

OP=$( ./leitura.sh "STRING" "Selecione a operação: " )
RES=""

if [ "$OP" = "+" ]; then
  ./aritmetica/adicao.sh
elif [ "$OP" = "-" ]; then
  ./aritmetica/subtracao.sh
elif [ "$OP" = "/" ]; then
  ./aritmetica/divisao.sh
elif [ "$OP" = "*" ]; then
  ./aritmetica/multiplicacao.sh
fi
