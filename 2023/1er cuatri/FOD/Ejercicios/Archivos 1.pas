program Archivos1;

type
	archivo = file of integer;

var
	hola: archivo;
	aux, aux2: integer;
	chau: boolean;
	
BEGIN
	aux:= 5;
	aux2:= 0;
	Assign (hola, 'hola.dat');
	Rewrite (hola);
	Write (hola, aux);
	
	Seek (hola, aux2);						//PROCEDURE mueve el 'puntero' a aux2 posicion

	Read (hola, aux2);					//copia el calor guardado en el puntero archivo a aux2
	writeln ('El dato previamente guardado es: ', aux2);
	
	
	writeln ( 'El tamano del archivos es de: ', FileSize (hola) );								//FUNCTION lee el tamano del archivo
	
	chau:= EOF (hola);						//FUNCTION 	Dice si es esta en el EOF del archivo  True si es el fin
	if chau  then
		writeln ('No es el fin')
		else writeln ('Es el fin');
	
	writeln ( 'Posicion actual: ', FilePos (hola) );									//FFUNCTION 		Dice posicion actual dentro del archivo			
	
	Seek (hola, aux2);						//PROCEDURE mueve el 'puntero' a posicion aux2
	
	writeln ( 'Posicion actual: ', FilePos (hola) );									//FFUNCTION 		Dice posicion actual dentro del archivo			
	
	
	//writeln ( 'En la posicion ', aux2, ' esta el valor: ', Seek (hola, aux2) );									//procedure
	
	EOF (hola);
	
	Close (hola);
END.

