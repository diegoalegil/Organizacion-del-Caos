#!/bin/bash

altura_cm=$1
peso=$2

altura_m=$(echo "scale=2; $altura_cm / 100" | bc)

imc=$(echo "scale=2; $peso / ($altura_m * $altura_m)" | bc)

echo "Tu IMC es: $imc"

if (( $(echo "$imc < 18.5" | bc -l) )); then
    echo "Tienes Bajo peso"
elif (( $(echo "$imc < 25" | bc -l) )); then
    echo "Tienes un Peso Normal"
elif (( $(echo "$imc < 30" | bc -l) )); then
    echo "Tienes Sobrepeso"
else
    echo "Tienes Obesidad"
fi