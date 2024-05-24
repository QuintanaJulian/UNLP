#!/bin/bash

# recibir por parametro la direcciond e un archivo
# si existe informar si es un archivo o un directorio
# sino  existe crear un directorio con el nombre recibido


if [ $# -ne 1 ]; then
	echo "Comenado valido unicamente mandando un paramtero"
	exit 1
fi


directory=$1

if [ -e $directory ]; then
	if [ -f $directory ]; then
		echo "La direccion pasada es un archivo"
	elif [ -d $directory ]; then
		echo "La direccion pasada es un directorio"
	else echo "La direccion pasada no es un directorio ni un archivo"
	fi
else
	mkdir -p "$directory"
	if [ $? -eq 0 ]; then
		echo "File created sucesfully"
	else 
		echo "Error creating the file / path"
	fi
fi

