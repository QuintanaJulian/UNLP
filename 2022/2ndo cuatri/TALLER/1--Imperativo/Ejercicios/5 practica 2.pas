{2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
* 
a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. 
			Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo.
b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 

c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.

d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado. 
}



program P5E2;

const
	modMin = 2010;
	modMax = 2018;


type
	//rangoMod = [modMin .. modMax] ;
	
	datos = record
		patente: integer;
		ano: integer;
		marca: string;
		modelo: string;
		end;
		
	arbol = ^nodo;
	
	nodo = record
		dato: datos;
		HI: arbol;
		HD: arbol;
		end;
		
	lista = ^nodo2;
	
	nodo2 = record
		dato: datos;
		sig: lista;
		end;
		
	vector = array [modMin..modMax] of lista;

procedure leerDatos (var D:datos);
begin
	randomize;
	write ('Inserte patente: ');
	readln (D.patente);
	if (D.patente <> 0)  then begin
		write ('Inserte ano fabricacion (2010 .. 2018): ');
		D.ano:= random (8) + 2010;
		writeln (D.ano);
	//	readln (D.ano);
		write ('Inserte marca: ');
		readln (D.marca);
		write ('Inserte modelo: ');
		readln (D.modelo);
end; end;

procedure insertarDatos (var A: arbol; D: datos);
begin
	if (A = nil) then begin
		new (A); A^.HD:= nil; A^.HI:= nil; A^.dato:= D;
	end
	else if (D.patente < A^.dato.patente) then
			insertarDatos (A^.HI, D)
			else insertarDatos (A^.HD, D)
end;


procedure crearArbol (var A:arbol);
var
	D: datos;
begin
	A:= nil;
	leerDatos (D);
	while (D.patente <> 0) do begin
		insertarDatos (A, D);
		leerDatos (D);	
		end;
end;

procedure recorrerArbol ( A: arbol; bus: integer; var contador: integer);
begin
	if (A <> nil ) then begin
	if  (A^.dato.patente = bus) then
		contador:= contador + 1;
	recorrerArbol (A^.HI, bus, contador);
	recorrerArbol(A^.HD, bus, contador);
	end;
end;

procedure contadorArbol (A: arbol);
var
	bus: integer; contador: integer;
begin
		contador := 0;
		write ('Insertar patente a buscar: ');
		readln (bus);
		recorrerArbol (A, bus, contador);
		writeln ('Dicha patente aparacio ',contador, ' veces.');
end;


procedure insertarAdelante (D: datos;var V: vector);
var
	nuevo: lista;
begin
	new (nuevo); nuevo^.dato:= D; nuevo^.sig:= nil;
	nuevo^.sig:= V[D.patente];
	V[D.patente]:= nuevo;	
end;



procedure agruparModelos (var A: arbol;var V: vector);
begin
		if (A <> nil) then begin
			agruparModelos (A^.HI, V);
			insertarAdelante (A^.dato, V);
			agruparModelos (A^.HD, V);
		end;
end;

procedure recorrerPatente (A: arbol; bus: integer; var ano: integer);
begin
	if (A <> nil) then begin 
		if (A^.dato.patente = bus) then
			ano:= A^.dato.ano
		else begin
			recorrerPatente (A^.HI, bus, ano);
			recorrerPatente (A^.HD, bus, ano);
		end;
	end;
end;


procedure buscarPatente (A: arbol; var ano: integer);
var
	bus: integer;
begin
	ano:= 0;
	write ('Inserte patente a buscar: ');
	read (bus);
	recorrerPatente (A, bus, ano);
	if (ano = 0) then 
		write ('ERROR 403: Dicha patente no esta en la base de datos')
		else
			write ('El vehiculo con patente', bus, 'fue fabricado en el ', ano);
	
	end;

var
	A: arbol; V: vector; ano: integer;
begin
	crearArbol (A);
	contadorArbol (A);
	agruparModelos (A, V);
	buscarPatente (A, ano);
end.
