program P2E16;

const
	valorAlto= 9999;
	valorBajo =-9999;
	cantidadDetalles = 10;

type
	
	tipoFecha = record
		ano: integer;
		mes: integer;
		dia: integer;
	end;
	
	tipoDetalle = record
		Codigo: integer;
		Ventas: integer;
		Fecha: tipoFecha;
	end;
	
	tipoMaestro = record
		Codigo: integer;
		Fecha: tipoFecha;
		Nombre: String;
		Descripcion: String;
		Precio: double;
		Ejemplares: integer;
		Vendidos: integer;
	end;
	
	archivo_Detalle = file of tipoDetalle;
	
	vector_Archivo_Detalle = array [1..cantidadDetalles] of archivo_Detalle;
	
	archivo_Maestro = file of tipoMaestro;
	

procedure LeerDet (var a: archivo_Detalle; var dato: tipoDetalle);
begin
	if (not EOF(a)) then begin
		read (a, dato);
		Seek (a, FilePos(a) - 1);
	end else dato.Codigo:= valorAlto;
end;


function MismaFecha (a: tipoFecha; b: tipoFecha): boolean;
var
	resultado: boolean;
begin
	if ((a.ano = b.ano) and (a.mes = b.mes) and (a.dia = b.dia)) then
		resultado:= true
	else resultado:= false;
	MismaFecha:= resultado;
end;


function MenorFecha (a: tipoFecha; b:tipoFecha): boolean;
var
	resultado: boolean;
begin
	if ((a.ano < b.ano) or (a.mes < b.mes) or (a.dia < b.dia)) then
		resultado := true
	else resultado:= false;
	
	MenorFecha:= resultado;	
end;



procedure CalcularMinimo (var v: vector_Archivo_Detalle; var dato: tipoDetalle);
var
	actual, minimo: tipoDetalle;
	i, posMin: integer;
begin
	minimo.Codigo:= valorAlto;
	minimo.Fecha.ano:= valorAlto;
	for i:= 1 to cantidadDetalles do begin
		LeerDet (v[i], actual);
		if ((actual.Codigo <> valorAlto) and (MenorFecha (actual.Fecha, minimo.Fecha)) and (actual.Codigo < minimo.Codigo)) then begin
			minimo:= actual;
			posMin:= i;
		end;
	end;
	
	if (minimo.Codigo <> valorAlto) then
		Seek (v[posMin], FilePos(v[posMin]) + 1);
	
end;


procedure ActualizacionMaestroDetalle (var a_Mae: archivo_Maestro; var v_Det: vector_Archivo_Detalle);
var
	i: integer;
	datoMae: tipoMaestro;
	actual, anterior: tipoDetalle;
	
	minSemanarios, maxSemanarios: tipoMaestro;
	
begin
	for i:= 1 to cantidadDetalles do
		Reset (v_Det[i]);
	Reset (a_Mae);
	
	minSemanarios.Vendidos:= valorAlto;
	maxSemanarios.Vendidos:= valorBajo;
	
	CalcularMinimo (v_Det, actual);
	
	while (actual.Codigo <> valorAlto) do begin
		anterior:= actual;
		
		read (a_Mae, datoMae);
		while (( not MismaFecha(datoMae.Fecha, actual.Fecha)) and (datoMae.Codigo <> actual.Codigo)) do
			read (a_Mae, datoMae);
		Seek (a_Mae, FilePos(a_Mae) - 1);
		
		while ((actual.Codigo <> valorAlto) and (MismaFecha (actual.Fecha, anterior.Fecha)) and (actual.Codigo = anterior.Codigo)) do begin
			datoMae.Ejemplares -= actual.Ventas;
			datoMae.Vendidos += actual.Ventas;
			CalcularMinimo (v_Det, actual);
		end;
		
		if (datoMae.Vendidos < minSemanarios.Vendidos) then
			minSemanarios:= datoMae;
		if (datoMae.Vendidos > maxSemanarios.Vendidos) then
			maxSemanarios:= datoMae;
		
		write (a_Mae, datoMae);
	end;
	
	for i:= 1 to cantidadDetalles do
		Close (v_Det[i]);
	Close (a_Mae);
	
	write ('Seminario MENOS vendido fue el ', minSemanarios.Nombre, ' del ', minSemanarios.Fecha.dia, '/', minSemanarios.Fecha.mes, '/', minSemanarios.Fecha.ano);
	write ('Seminario MAS vendido fue el ', maxSemanarios.Nombre, ' del ', maxSemanarios.Fecha.dia, '/', maxSemanarios.Fecha.mes, '/', maxSemanarios.Fecha.ano);

end;



var
	a_Maestro: archivo_Maestro;
	v_Detalle: vector_Archivo_Detalle;
	i: integer;
	cadena: string;
begin
	for i:=1 to cantidadDetalles do begin
		Str (i, cadena);
		Assign (v_Detalle[i], ('detalle' + cadena));
		Reset (v_Detalle[i]);
	end;
	Assign (a_Maestro, 'Maestro.bit');
	Reset (a_Maestro);
	
	ActualizacionMaestroDetalle (a_Maestro, v_Detalle);
	

	close (a_Maestro);
end.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
