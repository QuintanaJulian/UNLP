#!/bin/bash

echo "Imprimiendo archivos que se encuentran en el directorio actual"
pwd
directorio="/home/juli/practicaISO/practica3/pruebas"
# echo "$directorio"

for files in "$directorio"/*; do
	if [ -f "$files" ]; then
		filename=$(basename "$files")
		echo "	$filename"
		cadena=$(echo "$filename" | tr '[:lower:][:upper:]' '[:upper:][:lower:]' )
		echo "$cadena" | tr -d '[A][a]'
	fi
done

echo "exit."
