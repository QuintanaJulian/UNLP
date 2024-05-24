program P1Ej2;

type
archivo = file of integer;



//procedure CargarDatos (var a_numeros: archivo);
procedure CargarDatos;
var
	a_numeros: archivo;
	aux: integer;
	a_fisico: string;
begin
	write ('Ingrese nombre del archivo a crear: ');
	read (a_fisico);
	Assign (a_numeros, a_fisico);
	Rewrite (a_numeros);
	write ('dato a ingresar: (corta con 10000)');
	readln (aux);
	while aux <> 10000 do begin
		Write (a_numeros, aux);
		write ('numero:');
		readln (aux);
	end;
	
	Close (a_numeros);
	read();
end;

procedure AnalizarDatos;
var
	a_numeros: archivo;
	aux, sumaNumeros, nMenores: integer;
begin
	nMenores:= 0;
	sumaNumeros:= 0;
	reset (a_numeros);
	while not EOF (a_numeros) do begin
		Read (a_numeros, aux);
		if aux < 1500 then
			nMenores:= nMenores + 1;
		sumaNumeros:= sumaNumeros + aux;
	end;
	writeln ('Hubo ', nMenores, ' numeros menores que 1500');
	writeln ('El promedio de los numeros ingresados da: ', (sumaNumeros / FileSize (a_numeros)):2:2);
end;



begin
	
	CargarDatos;
	AnalizarDatos;	
end.
