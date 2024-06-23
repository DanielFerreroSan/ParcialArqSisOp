#!/bin/bash

read -p "Ingrese un nombre para determinar el género: " nombre
nombre_url=$(echo "$nombre" | sed 's/ /%20/g')
url="https://api.genderize.io/?name=$nombre_url"
# la Api devuelve este formato: {"count":0,"name":"","gender":null,"probability":0.0}
respuesta=$(curl -s "$url")

genero=$(echo "$respuesta" | jq -r '.gender')

if [ "$genero" == "male" ]; then
    echo "$nombre suele asociarse a un nombre de varón"
elif [ "$genero" == "female" ]; then
    echo "$nombre suele asociarse a un nombre de mujer"
fi
