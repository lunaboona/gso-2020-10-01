#!/bin/bash

echo ""
echo "-----------------------------------------------"
echo ""
echo "Lista de comandos:"
echo "[Q] Área do quadrado"
echo "[T] Área do triângulo"
echo "[C] Área do círculo"
echo ""
echo "-----------------------------------------------"
echo ""

INVALIDO=true
while [ $INVALIDO = true ];
do
  OP=$( ./leitura.sh "STRING" "Selecione a operação: " )
  echo ""

  INVALIDO=false
  if [ "$OP" = "Q" ] || [ "$OP" = "q" ]; then
    ./geometrica/quadrado.sh
  elif [ "$OP" = "T" ] || [ "$OP" = "t" ]; then
    ./geometrica/triangulo.sh
  elif [ "$OP" = "C" ] || [ "$OP" = "c" ]; then
    ./geometrica/circulo.sh
  else
    INVALIDO=true
    echo "Opção inválida, tente novamente."
  fi
done
