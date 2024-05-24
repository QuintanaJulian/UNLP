# practica 3 ejrcicio 12 b


echo " $1 $2 $3"

if [ $# -ne 3 ]; then
	echo "Comando unicamente valido con 3 valores por referencia"
	exit 1
fi



operation="$3"

integer_pattern='^[+-]?[0-9]+$'
#operation_pattern=[+,-,*,%]+

if [[ $1 =~ $integer_pattern && $2 =~ $integer_pattern ]]; then
	case $operation in
	"+")	resultado=$(expr $1 + $2)
		echo "Suma: $resultado"
	;;
	"*")	resultado=$(expr $1 \* $2)
		echo "Multiplicacion: $resultado"
	;;
	"-")	resultado=$(expr $1 - $2)
		echo "Resta: $resultado"
	;; 
	"%")	if [ $2 -eq 0 ]; then
			echo "no se puede dividir por 0."
			exit 1
		fi
		resultado=$(expr $1 % $2)
		echo "Division: $resultado"
	;;

	*)	echo "Valor de opreracion no valio (+,-,*,%)"
	;;
	esac
else
	echo "Alguno o ambos de los valores no son numericos"
	exit 1
fi

exit 0

