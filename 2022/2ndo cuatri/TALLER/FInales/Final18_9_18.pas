program parcial_18_9_18;

const
	valorAlto = 999;
	
type 
	
	tipoPedido = record
		Fecha: String;
		Monto: double;
	end;


	tipoLista = ^nodoL;
	
	nodoL = record
		dato: tipoPedido;
		sig: tipoLista;
	end;


	tipoUsuario = record
		DNI: integer;
		Nombre: String;
		Pedidos: tipoLista;
	end;
	
	
	
	tipoArbol= ^nodoA;
	
	nodoA = record
		dato: tipoUsuario;
		HI: tipoArbol;
		HD: tipoArbol;
	end;
	
procedure LeerDatosMin (var nUsuario: tipoUsuario; var nPedido: tipoPedido);
begin
	write ('Ingrese DNI del cliente: ');
	readln (nUsuario.DNI);
	write ('Ingrese fecha de pedido: ');
	readln (nPedido.Fecha);
	write ('Ingrese monto del pedido: ');
	readln (nPedido.Monto);
	nUsuario.Pedidos:= nil;
end;

procedure LeerDatosExtra (var nUsuario: tipoUsuario);
begin
	writeln ('El usuario ingresado es nuevo. ');
	write ('Ingrese su nombre: ');
	readln (nUsuario.Nombre);

end;


procedure BuscarCliente (var A: tipoArbol; DNI: integer);
var
	anterior: tipoArbol;
begin
	anterior:= A;
	while (A <> nil) and (A^.dato.DNI <> DNI) do begin
		anterior:= A;
		if (DNI < A^.dato.DNI) then
			A:= A^.HI
		else A:= A^.HD;
	end;
	
	if (A = nil) then A:= anterior;
end;


procedure NuevaLista (var L: tipoLista; nPedidos: tipoPedido);
begin
	new (L); L^.sig:= nil; 	L^.dato:= nPedidos;
end;


procedure InsertarNodo (var A: tipoArbol; dato: tipoUsuario);
begin
	new (A); A^.dato := dato; A^.HD:= nil; A^.HI:= nil;
end;

procedure InsertarLista (var L: tipoLista; dato: tipoPedido);
var
	nuevo: tipoLista;
begin
	new (nuevo); nuevo^.dato:= dato; 
	
	nuevo^.sig:= L;
	L:= nuevo;
end;







procedure cargarDatos (var A: tipoArbol);
var
	nUsuario: tipoUsuario;
	nPedido: tipoPedido;
	actual: tipoArbol;
begin
	A:= nil;
	actual:= A;
	
	LeerDatosMin (nUsuario, nPedido);
	
	while (nPedido.Monto <> 0) do begin
		BuscarCliente (actual, nUsuario.DNI);
		if (actual = nil) or (actual^.dato.DNI <> nUsuario.DNI) then begin
			LeerDatosExtra (nUsuario);
			NuevaLista (nUsuario.Pedidos, nPedido);
			if (actual = nil) then
				InsertarNodo (A, nUsuario)
			else if (nUsuario.DNI < actual^.dato.DNI) then
					InsertarNodo (actual^.HI, nUsuario)
				else InsertarNodo (actual^.HD, nUsuario);
			
				
		end else
			InsertarLista (actual^.dato.Pedidos, nPedido);
			
		LeerDatosMin (nUsuario, nPedido);
		actual:= A;
	end;
end;




function ContadorPedidos (A: tipoArbol; fecha: String): integer;
var
	contador: integer;
	L: tipoLista;
begin
	contador:= 0;
	L:= A^.dato.Pedidos;
	while (L <> nil) do begin
		if (L^.dato.Fecha = fecha) then
			contador:= contador + 1;
		L:= L^.sig;
	end;
	
	if (A^.HD <> nil) then
		contador:= contador + ContadorPedidos (A^.HD, fecha);
	if (A^.HI <> nil) then
		contador:= contador + ContadorPedidos (A^.HI, fecha);
	
	ContadorPedidos:= contador;
end;



procedure ContarPedidosFecha (A: tipoArbol);
var
	fecha: String;
	ventas: integer;
begin
	if (A <> nil) then begin
		write ('ingrese fecha de la que quiere contar las ventas');
		readln (fecha);
		ventas:= ContadorPedidos (A, fecha);
		writeln ('Se registraron ', ventas, ' ventas en la fecha ', fecha);
	end else writeln ('No hay ninguna venta registrada. ');
end;





procedure ContarUsuario (A: tipoArbol);
var
	DNI, cantPedidos: integer;
	precioT: double;
	L: tipoLista;
begin
	if (A <> nil) then begin
		precioT:= 0;
		cantPedidos:= 0;
		
		write ('Ingrese DNI del Usuario a buscar y contabilizar: ');
		readln (DNI);
		while (A^.dato.DNI <> DNI) do begin
			if (DNI < A^.dato.DNI) then  
				if (A^.HI <> nil) then A:= A^.HI
			else if (A^.HD <> nil) then A:= A^.HD;
		end;
		
		if (A^.dato.DNI = DNI) then begin
			L:= A^.dato.Pedidos;
			while (L <> nil) do begin
				precioT:= precioT + L^.dato.Monto;
				cantPedidos:= cantPedidos + 1;
				L:= L^.sig;
			end;
			
			writeln ('El DNI ', DNI, ' pidio ', cantPedidos, ' gastando un total de ', precioT:2:2);
			
		end else writeln ('El DNI del usuario buscado no se encontro en la BD.');
		
		
	end else writeln ('La base de datos esta vacia. ');

end;


var
	A: tipoArbol;

begin
	cargarDatos (A);
	
	ContarPedidosFecha (A);
	
	ContarUsuario (A);
	
end.
















