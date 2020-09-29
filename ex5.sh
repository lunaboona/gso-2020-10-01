#!/bin/bash

echo ""
echo "-----------------------------------------------"
echo ""
echo "Bem-vindo ao Sensor 2020 Pro Max Free Trial"
echo ""
echo "-----------------------------------------------"
echo ""

for cont in $(seq 14)
do
  val=-1

  while [ $val = "" ] || [ $val -lt 0 ] || [ $val -gt 100 ];
  do
    echo -n "Insira o $cont° valor lido: "
    read val

    if [ $val = "" ] || [ $val -lt 0 ] || [ $val -gt 100 ]; then
      echo "Valor inválido. Deve ser entre 0 e 100."
    else
      vetor[cont]=$val
    fi
  done
done

vetorcompleto=($(echo ${vetor[*]} | tr " " "\n" | sort -n))

vetorfiltrado=("${vetorcompleto[@]:1}") # removes first element
vetorfiltrado=("${vetorfiltrado[@]:1}")
unset 'vetorfiltrado[${#vetorfiltrado[@]}-1]' # removes last element
unset 'vetorfiltrado[${#vetorfiltrado[@]}-1]'

soma=0
qtd=0
for item in "${vetorfiltrado[@]}"
do
  soma=$(echo "scale=2;($soma+$item)"| bc)
  qtd=$(($qtd+1))
done

media=$(echo "scale=2;($soma/$qtd)"| bc)
mediaint=$(echo "scale=0;($media/1)"| bc)
echo ""
echo "Média real: $media"
valacima="Valores acima: ";
valabaixo="Valores abaixo: ";
for item in "${vetorfiltrado[@]}"
do
  if [ $item -ge $mediaint ]; then
    valacima+="$item "
  else
    valabaixo+="$item "
  fi
done
echo "$valacima"
echo "$valabaixo"
echo ""
echo ""


somaoriginal=0
qtdoriginal=0
for item in "${vetorcompleto[@]}"
do
  somaoriginal=$(echo "scale=2;($somaoriginal+$item)"| bc)
  qtdoriginal=$(($qtdoriginal+1))
done

mediaoriginal=$(echo "scale=2;($somaoriginal/$qtdoriginal)"| bc)

echo "Média original: $mediaoriginal"
echo "Distância entre as médias: $(echo "scale=2;($media-$mediaoriginal)"| bc)"
