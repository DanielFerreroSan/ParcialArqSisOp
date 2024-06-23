#!/bin/bash

numero_secreto=$((RANDOM % 100 + 1))
echo "Ingrese un numero entre 1 y 100 para intentar adivinar el elegido por la PC"
eleccion=0

while true; do
    read -p "Ingrese un numero: " eleccion

    if [[ "$eleccion" =~ ^[0-9]+$ ]]; then
        if [ "$eleccion" -ge 1 ] && [ "$eleccion" -le 100 ]; then
            break  
        else
            echo "Ingrese numeros entre 1 y 100"
        fi
    else
        echo "Error: Ingrese un número válido."
    fi
done

while [ $eleccion -ne $numero_secreto ]; do
    if [ $eleccion -lt $numero_secreto ]; then
        echo "El numero es mas alto"
    elif [ $eleccion -gt $numero_secreto ]; then
        echo "El numero es mas bajo"
    fi
    read -p "Ingrese otro numero: " eleccion
done

echo "¡Felicitaciones! El numero elegido era $numero_secreto."


