

i="1"
multiplicacion=''
while [ $i -le 100 ]; do
	echo "$i"
	cuadrado=$(expr $i \* $i)
	echo " $cuadrado"
	i=$(expr $i + 1)	
done

exit 0
