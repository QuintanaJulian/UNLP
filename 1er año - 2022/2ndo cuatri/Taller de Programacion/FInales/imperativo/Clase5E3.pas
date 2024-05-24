program PC5E3;
const
	cantMaxRubros = 10;

type
	cantRubros = 1..cantMaxRubros;

	tipoProducto = record
		codigo: integer;
		rubro: cantRubros;
		stock: integer;
		precio: double;
	end;
	
	
	tipoArbol= ^nodo;
	
	nodo = record
		dato: tipoProducto;
		HI: tipoArbol;
		HD: tipoArbol;
	end;
	
	
	v_Rubros = array [cantRubros] of tipoArbol;
	
	
	
	tipoMaximos = record
		codigo: integer;
		stock: integer;
	end;
	
	v_Maximos = array [cantRubros] of tipoMaximos;
	
	v_Contador = array [cantRubros] of integer;
	
procedure leerDatosTeclado (var dato: tipoProducto);
begin
	write('Codigo de producto: ');
	readln (dato.codigo);
	if (dato.codigo <> -1) then begin
		write ('Rubro de producto: ');
		read (dato.rubro);
		dato.stock:= 10;
		dato.precio:= 9.99;
	end;
end;

procedure anadirDatoArbol (var A: tipoArbol; dato: tipoProducto);
var
	nuevo, actual, ant: tipoArbol;
begin
	new (nuevo); nuevo^.dato:= dato; nuevo^.HI:= nil; nuevo^.HD:= nil;
	
	if (A = nil) then
		A:= nuevo	
	else begin
		actual:= A;
		ant:= actual;
		while (actual <> nil) do begin
			ant:= actual;
			if (dato.codigo < actual^.dato.codigo) then
				actual:= actual^.HI
			else begin
				actual:= actual^.HD;
			end;
		end;
		if (dato.codigo < ant^.dato.codigo) then
			ant^.HI:= nuevo
		else
			ant^.HD := nuevo;
	
	end;
	
end;



procedure crearEstructuraDatos (var rubros: v_Rubros);
var
	nuevo: tipoProducto;
	i: integer;
begin
	for i:=1 to cantMaxRubros do
		rubros[i] := nil;
		

	leerDatosTeclado (nuevo);
	while (nuevo.codigo <> -1) do begin
		anadirDatoArbol (rubros[nuevo.rubro], nuevo);
		leerDatosTeclado (nuevo);
	end;

end;



function buscarPorCodigo (A: tipoArbol; codigo: integer): boolean;
begin
	if (A = nil) then
		buscarPorCodigo:= false
	else if (A^.dato.codigo = codigo) then
		buscarPorCodigo:= true
		else if (codigo < A^.dato.codigo)then
				buscarPorCodigo:= buscarPorCodigo (A^.HI, codigo)
			else buscarPorCodigo:= buscarPorCodigo (A^.HD, codigo);
end;


function buscarDato (rubros: v_Rubros): boolean;
var
	dato: tipoProducto;
begin
	writeln ('Ingrese datos del producto a buscar:');
	leerDatosTeclado (dato);
	
	buscarDato:= buscarPorCodigo (rubros[dato.rubro], dato.codigo);
	
end;


procedure encontrarMaximo (A: tipoArbol; var maximo: tipoProducto);
begin
	while (A^.HD <> nil) do
		A:= A^.HD;
	maximo:= A^.dato;
end;



procedure cargarMaximos (rubros: v_Rubros; var maximos: v_Maximos);
var
	maxFiltro: tipoMaximos;
	maxCompleto: tipoProducto;
	i: integer;
begin
	for i:=1 to cantMaxRubros do begin
		if (rubros[i] <> nil) then begin
			encontrarMaximo (rubros[i], maxCompleto);
			maxFiltro.codigo:= maxCompleto.codigo;
			maxFiltro.stock:= maxCompleto.stock;
			maximos[i]:= maxFiltro;
			writeln ('Cod maximo ', maximos[i].codigo , ' con stock ', maximos[i].stock );
		end else writeln ('La pos ', i, ' esta vacia por lo que no posee max' );
	end;
end;






function contarIntermedios (A: tipoArbol; min: integer; max: integer):integer;
var
	total: integer;
begin
	total:= 0;
	
	if (A <> nil) then begin
		//writeln ('Llegamos a ', A^.dato.codigo);
		if ((A^.dato.codigo > min) and (A^.dato.codigo < max)) then begin
			//writeln ('Entra al izquierdo y derecho');
			total:= 1;
			total:= total + contarIntermedios(A^.HI, min, max);
			total:= total + contarIntermedios(A^.HD, min, max);		
		end else if (A^.dato.codigo < min) then begin
			//writeln ('Entra al derecho');
			total:= contarIntermedios (A^.HD, min, max);
			end else begin
				//writeln ('Entra a la izquierda');
				total:= contarIntermedios (A^.HI, min, max);
			end;
	end;
	contarIntermedios:= total;
	//writeln ('Salimos de');
end;







	

procedure cargarIntermedios (rubros: v_Rubros; var contador: v_Contador);
var
	i, min, max, total: integer;
begin
	min:= 4;
	max:= 11;
	writeln ('Numerando valores entre', min, ' y ', max);
	
	for i:=1 to cantMaxRubros do begin
		total:= contarIntermedios (rubros[i], min, max);
		contador[i]:= total;
	end;

end;










var
	rubros: v_Rubros;
	maximos: v_Maximos;
	contador: v_Contador;
	i: integer;
begin
	crearEstructuraDatos (rubros);
	
	writeln (buscarDato (rubros));
	
	cargarMaximos (rubros, maximos);
	
	cargarIntermedios (rubros, contador);
	for i:=1 to 10 do
		writeln (contador[i]);


end.





















































	
