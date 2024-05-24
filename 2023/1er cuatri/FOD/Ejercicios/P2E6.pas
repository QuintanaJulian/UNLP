program P3E6;
const
	cantLocalidades = 10;
	valorAlto = 9999;

type
	tipoDetalle = record
		Localidad: integer;
		Cepa: integer;
		Activos: integer;
		Nuevos: integer;
		Recuperados: integer;
		Fallecidos: integer;
	end;

	tipoMaestro = record
		Localidad: integer;
		N_Localidad: String;
		Cepa: integer;
		N_Cepa: String;
		Activos: integer;
		Nuevos: integer;
		Recuperados: integer;
		Fallecidos: integer;
	end;
	
	archivo_tipoDetalle = file of tipoDetalle;
	archivo_tipoMaestro = file of tipoMaestro;
	
	vector_archivo_tipoDetalle = array [1..cantLocalidades] of archivo_tipoDetalle;
	
	vector_tipoDetalle = array [1..cantLocalidades] of tipoDetalle;
	
procedure leerDet (var archivo: archivo_tipoDetalle; var dato: tipoDetalle);
begin
	if (not EOF(archivo)) then
		read (archivo, dato)
	else dato.Localidad:= valorAlto;
end;

procedure leerMae (var archivo: archivo_tipoMaestro;var dato: tipoMaestro);
begin
	if (not EOF(archivo)) then
		read (archivo, dato)
	else dato.Localidad:= valorAlto;
end;


procedure MinimoDetalle (var v_Archivos: vector_archivo_tipoDetalle; var v_Dato: vector_tipoDetalle; var datoMin: tipoDetalle);
var
	i, posMin: integer;
begin
	datoMin.Localidad:= valorAlto;
	posMin:= 0;
	for i:= 1 to cantLocalidades do begin
		if (v_Dato[i].Localidad < datoMin.Localidad ) then begin
			datoMin := v_Dato[i];
			posMin:= i;
		end;
	end;
	if posMin <> 0 then
		leerDet (v_Archivos[posMin], v_Dato[posMin]);
end;

procedure ActualizacionMaestroDetalle (var a_Maestro: archivo_tipoMaestro; var v_Archivo_Detalle: vector_archivo_tipoDetalle);
var
	v_Detalle: vector_tipoDetalle;
	antLocalidad, casosActivos, cantTotal: integer;
	minDetalle: tipoDetalle;
	datoMaestro: tipoMaestro;
	i: integer;

begin
	for i:= 1 to cantLocalidades do begin
		Reset (v_Archivo_Detalle[i]);
		Read (v_Archivo_Detalle[i], v_Detalle[i]);
	end;
	Reset (a_Maestro);
	
	MinimoDetalle (v_Archivo_Detalle, v_Detalle, minDetalle);
	leerMae (a_Maestro, datoMaestro);
	antLocalidad:= valorAlto;
	casosActivos:= 0;
	cantTotal:= 0;
	
	while (datoMaestro.Localidad <> valorAlto) do begin
		if ((datoMaestro.Localidad = minDetalle.Localidad) and (datoMaestro.Cepa = minDetalle.Cepa)) then begin
			datoMaestro.Fallecidos:= datoMaestro.Fallecidos + minDetalle.Fallecidos;
			datoMaestro.Recuperados:= datoMaestro.Recuperados +  minDetalle.Recuperados;
			datoMaestro.Activos:= minDetalle.Activos;
			datoMaestro.Nuevos:= minDetalle.Nuevos;
			Seek (a_Maestro, FilePos(a_Maestro) - 1);
			Write (a_Maestro, datoMaestro);
			MinimoDetalle (v_Archivo_Detalle, v_Detalle, minDetalle);
		end;
		
		if (antLocalidad = datoMaestro.Localidad) then
			casosActivos:= casosActivos + datoMaestro.Activos
		else begin
			if (casosActivos > 50) then
				cantTotal:= cantTotal + 1;
			casosActivos:= datoMaestro.Activos;
			antLocalidad:= datoMaestro.Localidad;
		end;
			
		leerMae (a_Maestro, datoMaestro);
	end;
	
	writeln ('Un total de ', cantTotal, ' localidades poseen mas de 50 casos activos');
	for i:= 1 to cantLocalidades do
		Close (v_Archivo_Detalle[i]);
	Close (a_Maestro);
end;
	

var
	v_Detalles: vector_archivo_tipoDetalle;
	a_Maestro: archivo_tipoMaestro;
	cadena: String;
	i: integer;
begin
	for i:= 1 to cantLocalidades do begin
		Str (i, cadena);
		Assign (V_Detalles[i], 'det' + cadena);
	end;
	Assign (a_Maestro, 'a');
	ActualizacionMaestroDetalle (a_Maestro, v_Detalles);
	

end.
























