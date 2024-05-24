program Ej1P1;

//type
//a_numeros = type of integer;

var
	archivo: file of integer;
	n_fisico: string;
	aux: integer;
BEGIN
	write ('Ingrese el nombre de su nuevo archivo: (corta con 30000)');
	readln (n_fisico);
	Assign (archivo, n_fisico);
	Rewrite (archivo);
	
	write ('Ingrese numero a guardar: ');
	read (aux);
	while (aux <> 30000) do begin
		Write (archivo, aux);
		read (aux);
	end;
	Close (archivo);
	
	Reset (archivo);
	writeln ('Los datos guardados en el archivos son:');
	while not eof(archivo) do begin
		Read (archivo, aux);
		write (aux, ', ');
	end;
END.

