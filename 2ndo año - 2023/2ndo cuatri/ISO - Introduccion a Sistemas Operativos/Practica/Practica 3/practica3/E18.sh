#!/bin/bash


if [ "$#" -ne 1 ]; then
	echo "Numero incorrecto de parametros"
	exit 1
fi

usuario="$1"
timeout=20
intervalCheck=10
minTime=$(date +%s)
maxTime=$((minTime + timeout))

logFile="log.txt"

while [ $(date +%s) -lt "$maxTime" ]; do
	User=$( w | grep "$usuario")
	echo "$User"
	if [ -n "$User" ]; then
		echo "El usuario esta conectado" >> "$logFile"
		exit 0
	fi
	
	sleep "$intervalCheck"
done



if [ $(date +%s) -ge "$maxTime" ]; then
	echo "Error TimeOut"
fi
