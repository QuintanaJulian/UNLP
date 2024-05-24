program P7_E14;

const
	ultDia = 31;

type

diasMes = 1..ultDia;

tipoPrestamo= record
	Prestamo: integer;
	ISBN: integer;
	Socio: integer;
	Dia: diasMes;
end;

tipoLibro = record
	ISBN: integer;
	Prestamos: integer;
end;

lista = ^nodo;

nodo = record
	dato: tipoPrestamo;
	sig: lista;
	end;
	
lista2 = ^nodo2;

nodo2 = record
	dato: tipoLibro;
	sig: lista2;
	end;
	
PrestamosMes = array [1..ultDia] of integer;

procedure InsertarAtras (var PI: lista; var PU: lista; dato: tipoPrestamo);
var
	nuevo: lista;
begin
	new (nuevo); nuevo^.dato:= dato; nuevo^.sig:= nil;
	if (PI = nil) then begin
		PI:= nuevo;
		PU:= nuevo;
	end
	else begin
		PU^.sig:= nuevo;
		PU:= nuevo;
	end
end;

procedure CargarDatos (var PI: lista);
var
	PU: lista;
	dato: tipoPrestamo;
begin
	PI:= nil;
	dato.ISBN:= 0;
	while (dato.ISBN <> -1) do begin
		readln (dato.ISBN);
		if (dato.ISBN <> -1) then begin
			dato.Prestamo:= random (999);
			dato.Socio:= random (9999);
			dato.Dia:= random (ultDia - 1) + 1;
			writeln ('Nro prestamo: ', dato.Prestamo, ', Nro Socio: ', dato.Socio, ', dia ', dato.Dia );
			InsertarAtras (PI, PU, dato);
		end;
	end;	
end;

procedure InsertarAtras2 (var PI: lista2; var PU: lista2; dato: tipoLibro);
var
	nuevo: lista2;
begin
	new (nuevo); nuevo^.dato:= dato; nuevo^.sig:= nil;
	if (PI = nil) then begin
		PI:= nuevo;
		PU:= nuevo;
	end
	else begin
		PU^.sig:= nuevo;
		PU:= nuevo;
	end;
end;

procedure BuscarDIaMinimo (V: PrestamosMes; var diaMin: integer);
var
	i,  valorMin: integer;
begin
	valorMin:= 999;
	for i:=1 to ultDia do begin
		if V[i] < valorMin then begin
			valorMin:= V[i];
			diaMin:= i;
		end;
end;
end;

function EsPar (valor: integer): boolean;
begin
	EsPar:= false;
	valor:= valor mod 10;
	if ((valor mod 2) = 0) then
		EsPar:= true;
end;

procedure ContarPorcentaje (dato: tipoPrestamo; var cumple: integer);
var
	prestamo, socio: boolean;
begin
	prestamo:= EsPar(dato.Prestamo);
	socio:= EsPar (dato.Socio);
	if (prestamo = false) and (socio = true) then
		cumple:= cumple + 1;
end;

procedure AnalizarDatos (L: lista; var L2: lista2);
var
	PU: lista2;
	porcentaje: real;
	prestamos, cumplen, diaMin: integer;
	V:  PrestamosMes;
	act: tipoLibro;
begin
	for cumplen:= 1 to ultDia do
		V[cumplen]:= 0;
	cumplen:= 0;
	prestamos:= 0;
	L2:= nil;
	act.Prestamos:= 0;
	act.ISBN:= L^.dato.ISBN;
	while (L <> nil) do begin
		if  (act.ISBN = L^.dato.ISBN) then
			act.Prestamos:= act.Prestamos + 1
		else begin
			InsertarAtras2 (L2, PU, act);
			act.Prestamos:=1;
			act.ISBN:= L^.dato.ISBN;
		end;
		
		V[L^.dato.Dia]:= V[L^.dato.Dia] + 1;
		
		ContarPorcentaje (L^.dato, cumplen);
		prestamos:= prestamos + 1;
		
		L:= L^.sig;
	end;
	InsertarAtras2 (L2, PU, act);
	
	BuscarDiaMinimo (V, diaMin);
	writeln ('El dia con menos prestamos de libros fue el dia ', diaMin);
	
	porcentaje:=  100  / prestamos ;
	porcentaje:= porcentaje * cumplen;
	writeln ('Un total de ', cumplen, ' prestamos cumplen, obteniendo un ', porcentaje:0:0, ' %.');
end;

var
	L: lista;
	L2: lista2;
begin
	CargarDatos (L);
	if (L <> nil) then
	AnalizarDatos (L, L2)
	else write ('No hubo ningun prestamo este mes.');
end.




























