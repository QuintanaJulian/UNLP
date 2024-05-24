{
3.	Implementar un programa que procese la información de las ventas de productos de una librería
que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto vendido,
código de sucursal y cantidad vendida. El ingreso de las ventas finaliza 
cuando se lee el código de sucursal 0.
* 
Implementar un programa que:
a.	Almacene las ventas ordenadas por código de producto y agrupados por sucursal,
* 	 en una estructura de datos adecuada.
b.	Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura
* 	 donde esté acumulada la cantidad total vendida para cada código de producto.

}


program c4e2;
const
	generoMax = 4;

type
	cantGeneros = 0..generoMax;
		
	pelicula = record
		codigoP: integer;
		codigoG: cantGeneros;
		valoracion: real;
	end;

	lista = ^nodo;
	
	nodo = record
		dato: pelicula; 
		sig: lista;
	end;
		
	grupoGeneros = array [cantGeneros] of lista;
//begin       //////////////////////////////////////////// /////////////////
procedure leerDatos (var D: pelicula);
begin	
	write ('Ingrese el codigo de genero (1 a 4): ');
	//readln (D.codigoG);
	D.codigoG:= random(5);
	writeln (D.codigoG);
	if (D.codigoG <> 0) then begin
	write ('Ingrese el codigo de la pelicula: ');
	//readln (D.codigoP);
	D.codigoP:= random(9) -1;
	writeln (D.codigoP);
	random;
	write ('Ingrese la valoracion del jurado: ');
	//readln (D.valoracion);
	D.valoracion:= random(10);
	writeln (D.valoracion:2:1);
	end;
end;

procedure insertarDatos (var V: lista; D: pelicula);
var
	nuevo, actual, ant: lista;
begin
	new (nuevo); nuevo^.sig:= nil; nuevo^.dato:= D;
	actual:= V;
	
	while (actual <> nil) and (nuevo^.dato.codigoP > actual^.dato.codigoP) do begin
		ant:= actual; actual:= actual^.sig;
	end;
	
	if (actual = V) then begin
		nuevo^.sig:= V;
		V:= nuevo;
	end else begin
		nuevo^.sig:= ant^.sig;
		ant^.sig:= nuevo;	
	end;
end;

procedure cargarDatos (var V: grupoGeneros);
var
	D: pelicula; i: integer;
begin
	for i:=1 to generoMax do
		V[i]:= nil;
	leerDatos (D);
	while (D.codigoG <> 0) do begin
		insertarDatos (V[D.codigoG], D);
		leerDatos (D);
	end;
end;

//end; //////////////////////////////////////////////////////


procedure minimo (var V:grupoGeneros; var dMinimo: pelicula);
var
	iMin: integer; i: integer;
begin
	dMinimo.codigoP:= 99;
	for i:= 1 to generoMax do begin
		if (V[i] <> nil) then begin
			if (V[i]^.dato.codigoP < dMinimo.codigoP) then begin
				dMinimo:= V[i]^.dato;
				iMin:= i;	
		end; end;
	end;
	if (dMinimo.codigoP <> 99) then begin
		V[iMin]:= V[iMin]^.sig; 
		end;
end;

procedure insertarAtras (var L, LU: lista; dMinimo: pelicula);
var
	nuevo: lista;
	
begin
	new(nuevo); nuevo^.dato:= dMinimo; nuevo^.sig:= nil;
	if ( L = nil) then begin
		L:= nuevo; LU:= nuevo;
	end else begin
		LU^.sig:= nuevo;
		LU:= nuevo;		
	end;	
end;


procedure merge (V:grupoGeneros;var L: lista);
var
	dMinimo: pelicula; LU: lista;
	preCodeP:integer;
begin
	LU:= nil;
	minimo (V, dMinimo);
	while (dMinimo.codigoP <> 99) do begin
		if	(preCodeP = nil) do
			preCode:= dMinimo.codigoP;
			
		else( dMinimo.codigoP 
	
	
	
		insertarAtras (L, LU, dMinimo);
		minimo (V, dMinimo);
end;	end;


procedure leerLista (L: lista);
begin 								
	if ( L <> nil ) then begin
		writeln ('');
		writeln ('El codigo pelicula es: ', L^.dato.codigoP);
		leerLista (L^.sig);	
	end;
end;


var
	V: grupoGeneros;
	L: lista;
begin
	L:= nil;
	cargarDatos(V); 
	merge (V, L);
	leerLista (L);

end.
