program PParcial1;
const
	cantidadCarreras = 5;
	valorAlto= 9999;

type	
	//resultado = 0..1;

	tipoArchivo = record
		DNI: integer;
		Nombre: String;
		Apellido: String;
		Distancia: double;
		Gano: integer;
	end;
	
	archivo_Carrera = file of tipoArchivo;
	
	vector_Archivo_Carrera = array [1..cantidadCarreras] of archivo_Carrera;
	vector_tipoCarrera = array [1..cantidadCarreras] of tipoArchivo;
	
	
{
procedure Leer (var a: archivo_Carrera; var dato: tipoArchivo);
begin
	if (not EOF(a)) then begin
		read (a, dato);
		Seek (a, FilePos(a) - 1);
	end else dato.DNI := valorAlto;
end;

procedure DatoMinimo (var v_Carreras: vector_Archivo_Carrera; var minimo: tipoArchivo);
var
	actual: tipoArchivo;
	i, posMin: integer;
begin
	minimo.DNI:= valorAlto;
	
	for i:=1 to cantidadCarreras do begin
		Leer (v_Carreras[i], actual);
		if (actual.DNI < minimo.DNI) then begin
			minimo:= actual;
			posMin:= i;
		end;
	end;
	
	if (actual.DNI <> valorAlto) then
		Seek (v_Carreras[posMin], FilePos (v_Carreras[posMin]) - 1);
	
end;


procedure CrearMaestro (var v_Carreras: vector_Archivo_Carrera);
var
	nombre_Fisico: String;
	a_Maestro: archivo_Carrera;
	actual, anterior: tipoArchivo;
	i: integer;
begin
	write ('Ingrese el nombre del archivo maestro a crear: ');
	readln (nombre_Fisico);
	Assign (a_maestro, nombre_Fisico);
	Rewrite (a_Maestro);
	for i:=1 to cantidadCarreras do
		Reset (v_Carreras[i]);
	
	DatoMinimo (v_Carreras, actual);
	anterior:= actual;
	
	while (actual.DNI <> valorAlto) do begin
		
		DatoMinimo (v_Carreras, actual);
		while (anterior.DNI = actual.DNI) do begin
			anterior.Distancia += actual.Distancia;
			anterior.Gano += actual.Gano;
			DatoMinimo (v_Carreras, actual);
		end;
		
		Write (a_Maestro, anterior);
		anterior:= actual;
	end;
	
	for i:=1 to cantidadCarreras do
		Close (v_Carreras[i]);
	Close (a_Maestro);
	
end; 
}




procedure Leer (var a: archivo_Carrera; var dato: tipoArchivo);
begin
	if (not EOF(a)) then 
		read (a, dato)
	else dato.DNI := valorAlto;
end;


procedure DatoMinimo (var v_Carreras: vector_Archivo_Carrera; var v_Actual: vector_tipoCarrera; var minimo: tipoArchivo);
var
	i, posMin: integer;
begin
	minimo.DNI:= valorAlto;
	for i:=1 to cantidadCarreras do begin
		if (v_Actual[i].DNI < minimo.DNI) then begin
			minimo:= v_Actual[i];
			posMin:= i;
		end;
	end;
	
	if (minimo.DNI <> valorAlto) then
		leer (v_Carreras[posMin], v_Actual[posMin]);
end;



procedure CrearMaestro (var v_Carreras: vector_Archivo_Carrera);
var
	v_Actual: vector_tipoCarrera;
	i: integer;
	dir_Fisica: string;
	a_Mae: archivo_Carrera;
	anterior, actual: tipoArchivo;
begin
	for i:=1 to cantidadCarreras do begin
		Reset (v_Carreras[i]);
		Leer (v_Carreras[i], v_Actual[i]);
	end;
	read (dir_Fisica);
	Assign (a_Mae, dir_Fisica);
	Rewrite (a_Mae);
	
	DatoMinimo (v_Carreras, v_Actual, actual);
	while (actual.DNI <> valorAlto) do begin
		anterior:= actual;
		DatoMinimo (v_Carreras, v_Actual, actual);
		while (actual.DNI = anterior.DNI) do begin
			anterior.Distancia += actual.Distancia;
			anterior.Gano:= actual.Gano;
			DatoMinimo (v_Carreras, v_Actual, actual);
		end;
		
		write (a_Mae, anterior);
		
	end;
	
	for i:=1 to cantidadCarreras do
		Close (v_Carreras[i]);
	Close (a_Mae);
end;


















var
	v_Carreras: vector_Archivo_Carrera;
	i: integer;
	cadena: String;
	
begin
	for i:= 1 to cantidadCarreras do begin
		Str (i, cadena);
		cadena:= 'detalle' + cadena;
		Assign (v_Carreras[i], cadena);
		Reset (v_Carreras[i]);
	end;
	
	CrearMaestro (v_Carreras);
	
	Reset (v_Carreras[5]);
	read(i);
	Rename (v_Carreras[5], 'maestro');
	Close (v_Carreras[5]);
end.
	
	
	
	
	
	
	
	
	
	
	
