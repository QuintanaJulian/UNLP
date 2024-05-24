#!/bin/bash


RealizarPush(){
        echo "Ingresar dato a guardar: "
        read dato
        pila+=("$dato")
        dimL=${#pila[@]}
        echo "Las item inserted: ${pila[$dimL - 1]}"
}

RealizarPop(){
        if [ "$dimL" -gt 0 ]; then
                dato=${pila[$dimL - 1]}
                unset 'pila[$dimL-1]'
                dimL=${#pila[@]}
                echo "Pop: $dato"
        else
                echo "La pila esta vacia."
        fi
}

CalcularLargo(){
        echo "El largo de la pila es de $dimL"
}

LeerVector(){
        for dato in ${pila[@]}; do
                echo "$dato"
        done
}






pila=("pop1" "pop2" "pop3")
dimL=${#pila[@]}
opcion="0"

while [ "$opcion" <> EXIT ]; do
	echo "Operacion a realizar:"
	echo "  PUSH    POP"
	echo "  LENGTH  PRINT"
	echo "  EXIT"

	read opcion
	opcion=$(echo "$opcion" | tr '[:lower:]'  '[:upper:]')

	case "$opcion" in
		"PUSH") RealizarPush
		;;
		"POP") RealizarPop
		;;
		"LENGTH") CalcularLargo
		;;
		"PRINT") LeerVector
		;;
		"EXIT") exit 0
		;;
		*) echo "Operacion no declarada."
	esac
done

