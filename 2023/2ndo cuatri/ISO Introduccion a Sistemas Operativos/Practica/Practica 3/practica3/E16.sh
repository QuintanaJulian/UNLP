#!/bin/bash

if [ $# -ne 1 ]; then
	echo "This code needs to recibe a extension."
	exit 1
else
	declare -A contador
	extension=$(echo "$1" | cut -d "." -f 2)
	echo "extension: $extension"

	for file in  "/home/juli/practicaISO/practica3/pruebas"/*; do
		file_ext=$(echo "$file" | cut -d "." -f 2)
		echo "$file $file_ext y tiene que ser 		$extension"
		
		if [ "$file_ext" = "$extension" ]; then
			#owner=$(ls -l "$file" | awk '{print $3}')
			owner=$(stat -c %U "$file")
			echo "Entro a $file_ext de $owner"
			if [[ -v contador["$owner"] ]]; then
				contador["$owner"]=$((contador["$owner"] + 1))
			else
				contador["$owner"]=1
			fi
		fi
	done
fi

echo "Llego al final"

for owner in "${!contador[@]}"; do
	echo "$owner tiene un total del ${contador[$owner]} archivos con la extensión .$extension"
done
