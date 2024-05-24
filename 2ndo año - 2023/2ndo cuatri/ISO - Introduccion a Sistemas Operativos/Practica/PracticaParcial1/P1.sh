#Realice un script que reciba como parámetro el nombre de un directorio.
#Deber: validar que el mismo exista y de no existir causar la terminación del script con código de error 4.
#Si el directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
#para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura,
#e informar dichos valores en pantalla. 
#En caso de encontrar subdirectorios, no deberán procesarse, y tampoco deberán ser tenidos en cuenia para la suma a informar.



if [ $# -ne 1 ]; then
	echo "Incorrecto cantidad de parametros recibidos. "
	echo "Esperados 1, direccion de busqueda"
	exit 1
fi

if [ ! -d $1 ]; then
	echo "El directorio recibido no existe. /n $1"
	exit 4
fi


permisoLectura=0
permisoEscritura=0

for file in $1/*; do
	if [ -f $file ]; then
		if [ -r $file ]; then
			#permisoLectura=$($permisoLectura + "1")
			((permisoLectura++))
		fi
		if [ -w $file ]; then
			#permisoEscritura=$( $permisoEscritura + "1" )
			((permisoEscritura+=1))
		fi
	else
		echo "No es un archifo $file"
	fi
done

echo "En el directorio $1"
echo "se tiene: "
echo "Permiso de lectura: $permisoLectura"
echo "Permiso de escritura: $permisoEscritura"

exit 0
