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

Pushear10(){
	echo "hola"
}




pila=("pop1" "pop2" "pop3")
dimL=${#pila[@]}
	opciones=("PUSH" "POP" "LENGTH" "PRINT" "PUSH10" "POP3" "EXIT")

	select opcion in "${opciones[@]}"; do
	        case "$opcion" in
                	"PUSH") RealizarPush
        	        ;;
	                "POP") RealizarPop
                	;;
        	        "LENGTH") CalcularLargo
	                ;;
        	        "PRINT") LeerVector
	               	;;
			"PUSH10") Pushear10
			;;
			"POP3") Popear3
			;;
	                "EXIT") exit 0
                	;;
        	        *) echo "Operacion no declarada."
  	      esac
done
