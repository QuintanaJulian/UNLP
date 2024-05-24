program PC5E2;
const
	maxAno = 2018;
	minAno = 2010;
	cantAnos = (maxAno - minAno) + 1;

type
	rangoCantAnos = 1 .. cantAnos;
	rangoAnos = minAno .. maxAno;
	
	tipoAuto = record
		patente: String;
		ano: rangoAnos;
		marca: String;
		modelo: String;
	end;
	
	tipoArbol = ^nodo;
	
	nodo = record
		HD: tipoArbol;
		HI: tipoArbol;
		dato: tipoAuto;
	end;
	
	tipoLista = ^nodoL;
	
	nodoL = record
		sig: tipoLista;
		dato: tipoAuto;
	end;
	
	
	tipoArrayAno = array [minAno .. maxAno] of tipoLista;
	
	
procedure leerDatos (var dato: tipoAuto);
begin
	write ('Ingrese patente: ');
	readln (dato.patente);
	if (dato.patente <> '0') then begin
		write ('ingrese ano de fabricacion: ');
		readln (dato.ano);
		write ('Ingrese marca: ');
		//reanln (dato.marca);
		dato.marca := 'Ford';
		dato.modelo := '207';	
	end;
end;


procedure insertarNodo (var A: tipoArbol; dato: tipoAuto);
var
	encontrado: boolean;
	nuevo, actual: tipoArbol;
begin
	new (nuevo); nuevo^.dato:= dato; nuevo^.HD:= nil; nuevo^.HI:= nil;
	if (A <> nil) then begin
		actual := A;
		encontrado:= false;
		while (not encontrado) do begin
			if (dato.patente < actual^.dato.patente) then
				if (actual^.HD = nil) then begin
					actual^.HD:= nuevo;
					encontrado:= true;
				end else actual:= actual^.HD
			else if (actual^.HI = nil) then begin
					actual^.HI:= nuevo;
					encontrado := true;
				end else actual:= actual^.HI
		end;
	end else A:= nuevo;
	
end;

procedure crearArbol (var A: tipoArbol);
var
 dato: tipoAuto;
begin
	leerDatos (dato);
	while (dato.patente <> '0') do begin
		insertarNodo(A, dato);
		leerDatos (dato);
	end;
end;


function contarMarca (A: tipoArbol; marca: String):integer;
var
	aux: integer;
begin
	aux:= 0;
	if (A^.dato.marca =  marca) then
		aux:= aux + 1;
	if (A^.HD <> nil) then
		aux:= aux + contarMarca (A^.HD, marca);
	if (A^.HI <> nil) then
		aux:= aux + contarMarca (A^.HI, marca);
		
	contarMarca:= aux;
	
end;



procedure agregarDato (var L: tipoLista; dato: tipoAuto);
var
	nuevo: tipoLista;
begin
	new (nuevo); nuevo^.dato:= dato; nuevo^.sig:= nil;
	nuevo^.sig:= L;
	L:= nuevo;	
end;



procedure crearArrayModelos (A: tipoArbol; var V: tipoArrayAno);
var
	//actual, anterior: tipoArbol;
	dato: tipoAuto;
begin
	dato:= A^.dato;
	agregarDato ( V[dato.ano], dato );
	if (A^.HD <> nil) then
		crearArrayModelos (A^.HD, V);
	if (A^.HI <> nil) then
		crearArrayModelos (A^.HI, V);
	
	
end;



var 
 A: tipoArbol;
 V: tipoArrayAno;
 marca: String;
begin
	A:= nil;
	crearArbol (A);
	marca:= 'Ford';
	
	writeln ('Hay ' , contarMarca (A, marca), ' autos de la marca ', marca);
	
	crearArrayModelos (A, V);


end.





































