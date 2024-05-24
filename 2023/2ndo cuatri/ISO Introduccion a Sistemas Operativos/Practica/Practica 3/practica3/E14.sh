#!/bin/bash


agregar() {
Dir="$1"
Op="$2"
Add="$3"
for file in "$Dir"/*; do
        if [ -f "$file" ]; then
                nombreAct=$(basename "$file")
                if [ "$Op" = "-a" ]; then
                        cadena="$nombreAct$Add"
                else
                        cadena="$Add$nombreAct"
                fi
                nombreNuevo="$Dir/$cadena"
                mv "$file" "$nombreNuevo"
                echo "Archivo $nombreAct a $nombreNuevo"
        else
                echo "$file no es un archivo"
        fi
done
}


Dir="$1"
Op="$2"
Add="$3"
if [ $# -ne 3 ]; then
	echo "ERROR: Se requiere el pasaje de una direccion para renombrar"
elif [[ $Op = "-a" || $Op = "-b" ]]; then
	if [ -d "$Dir" ]; then
		agregar "$Dir" "$Op" "$Add"


	else 
		echo "No se encontro el directorio recibido."
		exit  1
	fi
else
	echo "No se recibio el parametro de operacion (-a / -b)"
	exit 1
fi



