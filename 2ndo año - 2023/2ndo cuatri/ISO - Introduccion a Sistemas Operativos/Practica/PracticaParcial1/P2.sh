#Implemente un script que agregue a un arregio todos los archivos del directorio /home cuya terminación sea doc.
#Adicionalmente, implemente las siguientes funciones que le permitan acceder a la estructura creada:

#verArchivo ‹nombre_de_archivo›: Imprime el archivo en pantalla si el mismo se encuentra en el arreglo.
#Casocontrario imprime el mensaje de error "Archivo no encontrado" y devuelve como valor de retorno 5

#cantidadArchivos: Imprime la cantidad de archivos del /home con terminación doc

#borrarArchivo <nombre_de_archivo›: Consulta al usuario si quiere eliminar el archivo lógicamente.
#Si el usuario responde Si, elimina el elemento solo del arreglo. Si el usuario responde No, elimina el archivo del arreglo y también del FileSystem.

#Debe validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje de error "Archivo no encontrado" y devuelve como valor de retorno 10


if [ ! $# -le 1 ]; then
	echo "incorrecta cantidad de parametros recibidos, maximo 1"
	exit 1
fi

declare -A array
dirBase=$HOME/practicaISO/practica3/pruebas

for file in $dirBase/*; do
	if [ -f $file ]; then
		nombre=$(basename $file)
		ext=$( echo "$file" | rev | cut -d. -f1 | rev)
		echo "El archivo es $nombre con la extension $ext"
		if [ "$ext" = "docx" ]; then
			array["$nombre"]=$file
		fi
	fi
	echo "El array hasta ahora:"
	echo " ${!array[@]}"
done

echo "				----------				---------"

verArchivo(){
	if [ ! $# -eq 1 ]; then
		echo "No se recibio ningun nombre por parametro"
		echo "Ingrese nombre del archivo a ver: "
		read file
	else
		file=$1
	fi

	if [ ! -v ${array["$file"]} ]; then
		echo "El archivo ingresado es:"
		cat "${array[$file]}"
	else
		echo "El nombre recibido no se encuentra guardado"
		exit 5
	fi
}

cantidadArchivos() {
	echo "Hay un total de ${#array[@]} archivos con terminaxion .doc"
}

borrarArchivo(){
	if [ ! $# -eq 1 ]; then
		echo "No se recibio ningun parametro"
		echo "Ingrese nombre del archivo a borrar"
		read file
	else
		file=$1
	fi
	echo "Documento buscado $file respuesta ${array[$file]} "
	if [ ! -v ${array[$file]} ]; then
		echo "Desea hacer unicamente baja logica? (Y/N)"
		read opcion
		if [ $opcion = "N" ]; then
			rm "${array[$file]}"
			echo "$file borrado fisicamente"
		fi
		unset array["$file"]
		echo "El array:"
		echo "${!array[@]}"
	else
		echo "El nombre recibido no se encuentra en la base de datos"
		exit 10
	fi
}


select opcion in  "verArchivo" "cantidadArchivos" "borrarArchivo" "exit" ; do
	case $opcion in
		"verArchivo") verArchivo
		;;
		"cantidadArchivos") cantidadArchivos
		;;
		"borrarArchivo") borrarArchivo
		;;
		"exit") exit 0
		;;
		*) echo "Opcion no valida $opcion"
	esac
done
