#!/bin/bash

read -p "Introduce la altura: " altura

for ((i=1; i<=altura; i++))
do
    for ((j=1; j<=i; j++))
    do
        echo -n "*"
    done
    echo
done