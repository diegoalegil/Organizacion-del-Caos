#!/bin/bash

read -p "Introduce la base: " base
read -p "Introduce la altura: " altura

area=$((base * altura))

echo "El area es: $area"
echo

for ((i=1; i<=altura; i++))
do
    for((j=1; j<=base; j++))
    do
        echo -n "#"
    done
    echo
done