program f1nal_2022;
const
	Requerido = 10;
type

cantidadCategorias= 1..5;


participantes = record
	DNI: integer;
	Nombre: String;
	Categoria: cantidadCategorias;
	Inscripcion: string;
	end;

vectorInscriptos = array [0..5000] of participantes;

inscriptosPorCategoria = array [cantidadCategorias] of integer;

lista = ^nodo;

nodo = record
	dato: participantes;
	sig: lista;
	end;

procedure cargarParticipantes (var V: vectorInscriptos; var dimL: integer);
var
	dato: participantes;
begin
	dato.DNI:= 0;
	dimL:= 1;
	while ( dato.DNI <> -1) and (dimL < 5000)do begin
	//	read (dato.DNI);
		dato.DNI:= random (9999) - 1;
		dato.Nombre:= 'zzz';
		dato.Categoria:= random (5) + 1;
		dato.Inscripcion:= '11/11/2202' ;
		V [dimL]:= dato;
		dimL:= dimL + 1;
	//	writeln ('categoria: ', dato.categoria);
	end;
end;

procedure contarCategorias (var cat: inscriptosPorCategoria; ins: vectorInscriptos; dimL: integer);
var
	catAprov, catActual, i: integer;
begin
	for i:= 1 to 5 do
		cat[i]:= 0;
	catAprov:= 0;
	i:= 1;
	while (i < dimL) and (catAprov < 5) do begin
		catActual:= ins[i].Categoria;
		cat[catActual]:= cat[catActual] + 1;
		if (cat[catActual] = Requerido) then
			catAprov:= catAprov + 1;	
		i:= i + 1;
	end;
	for i:= 1 to 5 do
		writeln ('La categoria ', i, ' tuvo ', cat[i] ,' inscriptos.')
end;


procedure insertarAtras (var L: lista; var LU: lista; dato: participantes);
var
	nuevo: lista;
begin
	new (nuevo); nuevo^.dato:= dato; nuevo^.sig:= nil;
	if (L = nil) then begin
		L:= nuevo; 
		LU:= nuevo;
	end
	else begin
		LU^.sig:= nuevo;
		LU:= nuevo;	
		end;
end;

procedure insertarOrdenado (var L: lista; dato: participantes);
var
	nuevo, act, ant: lista;
begin

	new (nuevo); nuevo^.sig:= nil; nuevo^.dato:= dato;
	act:= L;
	while (act <> nil) and (act^.dato.Categoria < dato.Categoria )  do begin
		ant:= act;
		act:= act^.sig;
	end;
	
	if (act = L) then begin
		nuevo^.sig := L;
		L:= nuevo;
	end
	else begin
		ant^.sig := nuevo;
		nuevo^.sig:= act;
	end;
end;


procedure crearLista (var L: lista; categoria: inscriptosPorCategoria; inscriptos: vectorInscriptos; dimL: integer);
var
//	LU: lista;
	i: integer;
begin
	L:= nil;
	i:= 1;
	while (i < dimL) do begin
		if (categoria[inscriptos[i].Categoria] >= Requerido) then
			//insertarAtras (L, LU, inscriptos[i]);
			insertarOrdenado (L, inscriptos[i]);
		i:= i + 1;
	end;
end;

procedure leerLista (L: lista);
begin
	while (L <> nil) do begin
	writeln ('El DNI ', L^.dato.DNI, ' eligio categoria ', L^.dato.Categoria);
	L:= L^.sig;	
end;
end;

var
	dimL: integer;
	inscriptos: vectorInscriptos;
	categoria: inscriptosPorCategoria;
	L: lista;
begin
	cargarParticipantes (inscriptos, dimL);
	contarCategorias (categoria, inscriptos, dimL);
	crearLista (L, categoria, inscriptos, dimL);
	leerLista (L);
end.
