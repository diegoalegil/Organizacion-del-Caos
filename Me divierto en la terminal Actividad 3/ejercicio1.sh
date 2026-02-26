#!/bin/bash

dias=$1
horas=$2
segundos=$3

total=$((dias*86400 + horas*3600 + segundos ))

echo "Total de segundos: $total"