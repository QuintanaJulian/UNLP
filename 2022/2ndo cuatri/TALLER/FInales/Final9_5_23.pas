program final_9_5_23;
const
	valorAlto = 100;
	maxCantRobots = 5;
	
type
	cantCalles = 1..100;
	cantRobots = 1..maxCantrobots;
	
	tipoDireccion = record
		Ca: cantCalles;
		Av: cantCalles;
		//Av: integer;
	end;
	
	tipoRobot = record
		Id: cantRobots;
		Flores: integer;
		Papeles: integer;
		Esq: tipoDireccion;
	end;
	
	tipoLista = ^nodo;
	
	nodo = record
		dato: tipoRobot;
		sig: tipoLista;
	end;
	
	
	tipoVRobot = array [cantRobots] of tipoLista;
	
	tipoRecuento = record
		Av: cantCalles;
		//Av: integer;
		Flores: integer;
		EsquinasV: integer;
	end;
	
	tipoLista2= ^nodo2;
	
	nodo2 = record
		dato: tipoRecuento;
		sig: tipoLista2;
	end;
		
	tipoArbol = ^nodo3;
	
	nodo3 = record
		dato: tipoRecuento;
		HD: tipoArbol;
		HI: tipoArbol;
	end;
		
	

procedure LeerDatos (var dato: tipoRobot);
begin
	write ('Id del robot: ');
	//readln (dato.Id);
	dato.Id:= (random (maxCantRobots)) + 1;
	dato.Flores:= random (10);
	dato.Papeles:= random (10);
	writeln ('posicion: ');
	write ('calle: ');
	//readln (dato.Esq.Ca);
	dato.Esq.Ca:= random (99);
	write ('avenida: ');
	//readln (dato.Esq.Av);
	dato.Esq.Av:= random (99);
	
	writeln ('Id', dato.Id, 'Flores: ', dato.Flores, ' y Papeles: ', dato.Papeles, ' en la avenida', dato.Esq.Av);
end;


procedure InsertarOrdenado (var L: tipoLista; dato: tipoRobot);
var
	nuevo: tipoLista;
	actual, ant: tipoLista;
begin
	new (nuevo); nuevo^.sig:= nil; nuevo^.dato:= dato;
	
	actual:= L;
	ant:= actual;
	
	while (actual <> nil) and (dato.Esq.Av > actual^.dato.Esq.Av) do begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	
	if (L = actual) then begin
		nuevo^.sig:= L;
		L:= nuevo;
	end else begin
		ant^.sig:= nuevo;
		nuevo^.sig:= actual; 
	end;
end;





procedure CargarDatos (var A: tipoVRobot);
var
	dato: tipoRobot;
	i: integer;
begin

	for i:=1 to maxCantRobots do
		A[i]:= nil;
	
	for i:= 1 to 100 do begin
		LeerDatos (dato);
		InsertarOrdenado (A[dato.Id], dato);
	end;
	
end;




procedure SacarMinimo (var A: tipoVRobot; var minimo: tipoRobot);
var
	i, posMin, avMin: integer;
begin
	
	avMin:= valorAlto;
	
	for i:=1 to maxCantRobots do begin
		if (A[i] <> nil) and (A[i]^.dato.Esq.Av < avMin) then begin
			avMin:= A[i]^.dato.Esq.Av;
			posMin:= i;
		end;
	end; 
	
	if (avMin <> valorAlto) then begin
		minimo:= A[posMin]^.dato;
		A[posMin] := A[posMin]^.sig;
	end else minimo.Esq.Av:= valorAlto;
	
end;


procedure InsertarAtras (var L: tipoLista2; var LU: tipoLista2; dato: tipoRecuento);
var
	nuevo: tipoLista2;
begin
	new (nuevo); nuevo^.dato:= dato; nuevo^.sig:= nil;
	
	if (L = nil) then begin
		L:= nuevo;
		LU:= L;
	end else begin
		LU^.sig:= nuevo;
		LU:= LU^.sig;
	end;
