#!/bin/bash
#Esto es el primer script que hago, deberia pedir un nombre y despues imprimirlo

echo "Introduzca su nombre y su apellido"
read nombre apellido
echo Fecha y hora actual
date
echo "Su apellido y nombre es: "
echo $apellido $nombre
echo "Su ususario es: $(whoami)"
echo "Su directorio acual es:"
pwd

#inciso  E

echo "Ingrese el numero de operacion que desea ver a continuacion"
echo "1 -Ver su directorio personal"
echo "2 -El contenido de un directorio en particular"
echo "3 -Visualizar el espacio libre en disco"
read opcion

case $opcion in
	1) 
	echo "Su directorio personal es:"
	echo "$HOME"
	;;
	2)
	echo "Ingrese directorio:"
	read directorio
	if [ -d "$directorio" ]; then
	# -d comprueba si existe
		echo "El contenido de $directorio: "
		ls "$directorio"
	else
		echo "El $directorio directorio no existe"
	fi
	;;
	3)
	df -h
	# -h lo hace human frendly
	;;
	*)
	echo "Opcion no valida"
	;;
esac
