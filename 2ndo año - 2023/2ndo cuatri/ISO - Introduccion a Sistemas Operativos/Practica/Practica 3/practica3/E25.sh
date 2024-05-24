#!/bin/bash

if [[ $# -lt 1 || $# -gt 2 ]]; then
	echo "Incorrecta cantidad de variables recibidas"
	exit 1
fi


#name=()
#name=$(who | awk '{ name+=$1}' )

#array=$(who | awk '{print $1}')

#echo "${array[1]}"
#for i in ${#array[@]}; do
#	echo "${array[i]}"
#done


array=($( cat /etc/passwd | awk -F: '{ if ($3 >= 1000) print $1 }' ))
#| cut -d: -f 1 ))

echo " ${array[@]}"

echo " ${#array[*]}"

array["${#array[@]}"]=hola

echo " ${#array[@]}"


echo "${array[*]}"
