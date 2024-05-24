
echo "Ingrese numero de la operacion que desea realizar:"
echo "1- Listar contenido directorio actual."
echo "2- Mostrar directorio actual."
echo "3- Muestra lso usuarios conectados al sistema."
read i

case $i in
	'1') echo "El contenido del directorio actual es: " 
		ls
	;;

	'2') echo "La ddireccion actual es"
		pwd
	;;

	'3') echo "Usuarios conectados:"
	echo "who"
	who
	echo "w"
	w
	echo "whoami"
	whoami
	echo "finger"
	finger whoami
	;;

	*) echo "Por favor elija una de las operaciones previamente menciondas"
	exit 1
	;;
esac

exit 0
