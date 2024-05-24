#!/bin/bash
declare -A archivos

inicializar() {
#	archivos=()
#	declare -A archivos

	dir="$HOME/practicaISO/practica3/pruebas"

	for file in  "$dir"/*; do
		file_name=$( basename "$file")
		file_ext=$(echo "$file_name"| cut -d "." -f 2 )
		if [ "$file_ext" = "docx" ]; then
#			echo "Guardando $file_name" 
			file_name=$(echo $file_name | cut -d "." -f 1)
			archivos["$file_name"]=$file
#			echo "Se guardo el archivo ${archivos[$file_name]}"

#		else
#			echo "$file_name termina en $file_ext "
#			echo "$file"
		fi
	done

	for archivo in ${!archivos[@]}; do
		echo "Guardado: $archivo"
	done

}


leerArchivo(){
	echo "$nombreBusc"
	if [[ -v archivos["$nombreBusc"] ]]; then
#		echo "entro"
#		echo "${archivos["$nombreBusc"]}"
		cat ${archivos["$nombreBusc"]}
	else
		echo "Archivo no encontrado."
		exit 5
	fi
}


imprimirDimension(){
	echo "La dimension es ${#archivos[@]}"
}



borrarArchivo(){
	if [ -v archivo["$nombreBusc"] ]; then
		echo "Desea hacer baja logica?"
		read respuesta
		if [ $respuesta = "no" ]; then
			archivo="$dir/$fileBusc"
			echo "$archivo"
			rm  "$archivo"
		fi

		unset archivo["$nombreBusc"]
	else
		echo "Archivo no encontrado"
		exit 10
	fi
}







if [[ $# -lt 1 || $# -gt 2 ]]; then
        echo "Incorrecto numero de parametros recibidos"
        exit 1
fi


inicializar

operacion=$1
fileBusc=$2
nombreBusc=$( echo "$fileBusc" | cut -d "." -f 1)


case $operacion in
        "-verArchivo") leerArchivo
        ;;
        "-cantidadArchivos") imprimirDimension
        ;;
        "-borrarArchivo") borrarArchivo
        ;;
        *) echo "Los parametros aceptados son: -verArchivo, -cantidadArchivos o -borrarArchivo"
        ;;
esac















