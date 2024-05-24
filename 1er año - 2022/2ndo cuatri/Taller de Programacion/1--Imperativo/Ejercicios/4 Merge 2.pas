{
2.	Un cine posee la lista de películas que proyectará durante el mes de octubre.
	De cada película se conoce: código de película, código de género 
	(1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) 
	y puntaje promedio otorgado por las críticas. Implementar un programa que contenga:
	
a.	Un módulo que lea los datos de películas y los almacene ordenados por código de película
	y agrupados por código de género, en una estructura de datos adecuada. 
	La lectura finaliza se lee el código de película -1. 

b.	Un módulo que reciba la estructura generada en el punto a y retorne una estructura de datos 
 	donde estén todas las películas almacenadas ordenadas por código de película.
}


program c4e2;
const
	generoMax = 8;

type
	cantGeneros = 1..generoMax;
		
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
	write ('Ingrese el codigo de la pelicula: ');
	//readln (D.codigoP);
	D.codigoP:= random(9) -1;
	writeln (D.codigoP);
	if (D.codigoP <> -1) then begin
	random;
	write ('Ingrese el codigo de genero (1 a 8): ');
	//readln (D.codigoG);
	D.codigoG:= random(8);
	writeln (D.codigoG);
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
	while (D.codigoP <> -1) do begin
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
begin
	LU:= nil;
	minimo (V, dMinimo);
	while (dMinimo.codigoP <> 99) do begin
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
