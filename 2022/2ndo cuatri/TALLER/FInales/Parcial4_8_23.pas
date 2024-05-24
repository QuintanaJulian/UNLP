{
La municipalidad de la ciudad de La Plata necesita un sistema que le permita recolectar las denuncias realizadas por los ciudadanos.
La denuncia la hace cualquier ciudadano y al hacerlo debe proporcionar la categoría de denuncia 
(1: corte de luz en la vía pública; 2: auto mal estacionado; 3: recolección de residuos; 4: ruidos molestos; 
5: semáforo en malfuncionamiento; 6: bache en la calle), su DNI, la dirección (número de calle y número de altura) y el mes, día y hora.



Implemente en pascal:

a) Un módulo que genere el alta de todas las denuncias almacenando toda la información en una estructura
agrupada por categoría y ordenada por número de calle. La carga finaliza hasta leer el DNI igual a cero.

b) Un módulo que reciba la estructura generada en a) y devuelva una lista de denuncias donde para cada número de calle se 
contabilice cantidad de denuncias totales y cantidad de denuncias realizadas en el mes de julio.

c) Un módulo recursivo que reciba la estructura generada en b) y devuelva el número de calle con mayor cantidad
de denuncias totales.
}



program Parcial4_8_23;

const
	valorAlto = 9999;
	maxCantCategorias = 6;
type
	
	
	cantCategorias = 1..maxCantCategorias;
	
	tipoDireccion = record
		calle: integer;
		altura: integer;
		end;
	
	tipoFecha = record
		mes: string;
		dia: integer;
		hora: integer;
		end;
	

	tipoDenuncia = record
		categoria: cantCategorias;
		DNI: integer;
		direccion: tipoDireccion;
		fecha: tipoFecha;
		end;
		
		
	tipoLista = ^nodo;
	
	nodo = record
		dato: tipoDenuncia;
		sig: tipoLista;
		end;
		
	tipoVectorCategorias = array [cantCategorias] of tipoLista;
	
	
	tipoContador = record
		calle: integer;
		cantidad: integer;
		end;
	
	
	tipoListaContadora = ^nodo2;
	
	nodo2 = record
		dato: tipoContador;
		sig: tipoListaContadora;
		end;
		
procedure leerDatos (var denuncia: tipoDenuncia);
begin
	write ('Ingrese su DNI: ');
	readln (denuncia.DNI);
	if (denuncia.DNI <> 0) then  begin
		write ('Inserte numero de categoria de reclamo (1 to 6)');
		readln (denuncia.categoria);
		write ('Ingrese su calle');
		readln (denuncia.direccion.calle);
	end;
end;

procedure insertarDatos (var lista: tipoLista; dato: tipoDenuncia);
var
	nuevo, ant, act: tipoLista;
begin
	new (nuevo); nuevo^.dato:= dato;  nuevo^.sig := nil;
	act:= lista;
	while ((act <> nil) and (act^.dato.direccion.calle < dato.direccion.calle)) do begin
		ant:= act;
		act:= act^.sig;
	end;
	
	if (act = lista) then begin
		nuevo^.sig:= lista;
		lista:= nuevo;
	end else begin
		nuevo^.sig:= act;
		ant^.sig := nuevo;
	end
end;



procedure cargarDatos (var v_Categorias: tipoVectorCategorias);
var
	nuevo: tipoDenuncia;
	i: integer;
begin
	for i:=1 to maxCantCategorias do begin
		v_Categorias[i]:= nil;		
	end;
	
	leerDatos (nuevo);
	while (nuevo.DNI <> 0) do begin
		insertarDatos (v_Categorias[nuevo.categoria], nuevo);
		leerDatos(nuevo);
	end;
end;


procedure buscarMinimo (var vector: tipoVectorCategorias; var minimo: tipoDenuncia);
var
	catMinima, calleMinima, i: integer;
begin
	calleMinima:= valorAlto;

	//writeln ('Buscando minimo ');
	for i:=1 to maxCantCategorias do begin
		if ((vector[i] <> nil) and (vector[i]^.dato.direccion.calle < calleMinima)) then begin
			calleMinima:= vector[i]^.dato.direccion.calle;
			catMinima := i;			
		end;
	end;
	
	if (calleMinima <> valorAlto) then begin
		minimo := vector[catMinima]^.dato;
		vector[catMinima] := vector[catMinima]^.sig;
	end else minimo.direccion.calle:= valorAlto;

end;


procedure agregarLista (var lista: tipoListaContadora; dato: tipoContador);
var
 nuevo: tipoListaContadora;
begin
	new (nuevo); nuevo^.dato:= dato; 
	nuevo^.sig:= lista;
	lista:= nuevo;
end;



procedure analizarDatos (vector: tipoVectorCategorias; var listaContadora: tipoListaContadora; var denunciasJulio: integer);
var
	actual: tipoDenuncia;
	anterior: tipoContador;
begin
	listaContadora:= nil;
	denunciasJulio:= 0;
	
	buscarMinimo (vector, actual);
	if (actual.fecha.mes = 'Julio') then denunciasJulio:= denunciasJulio + 1;
	
	while (actual.direccion.calle <> valorAlto) do begin
		anterior.calle:= actual.direccion.calle;
		anterior.cantidad:= 1;
		buscarMinimo (vector, actual);
		if (actual.fecha.mes = 'Julio') then denunciasJulio:= denunciasJulio + 1;
		while (anterior.calle = actual.direccion.calle) do begin
			anterior.cantidad:= anterior.cantidad + 1;
			buscarMinimo (vector, actual);
			if (actual.fecha.mes = 'Julio') then denunciasJulio:= denunciasJulio + 1;
		end;
		agregarLista (listaContadora, anterior);
	end;
	
	
end;


function recorrerLista (L: tipoListaContadora; max: tipoContador) : integer;
begin
	if (max.cantidad < L^.dato.cantidad) then
		max := L^.dato;
	
	if (L^.sig <> nil) then
		recorrerLista:= recorrerLista (L^.sig, max)
	else recorrerLista:= max.calle;
end;



function calcularCalleMaxima ( L : tipoListaContadora): integer;
var
	max: tipoContador;
begin
	if (L <> nil) then begin
		max.calle :=  L^.dato.calle;
		max.cantidad := L^.dato.cantidad;
		if (L^.sig <> nil) then
			max.calle:= recorrerLista (L^.sig, max);
	end else max.calle:= valorAlto;
	calcularCalleMaxima := max.calle;
end;




var
	v_Datos: tipoVectorCategorias;
	listaContadora: tipoListaContadora;
	denunciasJulio, calleMaxima: integer;
	i: integer;
begin
	cargarDatos (v_Datos);
	
	writeln ('saliendo de cargar datos');
	
	for i:= 1 to maxCantCategorias do begin
		if (v_Datos[i] <> nil) then
		writeln (i , ' ' , v_Datos[i]^.dato.DNI);
	end;
	
	writeln ('Entradno a analizar datos ');
	analizarDatos (v_Datos, listaContadora, denunciasJulio);
	
	writeln ('saliendo de analizar datos y entrando a calle maxima');
	calleMaxima := calcularCalleMaxima( listaContadora );
	
	writeln ('saliendo de calle maxima');
	
	while (listaContadora <> nil) do begin
		writeln (listaContadora^.dato.calle , ' ' , listaContadora^.dato.cantidad);
		listaContadora := listaContadora^.sig;
	end;
	
	
	writeln ('La calle maxima es: ' , calleMaxima);
	
	
	
end.















