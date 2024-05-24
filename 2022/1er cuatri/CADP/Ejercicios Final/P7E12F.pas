program P7E12F;
const
	maxSuscripciones = 4;

type
	cantSuscripciones= 1..maxSuscripciones;
	
	datosCliente = record
		Nombre: String;
		Edad: integer;
		DNI: integer;
		end;
		
	lSuscripciones =  ^nodo;
	
	nodo = record
		dato: datosCliente;
		sig: lSuscripciones;
		end;
		
	vSuscripciones = array [1..maxSuscripciones] of lSuscripciones;	
	
	datos40 = record
		Nombre: String;
		DNI: integer;
		end;
		
	lista = ^nodo2;
	
	nodo2 = record
		dato: datos40;
		sig: lista;
		end;
	
	vContadorSocios = array [1..maxSuscripciones] of integer;
		
	vPrecios = array [1..maxSuscripciones] of real;
	
procedure  CargarTarifas (var precios: vPrecios);
var
	i: integer;
	base: real;
begin
	write ('Precio base: ');
	read (base);
	for i:= 1 to maxSuscripciones do
		precios[i]:= base * i ;	
end;		
		
		
procedure InsertarAdelante (var L: lSuscripciones; dato: datosCliente );
var
	nuevo: lSuscripciones;
begin
	new (nuevo);  nuevo^.dato:= dato;
	nuevo^.sig:= L;
	L:= nuevo;	
end;
		
procedure CargarDatos (var V: vSuscripciones);
var
	i: integer;
	dato: datosCliente;
begin
	for i:= 1 to maxSuscripciones do
		V[i]:= nil;
	dato.DNI:= -1;
	while 	dato.DNI <> 0 do begin
		write ('DNI: ');
		readln (dato.DNI);
		if (dato.DNI <> 0) then begin
			dato.Nombre:= 'Julian';
			dato.Edad:= random(80) +10;
			i:= random (3) + 1;
			writeln ('Nombre: ', dato.Nombre, ', Edad: ', dato.Edad, ', Tipo de suscripcion: ', i);
			InsertarAdelante (V[i], dato);		
		end;
	end;
end;
		
procedure ContarMaximos (V: vContadorSocios);
var
	i, valor1, valor2: integer;
	susc1, susc2: integer;
begin
	valor1:= 0;
	valor2:= 0;
	susc1:= -1;
	susc2:= -1;
	for i:= 1 to 4 do begin
		if V[i] > valor1 then begin
			valor2:= valor1;
			susc2:= susc1;
			valor1:= V[i];
			susc1:= i;
		end
		else if V[i]> valor2 then begin
			valor2:= V[i];
			susc2:= i;
		end;
	end; 
	
	writeln ('El tipo de suscripcion con mas inscriptos es el tipo ', susc1, ' con ', valor1, ' inscriptos, y el segundo ', susc2, ' con ', valor2, ' inscriptos.');
end;
		
procedure InsertarOrdenado (var L: lista; dato: datos40);
var
	nuevo, act, ant: lista;
begin

	new (nuevo); nuevo^.sig:= nil; nuevo^.dato:= dato;
	act:= L;
	
	while ((act <> nil) and (act^.dato.DNI < dato.DNI)) do begin
		ant:= act;
		act:= act^.sig;
	end;	
	
	if (act = L) then begin
		nuevo^.sig:= L;
		L:= nuevo;
	end
	else begin
		ant^.sig:= nuevo;
		nuevo^.sig:= act;
	end;
end;

procedure AnalizarDatos (V: vSuscripciones; precio: vPrecios; var lista40: lista );
var
	i: integer;
	L: lSuscripciones;
	ganancias: double;
	contador: vContadorSocios;
	dato40: datos40;
begin
	for i:= 1 to maxSuscripciones do
		contador[i]:= 0;
	lista40:= nil;
	ganancias:= 0;
	
	for i:= 1 to maxSuscripciones do begin
		L:= V[i];
		while (L <> nil) do begin
			ganancias:= ganancias + precio[i];
			contador[i]:= contador[i] + 1;
			if (((i = 3) or (i = 4)) and (L^.dato.Edad > 40)) then begin
				dato40.DNI:= L^.dato.DNI;
				dato40.Nombre:= L^.dato.Nombre;
				InsertarOrdenado (lista40, dato40);
				
			end;
			L:= L^.sig;
		end;
	end;
	ContarMaximos (contador);
	writeln ('Las ganancias totales de gimasio fueron de: ', ganancias:2:2, '$.');
end;

procedure LeerLista (L: lista);
begin
	while (L <> nil) do begin
		writeln (L^.dato.nombre, ' con DNI: ', L^.dato.DNI, ' CUMPLE con las condiciones.');
		L:= L^.sig;
	end;
end;


var
	precios: vPrecios;
	socios: vSuscripciones;
	mayores40: lista;
begin
	CargarTarifas (precios);
	CargarDatos (socios);
	AnalizarDatos (socios, precios, mayores40);
	LeerLista (mayores40);
end.


















		
		
