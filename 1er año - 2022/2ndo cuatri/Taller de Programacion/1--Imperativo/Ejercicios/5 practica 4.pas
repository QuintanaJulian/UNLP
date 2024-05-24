{4.- Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. 
Se desea procesar la información de una semana. Se pide:
a)	Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), 
* código de la obra, asiento, monto. La lectura finaliza con el código de obra igual a 0. 
* Las listas deben estar ordenadas por código de obra de forma ascendente.
* 
b)	Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. 
* Esta lista debe estar ordenada por código de obra de forma ascendente.
* 
c)	Realice un módulo recursivo que informe el contenido de la lista generada en b)
}

program P5E4;

type
	semana = 1..7;
	
	obras = record
		dia: semana;
		codigo: integer;
		asiento: integer;
		monto: real;
		end;
	
	lista = ^nodo;
	
	nodo = record
		dato: obras;
		sig: lista;
		end;
	
	vector = array [semana] of lista;
	
	obrasV = record
		codigo: integer;
		cant: integer;
	end;	
	
	lista2 = ^nodo2;
	
	nodo2= record
		dato: obrasV;
		sig: lista2;
	end;

procedure leerDatos (var D: obras);
begin
	randomize;
	write ('Ingrese el CODIGO de la obra: ');
//	readln (D.codigo);
	D.codigo:= random (10);
	writeln (D.codigo);
	if (D.codigo <> 0) then begin
		write ('Ingrese el DIA de la obra: ');
//		readln (D.dia);
		D.dia:= random (7)+1;
		writeln (D.dia);
		write ('Ingrese el ASIENTO de la obra: ');
//		readln (D.asiento);
		D.asiento:= random (100);
		writeln (D.asiento);
		write ('Ingrese el monto de la obra: ');
//		readln (D.monto);
		D.monto:= random (999);
		writeln (D.monto:2:2);
	end;
end;	

procedure insertarDatos (var L: lista; D:obras);
var
	nuevo, ant, act: lista;
begin
	new (nuevo); nuevo^.sig:= nil; nuevo^.dato:= D;
	act:= L;
	while (act <> nil) and (act^.dato.codigo < D.codigo) do begin
		ant:= act; act:= act^.sig;
		end;
	if (act = L) then begin
		nuevo^.sig:= L;
		L:= nuevo;
	end else begin
		ant^.sig:= nuevo;
		nuevo^.sig:= act;
		end;
		writeln (L^.dato.codigo);
end;


	
procedure cargarVector (var V: vector);
var
	D:obras;  i: integer;
begin
	for i:= 1 to 7 do
		V[i]:= nil;
	leerDatos (D);
	writeln (D.codigo);
	while (D.codigo <> 0) do begin
		insertarDatos (V[D.dia], D);
	//	writeln ('se guardo ', V[D.dia]^.dato.codigo, ' del dia ',V[D.dia]^.dato.dia);
		leerDatos (D);
	//	writeln ('Datos', D.codigo);
	end;	
//	for i:= 1 to 8 do begin
//		if (V[i] <> nil) then
	//		writeln ('este tiene: ',V [i]^.dato.codigo)
//			else 
	//			writeln (i, ' hasta aca llega -----');
//end;
end;


procedure insertarAtras (var L, LU: lista2; act: obrasV);
var
	nuevo:lista2;
begin
	new (nuevo); nuevo^.sig:= nil; nuevo^.dato:= act;
	if (L = nil) then begin
		L:= nuevo; LU:= nuevo; LU^.sig:= nil;
	end else begin
		LU^.sig:= nuevo; LU:= nuevo;
	end;	
end;

procedure minimo (var V: vector; var min: integer);
var
	i, iMin: integer; 
begin
	min:= 999;
	for i:=1 to 7 do begin
		if (V[i] <> nil) then begin
			if (V[i]^.dato.codigo <= min) then begin
				iMin:= i; 	min:= V[i]^.dato.codigo;
		end; 
	end;
	end;
	if (min <> 999) then begin
		V[iMin]:= V[iMin]^.sig;
		//write ('Min pasado ',min);
	end;
end;

procedure mergeContador (V: vector;var L: lista2);
var
	act: obrasV; min: integer; LU: lista2;
begin
	act.cant:= 0;
	act.codigo:= 999;
	minimo (V, min);
	while (min <> 999) do begin
		act.cant:= 0;  act.codigo:= min;
		while (min = act.codigo) do begin
			act.cant:= act.cant + 1;
			minimo (V, min);
			end;
			insertarAtras (L, LU, act);
			end;
		
	//	write ('AYUDAAAAAAA 5');
//write ('AYUDAAAAAAA 6');
end;

procedure leerLista (L: lista2);
	begin
		writeln ('');
		if (L <> nil) then begin
			writeln (L^.dato.cant, ' veces el codigo ',L^.dato.codigo );
			leerLista (L^.sig);
		end;	
	end;

var
	V: vector; L: lista2;
begin
	cargarVector(V);
	mergeContador (V, L);
	leerLista (L)
end.