end;




procedure UnificarLista ( var L: tipoLista2; V: tipoVRobot);
var
	minimo: tipoRobot;
	actual: tipoRecuento;
	LU: tipoLista2;
begin
	L:= nil;
	SacarMinimo (V, minimo);
	
	while (minimo.Esq.Av <> valorAlto) do begin
		actual.Av:= minimo.Esq.Av;
		actual.Flores:= minimo.Flores;
		if (minimo.Papeles = 0) then
			actual.EsquinasV:= 1
		else actual.EsquinasV:= 0;
		
		SacarMinimo (V, minimo);
		while (actual.Av = minimo.Esq.Av) do begin
			actual.Flores:= actual.Flores + minimo.Flores;
			if (minimo.Papeles = 0) then
				actual.EsquinasV:= actual.EsquinasV + 1;
			 SacarMinimo (V, minimo);
		end;
		writeln ('Isertando en avenida: ', actual.Av, ' con flors:', actual.Flores );
		InsertarAtras (L, LU, actual);
	end;
	
end;


procedure InsertarEnABB (A: tipoArbol; nuevo: tipoArbol);
begin
	if (nuevo^.dato.Flores < A^.dato.Flores) then
		if (A^.HI <> nil) then
			InsertarEnABB (A^.HI, nuevo)
		else A^.HI:= nuevo
	else if (A^.HD <> nil) then
		InsertarEnABB ( A^.HD, nuevo)
		else A^.HD := nuevo;
end;





procedure RecorrerLista (A: tipoArbol; L: tipoLista2);
var
	nuevo: tipoArbol;
begin
	new (nuevo); nuevo^.HD:= nil; nuevo^.HD:= nil; nuevo^.dato:= L^.dato;
	InsertarEnABB (A, nuevo);
	if (L^.sig <> nil) then
		RecorrerLista (A, L^.sig);
	
end;




procedure GenerarABB (var A: tipoArbol; L: tipoLista2);
var
	nuevo: tipoArbol;
begin
	if (L <> nil) then begin
		new (nuevo); nuevo^.HI:= nil; nuevo^.HD:= nil; nuevo^.dato:= L^.dato;
		A:= nuevo;
		RecorrerLista (A, L^.sig);
	end else writeln ('La estructura de datos provista esta vacia. No se puede generar nmingun Arbol.');
end;



procedure LeerArbol (A: tipoArbol; i: integer);
begin
	Writeln (A^.dato.Av, ' con flores: ', A^.dato.Flores, ' en el nivel ', i);
	if (A^.HI <> nil) then
		LeerArbol (A^.HI, (i+1));
	if (A^.HD <> nil) then
		LeerArbol (A^.HD, (i+1));
end; 





var
	V: tipoVRobot;
	L: tipoLista2;
	A: tipoArbol;
	
	Vaux: tipoLista;
	i: integer;
	aux: tipoLista2;
begin
	writeln ('Entrando a cargarDatos.');
	CargarDatos (V);
	for i:= 1 to maxCantRobots do begin
		if (V[i] <> nil) then begin
			Vaux:= V[i];
			while Vaux <> nil do begin
				writeln (i, ' posee: ', Vaux^.dato.Esq.Av, ' flores ', Vaux^.dato.Flores);
				Vaux:= Vaux^.sig;
			end;
			writeln ('----------------------------------------------');
		end;
	end;
	
	
	writeln ('Entrando a Unificar Datos.');
	UnificarLista (L, V);
	aux:= L;
	while aux <> nil do begin
		writeln (aux^.dato.Av, 'con flores ', aux^.dato.Flores);
		aux:= aux^.sig;
	end;
	
	
	writeln ('Entrando a Crear ABB.');
	GenerarABB (A, L);
	
	LeerArbol (A, 0);

end.





















