{2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
Implementar un programa que:
a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener patente, año de fabricación (2010..2018), la marca y el modelo.
b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado. 
c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por año de fabricación.
d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado. 
}

program arboles;

type
	dato = record 
		numero: integer;
		dni: integer;
		end;
	
	arbol = ^nodo;
	
	nodo = record
		dato: dato;
		HI: arbol;
		HD: arbol;
		end;	
		
		lista = ^nodo2;
		
		nodo2 = record
			dato: dato;
			sig: lista;
		end;		
		
		aModelo= array [1..8] of lista;
		

procedure leerDatos (var D:dato);
begin
	randomize;
	write ('Ingrese DNI: ');
	D.dni:=  (random (8));
	writeln (D.dni);	
	if (D.dni <> 0) then begin	
	write ('Ingrese numero: ');
//	read (D.numero);
	D.numero:= (random (100));
	writeln (D.numero);
	end;
end;

procedure insertarDatos (var A, nuevo: arbol);
begin
	if ( A = nil) then
		A:= nuevo
		else if (nuevo^.dato.dni < A^.dato.dni ) then
			insertarDatos (A^.HI, nuevo)
			else
				insertarDatos (A^.HD, nuevo);
end;

procedure crearArbol (var A: arbol);
var
	D: dato;  nuevo: arbol;
begin
		A:= nil;
		leerDatos (D);
		while (D.dni <> 0) do begin
			new (nuevo); nuevo^.HI:= nil; nuevo^.HD:= nil; nuevo^.dato := D;
			insertarDatos (A, nuevo);
			leerDatos(D);
		end;
	end;


procedure contador (A: arbol; dato: integer; var cant: integer);
begin
	if (A <> nil) then begin
		contador (A^.HD, dato, cant);
		contador (A^.HI, dato, cant);
		
		if (A^.dato.numero = dato) then
			cant:= cant + 1;
end; end;



procedure insertarV (dato: dato; var V: aModelo);
var
	nuevo: lista;
begin
	new (nuevo); nuevo^.dato:=dato; 
	nuevo^.sig:= V[dato.dni]; 
	V[dato.dni] := nuevo;
	
end;

procedure crearVector (A: arbol; var V: aModelo);
begin
	if A <> nil then begin
		crearVector (A^.HD, V);
		InsertarV (A^.dato, V);
		crearVector (A^.HD, V);
		
	end;
end;


procedure ImprimirVector (v: aModelo);
var
   i: integer; dimL:integer;
begin
	dimL:= 7;
     writeln ('         -');
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write ('  Codigo:| ');
     for i:= 1 to dimL do begin
        write(v[i]^.dato.dni, ' | ');
     end;
     writeln;
     writeln;
     write ('Cantidad:| ');
     for i:= 1 to dimL do begin
        write(v[i]^.dato.numero, ' | ');
     end;
     writeln;
     write ('         -');
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;





var
	A: arbol; busc, cantDato: integer;		vectorModelos: aModelo;
begin
	crearArbol (A);
	
	cantDato:= 0;
	write ('Inserte numero a buscar en el arbol: ');
	read (busc);
	contador (A, busc, cantDato);
	write ('Dicho numero se encuenta ', cantDato, ' veces en el arbol.');
	
	crearVector (A, vectorModelos);
	ImprimirVector (vectorModelos);
end.

