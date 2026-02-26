#!/bin/bash

while true
do

    read -s -p "Introduce la contraseña: " pass1
    echo
    read -s -p "Confirma la contraseña: " pass2
    echo

    if [ "$pass1" = "$pass2" ]; then
        echo "Ok contraseña aprobada"
        break
    else
        echo "Error, la contraseña no coincide"
    fi
done

exit