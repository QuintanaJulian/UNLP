program f1nal_junio2019;


type

venta = record
	Codigo: integer;
	Producto: integer;
	Cantidad: integer;
	end;

lista = ^nodo;

nodo = record
	dato: venta;
	sig: lista;
	end;

procedure InsertarOrdenado (var L: lista; dato: venta);
var
	ant, act, nuevo: lista;
begin
	new (nuevo); nuevo^.dato:= dato; nuevo^.sig:= nil;
	act:= L;
	
	while (act <> nil) and (act^.dato.Producto < dato.Producto ) do begin
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


procedure CargarDatos (var L: lista);
var
	dato: venta;
begin
	L:= nil;
	dato.codigo:= 0;
	while (dato.Codigo <> 999) do begin
	//	write ('Insertar Codigo de venta: ');
//		readln (dato.Codigo);
		dato.Codigo:= random (999) + 1;
		if (dato.Codigo <> 999) then begin
			dato.Producto:= random (9999) + 1;
			dato.Cantidad:= random (49) + 1;
	//		writeln ('Producto: ', dato.Producto, ', Cantidad: ', dato.Cantidad);
			InsertarOrdenado (L, dato);
		end;
	end;
end;


function CantidadVendida (L: lista): integer;
var
	Producto: integer;
begin
	CantidadVendida:= 0;
	write ('Inserte Codigo del PRODUCTO buscado: ');
	readln (Producto);
	while (L <> nil) and (L^.dato.Producto <> Producto) do begin
		L:= L^.sig;
	end;
	
	while (L <> nil) and (L^.dato.Producto = Producto) do begin
		cantidadVendida:= CantidadVendida + L^.dato.Cantidad;
		L:= L^.sig;
	end;
	
	writeln ('El producto con codigo  ', Producto, ' tuvo un total de ', cantidadVendida, ' ventas.');
end;

procedure LeerLista (L: lista);
begin
	writeln (' 	|  ',  '   Codigo', ' 	|  ',  '  Producto', ' 	|  ',  '  Cantidad', '	|');
	while (L <> nil) do begin
		writeln (' 	|	', L^.dato.Codigo, ' 	|	', L^.dato.Producto, ' 	|	', L^.dato.Cantidad, '	|');
		L:= L^.sig;		
	end;
end;


var
	L: lista;
begin
	CargarDatos (L);
	LeerLista (L);
	writeln ('Tuvo ', CantidadVendida (L), ' ventas');
	
end.



















