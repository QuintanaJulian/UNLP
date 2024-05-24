#!/bin/bash
echo "INGRSE ARCHIVO A EJECUTAR:"

echo "	1- Transcribir todos los archivos (E17)"
echo "	2- Ver usuarios logeados (E18)"

read opcion

case "$opcion" in
	1) ./E17.sh
	;;
	2) ./E18.sh
	;;
	*) echo "Numero de archivo no reconocido"
esac
