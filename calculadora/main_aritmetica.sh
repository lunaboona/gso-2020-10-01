#!/bin/bash

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

INVALIDO=true
while [ $INVALIDO = true ];
do
  OP=$( ./leitura.sh "STRING" "Selecione a operação: " )
  echo ""

  INVALIDO=false
  if [ "$OP" = "+" ]; then
    ./aritmetica/adicao.sh
  elif [ "$OP" = "-" ]; then
    ./aritmetica/subtracao.sh
  elif [ "$OP" = "/" ]; then
    ./aritmetica/divisao.sh
  elif [ "$OP" = "*" ]; then
    ./aritmetica/multiplicacao.sh
  else
    INVALIDO=true
    echo "Opção inválida, tente novamente."
  fi
done
