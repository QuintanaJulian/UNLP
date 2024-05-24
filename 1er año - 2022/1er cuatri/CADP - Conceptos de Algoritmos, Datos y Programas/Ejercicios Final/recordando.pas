
program R.p7.e1;

type
	genero = 1..5;

	personas = record
		DNI: integer;
		Nombre: String;
		Edad: integer;
		Codigo: genero;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: personas;
		sig: lista;
	end;
	
	contadorGeneros= array [1..5] of integer;
	
procedure InsertarAdelante (var PI: lista; dato: personas);
var
	nuevo: lista;
begin
	new (nuevo);
	nuevo^.sig:= PI;
	nuevo^.dato:= dato;
	PI:= nuevo;
end;
	
	
procedure CargarParticipantes (var PI: lista);
var
	dato: personas;
begin
	repeat
		write ('Ingresar DNI:');
		readln (dato.DNI);
		write ('Ingresar Nombre:');
		readln (dato.Nombre);
		write ('Ingresar Edad:');
		readln (dato.Edad);
		write ('Ingresar Genero:');
		readln (dato.Codigo);
		InsertarAdelante (PI, dato);
	until (dato.DNI = 3355);
end;

procedure AnalizarPares (var DNIpares: integer; numero: integer);
var
	pares, impares, i: integer;
begin
	pares:= 0;
	impares:= 0;
	while (numero <> 0) do begin
		i:= numero mod 10;
		numero:= numero div 10;
		if ((i mod 2) = 0) then
			pares:= pares + 1
		else impares:= impares + 1;
	end;
	if (pares > impares) then
		DNIpares:= DNIpares + 1;
end;

procedure AnalizarGeneros (registro: contadorGeneros);
var
	max1, max2, cant1, cant2, i: integer;
begin
	cant1:= 0;
	cant2:= 0;
	max1:= 99;
	max2:= 99;
	for i:= 1 to 5 do begin
		if  (registro[i] > cant1) then begin
			max2:= max1;
			max1:= i;
			cant2:= cant1;
			cant1:= registro [i];
		end
		else if (registro [i] > cant2) then begin
			max2:= i;
			cant2:= registro[i];
		end;
	end;
	writeln ('El genero mas elegido es el genero ', max1, ' y el segundo mas elegido es el ', max2);
end;


procedure RecorrerLista (PI: lista);
var
	DNIpares, i: integer;
	cantGeneros: contadorGeneros;
begin
	DNIpares:= 0;
	for i:= 1 to 5 do
		cantGeneros[i] := 0;
	while (PI <> nil) do begin
		AnalizarPares (DNIpares, PI^.dato.DNI);
		cantGeneros[PI^.dato.Codigo]:= cantGeneros[PI^.dato.Codigo] + 1;
		PI:= PI^.sig;
	end;
	
	AnalizarGeneros (cantGeneros);
	writeln ('Un total de ', DNIpares, ' persona/s posee/n mas digitos pares que impares en el DNI.');
end;

procedure BorrarParticipante (var PI: lista);
var
	DNI: integer;
	ant, act: lista;
	encontrado: boolean;
begin
	encontrado:= false ;
	write ('Ingrese DNI que desea borrar: ');
	readln (DNI);
	act:= PI;
	ant:= PI;
	while (act <> nil) and (encontrado = false) do begin
		if (act^.dato.DNI = DNI) then begin
			if ant = act then
				PI:= act^.sig
			else 
				ant^.sig:= act^.sig;
			dispose (act);
			encontrado:= true;
		end;
		ant:= act;
		act:= act^.sig;
	end;
	if (encontrado = true) then
		writeln ('Se a eliminado correctamente el participante.')
	else
		writeln ('No se a encontrado dicho participante.');
end;

var
	PI: lista; 
	i: integer;
BEGIN

	for i:=10 downto 5 do
		writeln (i);
	
	PI:= nil;
	CargarParticipantes (PI);
	RecorrerLista (PI);
	BorrarParticipante (PI);
END.

