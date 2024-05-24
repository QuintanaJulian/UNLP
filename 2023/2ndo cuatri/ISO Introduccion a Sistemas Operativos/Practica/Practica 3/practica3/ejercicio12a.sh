# practica 3 ejrcicio 12

echo "Valor del primer numero que desea evaluar"
read valor1
echo "Ingrese valor del numero 2"
read valor2


resultado=$(expr $valor1 + $valor2)
echo "Suma: $resultado"

resultado=$(expr $valor1 \* $valor2)
echo "Multiplicacion: $resultado"

resultado=$(expr $valor1 - $valor2)
echo "Resta: $resultado"

if [ $valor1 -lt $valor2 ]; then
	echo "el valor 2 $valor2 es mayor"
elif [ $valor1 -gt $valor2 ]; then
	echo "El valor 1 $valor1 es mas grande"
else echo "Los valores son iguales $valor1"
fi

exit 0

