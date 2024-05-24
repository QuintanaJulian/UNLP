program PC5_E4;
const
	valorAlto = 9999;
	
type
	valorSemana = 1..7;
	
	dato = record
		dia: valorSemana;
		codigo: integer;
		asiento: integer;
		monto: double;
	end;
		

	lista = ^nodo;
	
	nodo = record
		dato: dato;
		sig: lista;
	end;
	
	
	v_Semana = array [1..7] of lista;
	

procedure insertarOrdenado(dato: dato; var L: lista);
var
	ant, actual: lista;
	nuevo: lista;
begin
	new (nuevo); nuevo^.sig:= nil; nuevo^.dato:= dato;
	ant:= L;
	actual:= L;
	
	while ((actual <> nil) and (actual^.dato.codigo < dato.codigo)) do begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	
	if (ant = actual) then begin
		nuevo^.sig:= L;
		L:= nuevo;	
	end else begin
		nuevo^.sig := actual;
		ant^.sig := nuevo;
	end;
end;



procedure leerDatoTeclado (var dato:dato);
begin
	write ('ingrese codigo de la obra: ');
	readln (dato.codigo);
	if (dato.codigo <> 0) then begin
		write ('dia de la obra');
		readln (dato.dia);
		dato.monto:= 99.9;
		dato.asiento:= 5;
		
	end;
end;


procedure cargarDatos (var semana: v_Semana);
var
 datos: dato;
 i: integer;
begin
	for i:= 1 to 7 do
		semana[i]:= nil;

	leerDatoTeclado (datos);
	while (datos.codigo <> 0) do begin
		insertarOrdenado (datos, semana[datos.dia]);
		leerDatoTeclado (datos);
	end;
end;




procedure buscarMinimo (var semana: v_Semana; var minimo: dato);
var
	actual: dato;
	i: integer;
begin
	minimo.codigo:= valorAlto;
	for i:=1 to 7 do begin
		if (semana[i] <> nil) then begin
			actual:= semana[i]^.dato;
			if (actual.codigo < minimo.codigo) then
				minimo := actual;
		end;
	end;
	
	if (minimo.codigo <> valorAlto) then begin
		semana[minimo.dia]:= semana[minimo.dia]^.sig;
	end;
	
end;


procedure mergeListas (semana: v_Semana;var total: lista);
var
	actual, minimo: dato;
	
begin
	
	buscarMinimo (semana, minimo);
	writeln ('salgo de buscar min');
	
	while (minimo.codigo <> valorAlto) do begin
		actual:= minimo;
		actual.asiento:= 1;
		buscarMinimo (semana, minimo);
		
		while (minimo.codigo = actual.codigo) do begin
			actual.asiento:= actual.asiento + 1;
			buscarMinimo (semana, minimo);
		end;
		
		insertarOrdenado (actual, total);
				
	end;
end;



var
	semana: v_Semana;
	total, actual: lista;
begin
	
	cargarDatos (semana);
	mergeListas (semana, total);
	writeln ('Llegue a salir merge');
	actual := total;
	while (actual <> nil) do begin
		writeln (actual^.dato.codigo);
		writeln (actual^.dato.asiento);
		actual := actual^.sig;
	
	end;


end.


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
