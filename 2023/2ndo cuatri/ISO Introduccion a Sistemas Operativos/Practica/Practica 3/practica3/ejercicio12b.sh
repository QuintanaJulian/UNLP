# practica 3 ejrcicio 12 b


if [ $# -ne 2 ]; then
	echo "Comando unicamente valido con 2 valores por referencia"
	exit 1
fi

integer_pattern='^[+-]?[0-9]+$'


if [[ $1 =~ $integer_pattern && $2 =~ $integer_pattern ]]; then
	resultado=$(expr $1 + $2)
	echo "Suma: $resultado"

	resultado=$(expr $1 \* $2)
	echo "Multiplicacion: $resultado"

	resultado=$(expr $1 - $2)
	echo "Resta: $resultado"

	if [ $1 -lt $2 ]; then
		echo "el valor 2 $2 es mayor"
	elif [ $1 -gt $2 ]; then
		echo "El valor 1 $1 es mas grande"
	else echo "Los valores son iguales $1"
	fi
else
	echo "Alguno o ambos de los valores no son numericos"
	exit 1
fi

exit 0

