program parcialMauro;

//const
//	cantidadProductos = 20;
type 
	cantidadProductos = 1..20;
	
	clientes = record
		DNI: integer;
		producto: cantidadProductos;
		KG: real;
		end;
	
	lista = ^nodo;
	
	nodo = record
		dato: clientes;
		sig: lista;
		end;
	
	tipoProductos = record
		nombre: string;
		precioKG: real;
		end;

	productos = array [cantidadProductos] of tipoProductos;
	
	cantidadCompras = array [cantidadProductos] of integer;
	


procedure leerDatos (var dato:clientes);
begin
write ('DNI cliente: ');
readln (dato.DNI);

write ('Producto (1 a 20): ');
readln (dato.producto);
write ('KG comprados: ');
readln (dato.KG);
end;

procedure insertarOrdenado (VAR pI: lista; dato: clientes);
var	
	nuevo, actual, ant: lista;	
begin
	new (nuevo); nuevo^.dato:= dato; nuevo^.sig:= nil;
	actual:= pI; ant:= pI;
	
	while (actual <> nil) and (actual^.dato.dni < nuevo^.dato.dni) do begin
		ant:= actual;
		actual:= actual^.sig;
		
		end;
	if (pI = actual) then begin
		actual^.sig:= pI;
		pI:= actual;
		end
	else begin
		nuevo^.sig := ant^.sig;
		ant^.sig := nuevo;
	end;

end;


procedure cargarDatos (var pI:lista);
var
	dato: clientes;
begin
dato.DNI:= 0;
while ( dato.DNI <> -1) do begin
	leerDatos (dato);
	if (dato.DNI <> -1) then
		insertarOrdenado (pI, dato)
end;

end;





//procedure cargarProductos (VAR listaProductos: productos);

//SE DISPONE

//end;
procedure calcularGasto (dato: clientes; lista: productos; calcularGastos: real);
var
	aux: real; gasto: real;
begin
	aux:= lista [dato.producto].precioKG;
	gasto:= aux * dato.KG;
	calcularGastos:= gasto 
end; 


procedure menorGasto (dato: clientes; listaProductos: productos; VAR DNImenorGasto: integer; VAR menorGasto: real; VAR DNIant: integer; VAR gastoTemporal: real );
var
	calcularGastos: real;
begin
calcularGastos:= 0;
	if (dato.DNI = DNIant) and (gastoTemporal < menorGasto) then begin
		calcularGasto (dato, listaProductos, calcularGastos);
		gastoTemporal:= gastoTemporal + calcularGastos;
		end
	else begin 
		if (gastoTemporal < menorGasto) then begin
			DNImenorGasto:= DNIant;
			menorGasto:= gastoTemporal;
		end;
		DNIant:= dato.DNI;	
		calcularGasto (dato, listaProductos, calcularGastos);
		gastoTemporal:= calcularGastos;
end;
end;












procedure comprasXCategoria (dato: clientes; VAR comprasTotales: cantidadCompras);
begin
	comprasTotales [dato.producto]:= comprasTotales [dato.producto] + 1;
end;



procedure analisisDNI (DNI: integer; VAR comprasImpares: integer);
var
aux: integer;
impares: integer;
begin
impares:= 0; aux:= 0;
while (DNI <> 0) and (impares<=5) do begin
	aux:= DNI mod 10;
	DNI:= DNI div 10;
	if ((aux mod 2) <> 0) then 
		impares:= impares + 1
	end;
if (impares >= 5) then
	comprasImpares:= comprasImpares + 1;
end;





procedure analizarDatos (pI: lista; listaProductos: productos; VAR DNImenorgasto: integer; VAR comprasTotales: cantidadCompras; VAR comprasImpares: integer);
var
	menorGasto: real; DNIant: integer; gastoTemporal: real;


begin
menorGasto:= 0;		DNIant:= 0;		gastoTemporal:= 0; 
while (pI <> nil) do begin
	
	comprasXCategoria (pI^.dato , comprasTotales); 
	analisisDNI (pI^.dato.DNI , comprasImpares);
	menorGasto (pI^.dato, listaProductos, DNImenorgasto, menorGasto, DNIant, gastoTemporal);
	pI:= pI^.sig;
end; 

end;





var

pI: lista; listaProductos: productos;

DNImenorGasto: integer; comprasTotales: cantidadCompras; comprasImpares: integer;

begin
pI:=nil;  //listaProductos:= 0; DNImenorGasto:= 0; comprasTotales:= 0; comprasImpares:= 0;
//cargarProductos (listaProductos);
cargarDatos (pI);
analizarDatos (pI, listaProductos, DNImenorGasto, comprasTotales, comprasImpares);





end.
