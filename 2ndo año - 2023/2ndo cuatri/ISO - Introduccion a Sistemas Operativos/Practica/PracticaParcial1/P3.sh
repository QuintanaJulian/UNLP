#Escribir un script de Bash que reciba un nombre de usuario como parámetro.
#Si el usuario ingresado como parámetro NO es un usuario del sistema el script debe finalizar con el código de error 1.
#En caso contrario, debe verificar cada 30 segundos si el usuario está logueado.
#Al detectar que está logueado debe registrar en un archivo llamado access-‹NOMBRE DE USUARIO>.log
#el nombre del usuario junto con la fecha en que se lo detectó.
#NO debe borrar el contenido previo de este archivo y este archivo debe escribirio en una ubicación apropiada del file system.
#Al detectar 30 veces que el usuario está logueado el script debe finalizar retomando el código de error que indica que el proceso es exitoso.



if [ ! $# -eq 1 ]; then
	echo "Se requiere el nombre de un usuario"
	exit 1
fi


usuarios=($( cat /etc/passwd | cut -d: -f1))
echo "Usuario ${usuarios[@]}"

for user in ${usuarios[@]}; do
	if [ $user = $1 ]; then
		echo "Usuario encontrado"
		break
	fi
done

if [ ! $user = $1 ]; then
	echo "El usuario recibido no existe."
	exit 1
fi;



while (! who | grep $1 ); do
	echo "Usuario $1 no esta conectado"
	sleep 30
done

file=(access-$1.log)
archivo=(/var/log/$file)

#sudo touch $archivo

echo "$1 $DATE" >> $archivo

for (( i = 0; i <= 30 ; i++ )); do
	if `! who | grep -q "$1" `; then
		echo "El usuario se desconecto"
		exit 1
	fi
	sleep 1
done

echo "El usuario aguanto conectado"
exit 0
