{3.- Un supermercado requiere el procesamiento de sus productos. 
* 	De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide:

a)	Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, 
*	 se requiere que la búsqueda de un producto por código sea lo más eficiente posible. 
*	 La lectura finaliza con el código de producto igual a -1..

b)	Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y 
* 	retorne si dicho código existe o no para ese rubro.
c)	Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro,
*  el código y stock del producto con mayor código.

d)	Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro,
*  la cantidad de productos con códigos entre los dos valores ingresados.
}
 


program P5E3;

type
	rango = 1..10;

	producto = record
		codigo: integer;
		rubro: rango;
		stock: integer;
		precio: real;
		end;
		
	lista = ^nodo;
	
	nodo = record
		dato: producto;
		sig: lista;
		end;
	
	vProductos = array [rango] of lista;
	
	vMaximos = array [rango] of producto;

procedure leerDatos (var D: producto);
begin
	randomize;
	write ('Inserte el CODIGO de producto: ');
//	read (D.codigo);
	D.codigo:= random (100) - 1;
	writeln (D.codigo);
	if (D.codigo <> -1) then begin
		write ('Inserte el RUBRO de producto: ');
	//	readln (D.rubro);
		D.rubro:= random (9) + 1;
		writeln (D.rubro);
		write ('Inserte cantidad de STOCK de producto: ');
	//	readln (D.stock);
		D.stock:= random (200);
		writeln (D.stock);
		Write ('Inserte el PRECIO de producto: ');
	//	readln (D.precio);
		D.precio:= random (999);
		writeln (D.precio:2:2);
	end;
end;

procedure insertarOrdenado (var L: lista; D: producto);
var
	nuevo, act, ant: lista;
begin
	new (nuevo); nuevo^.sig:= nil; nuevo^.dato:= D;
	act:= L;
	while (act <> nil) and (D.codigo < act^.dato.codigo) do begin
		ant:= act; act:= act^.sig;
	end;
	
	if (L = act) then begin
		nuevo^.sig:= L;	L:= nuevo;
	end else begin
		nuevo^.sig:= act;
		ant^.sig:= nuevo;
	end;	
end;


procedure crearVector(var V: vProductos);
var
	D: producto; i: integer;
begin
	for i:=0 to 8 do
		V[i]:= nil;
	leerDatos (D);
	while (D.codigo <> -1) do begin
		insertarOrdenado (V[D.rubro], D);
		leerDatos (D);
	end;
end;


procedure buscar (L: lista; busC: integer;var buscado : boolean);
begin
	if (L <> nil) and (buscado = False)then begin
		if (L^.dato.codigo = busC) then
			buscado:= True
		else begin
			buscar (L^.sig, busC, buscado);
			end;
	end; end;

function buscarProducto (V: vProductos):boolean;
var
	busC: integer; busR: rango; buscado: boolean;
begin
	write ('Inserte rubro del producto a buscar (1 a 8): ');
	readln (busR);
	write ('Inserte el codigo: ');
	readln (busC);
	buscado:= false;
	buscar (V[busR], busC, buscado);
	buscarProducto:= buscado;
end;


procedure buscarMayor (V: vProductos;var vMax: vMaximos );
var
	i: integer;
begin
	for i:=1 to 8 do begin
		vMax[i].codigo:= 0;
		if (V[i] <> nil) then
			vMax[i]:= V[i]^.dato;
		writeln ('El mayor codigo del rubro ',i,' es ',vMax[i].codigo);
	end;
end;


procedure insertarVector (L: lista; var lMin: lista; min, max: integer);
var
	nuevo: lista;
begin
	if (L <> nil) then begin
		if (min < L^.dato.codigo) and (L^.dato.codigo < max) then begin
			new (nuevo); nuevo^.dato:= L^.dato; nuevo^.sig:= lMin; lMin:= nuevo;
		end;
		insertarVector (L^.sig, lMin, min, max);
	end;	
end;



procedure buscarRango (V: vProductos; var vRango:vProductos);
var
	min, max, i: integer;
begin
	write ('Ingrese MINIMO del rango ');
	readln (min);
	write ('Ingrese MAXIMO del rango ');
	readln (max);
	for i:= 1 to 8 do begin
		vRango [i] := nil;
		insertarVector (V[i], vRango[i], min, max);
		if (vRango[i] <> nil) then
			writeln ('El primer valor en el rango del rubro ',
			 i, ' es ',vRango[i]^.dato.codigo);
end; end;


var
	V, vRango: vProductos; vMax:vMaximos;
begin
	crearVector (V);
	//buscarProducto (V);
	if ( buscarProducto(V) = True) then
		writeln ('El producto se encentra guardado')
	else
		writeln ('El poducto NO se encuentra guardado');
	buscarMayor(V, vMax);
	buscarRango (V, vRango);
end.

