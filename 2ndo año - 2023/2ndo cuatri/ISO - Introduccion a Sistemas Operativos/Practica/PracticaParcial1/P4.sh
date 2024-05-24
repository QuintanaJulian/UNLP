#Realice un script de Bash que agregue a un arreglo los nombres de los archivos del directorio /var/log que tengan el texto "access"en su nombre.
#Luego presente un menú al usuario con las siguientes funciones sobre ese arregio

#cantidad: Imprime la cantidad de archivos del directorio /var/log que tengan el texto "access" en su nombre

#listar: Imprime los nombres de todos los archivos del directorio /var/log que tengan el texto "access" en su nombre 

#eliminar: Solicita al usuario un indice del arreglo y un carácter que puede ser "' (lógico) o T"(físico)".
#Si el segundo parámetro es "", solo borra la entrada en el arreglo, si es "P borra la entrada en el arreglo y el archivo del FileSystem,

#fin: Termina el script con el código de error que indica que el proceso es exitoso cantidad, listar y
#eliminar deben ser implementadas en funciones individuales

if [ ! $# -eq 0 ]; then
	echo "Parametros no establecidos (esperados 0)"
	exit 1
fi

#array=( $(echo "/var/log/*" | grep '*access*' -l))
#array=($(find /var/log -type f -name "*access*" | basename ))
array=()
for file in  "/var/log"/* ;  do
	echo "$file"
	if [ -f "$file" ]; then
		name=$(basename $file)
#		echo "$name"
		if [[ "$name" == *access* ]]; then
			echo "entro"
			array+="$name"
		fi
	fi
done
echo "Los archivos son: "
echo "${array[@]}"




cantidad() {
	echo "Hay un total de ${#array[*]} archivos que contienen la palabra access"
}

listar() {
	echo "El nombre de lso archivos son"
	echo "i:${!array[@]} ${array[@]}"
}


eliminar() {
	echo "hola"
}









select opcion in "cantidad" "listar" "eliminar" "fin" ; do
	case $opcion in 
		"cantidad") cantidad ;;
		"listar") listar ;;
		"eliminar") eliminar ;;
		"fin") exit 0 ;;
	esac
done


