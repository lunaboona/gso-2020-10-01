#!/bin/bash

test $# -ne 1 && echo "imprime.sh: número de argumentos incorreta" && exit

echo "$1" > /dev/tty