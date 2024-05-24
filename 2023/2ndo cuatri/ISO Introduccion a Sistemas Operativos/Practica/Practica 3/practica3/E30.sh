#!/bin/bash

if [ $? -ne 0 ]; then
	echo "Numero incorrecto de parametros recibidos (Esperados 0)"
fi

dirUser="$HOME/bin"
#dirUser="$HOME/practicaISO/practica3"
echo "Direccion buscada $dirUser"

if [ ! -d $dirUser ]; then
	mkdir $dirUser
	echo "Creando directorio $dirUser"
else
	echo "El directorio $dirUser existe"
fi


contador=0
dirActual=$PWD
echo "La dir actual es $dirActual"
echo "			***--***--***--***"

for file in "$dirActual"/*; do
	if [ -f $file ]; then
		echo "Proximo archivo a mover $file a $dirUser"
		((contador++))
		mv "$file" "$dirUser"
	else
		echo "$file no es un archivo"
	fi
done

echo "Se movieron un total de $contador archivos"
