#!/bin/bash

test $# -ne 2 && echo "leitura.sh: número de argumentos incorreta" && exit

VAL=""

echo -n "$2" > /dev/tty
read VAL

if [ $1 = "STRING" ]; then
  echo "$VAL"
else
  echo $(echo "scale=2; $VAL"| bc)
fi