program P2E15;
const
	cantidadDetalles = 10;
	valorAlto = 9999;
type
	tipoMaestro = record
		Provincia: integer;
		NomProvincia: String;
		Localidad: integer;
		NomLocalidad: String;
		VivSinLuz: integer;
		VivSinGas: integer;
		VivChapa: integer;
		VivSinAgua: integer;
		VivSinSanitarios: integer;
	end;
	
	tipoDetalle = record
		Provincia: integer;
		Localidad: integer;
		VivConLuz: integer;
		VivConGas: integer;
		VivChapa: integer;
		VivConAgua: integer;
		VivConSanitarios: integer;
	end;


	archivo_Detalle = file of tipoDetalle;
	
	archivo_Maestro = file of tipoMaestro;
	
	vector_Archivo_Detalle = array [1..cantidadDetalles] of archivo_Detalle;
	
procedure Leer (var a_Detalle: archivo_Detalle; var dato: tipoDetalle );
begin
	if (not EOF(a_Detalle)) then
		read (a_Detalle, dato)
	else dato.Localidad:= valorAlto;
end;

procedure MinimoProvincia (var v_Det: vector_Archivo_Detalle; i: integer);
var
	aux: integer;
	actual, minimo: tipoDetalle;
begin
	i:= 0;
	minimo.Provincia:= valorAlto;
	for aux:= 1 to cantidadDetalles do begin
		if (not EOF(v_Det[aux])) then begin
			Read (v_Det[aux], actual);
			Seek(v_Det[aux], 0);
		end else actual.Provincia:= valorAlto;
		if (actual.Provincia < minimo.Provincia) then begin
			minimo:= actual;
			i:= aux;
		end;
	end;
		

end;
	
	
	
	
procedure ActualizacionMaestroDetalle (var a_Mae: archivo_Maestro; var v_Det: vector_Archivo_Detalle);
var
	datoMaestro: tipoMaestro;
	anterior, actual: tipoDetalle;
	i, aux: integer;
	LocalidadesSinViviendaDeChapa: integer;
	
begin
	for i:= 1 to cantidadDetalles do
		Reset (v_Det[i]);
	Reset (a_Mae);
	LocalidadesSinViviendaDeChapa:= 0;
		
	for aux:= 1 to cantidadDetalles do begin
		MinimoProvincia (v_Det, i);
		Leer (v_Det[i], actual);
		while (actual.Localidad <> valorAlto) do begin
			anterior:= actual;
			Read (a_Mae, datoMaestro);
			while (datoMaestro.Localidad <> actual.Localidad) do begin
				if (datoMaestro.VivChapa = 0) then
					LocalidadesSinViviendaDeChapa+= 1;
				Read (a_Mae, datoMaestro);
			end;
			Seek (a_Mae, FilePos(a_Mae) - 1);
		
			while (actual.Localidad = anterior.Localidad) do begin
				datoMaestro.vivSinLuz += -actual.vivConLuz;
				datoMaestro.vivChapa += - actual.vivChapa;
				Leer (v_Det[i], actual);
			end;
			if (datoMaestro.VivChapa = 0) then
				LocalidadesSinViviendaDeChapa+= 1;
			write (a_Mae, datoMaestro);
		end;

	end;
	for i:= 1 to cantidadDetalles do 
		close (v_Det[i]);
	close (a_Mae);
end;


var
	a_Maestro: archivo_Maestro;
	v_Detalle: vector_Archivo_Detalle;
	i: integer;
	cadena: string;
begin
	for i:=1 to cantidadDetalles do begin
		Str (i, cadena);
		Assign (v_Detalle[i], ('Detalle' + cadena));
		Reset (v_Detalle[i]);
	end;
	Assign (a_Maestro, 'archivo_Maestro');
	Reset (a_Maestro);
	
	ActualizacionMaestroDetalle (a_Maestro, v_Detalle);
	
	
end.

	
	
