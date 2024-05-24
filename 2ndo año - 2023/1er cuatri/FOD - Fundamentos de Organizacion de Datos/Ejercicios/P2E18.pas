program P2E18;
const
	valorAlto = 9999;
	
type
	tipoCasos= record
		Localidad:integer;
		NombreLoc: String;
		Municipio: integer;
		NombreMun: String;
		Hospital: integer;
		NombreHosp: String;
		Fecha: String;
		Positivos: integer;
	end;
	
	archivo_tipoCasos = file of tipoCasos;
	
	
procedure leer (var a_Casos: archivo_tipoCasos; var dato: tipoCasos);
begin
	if (not EOF(a_Casos)) then
		read (a_Casos, dato)
	else dato.Localidad:= valorAlto;
end;


procedure ExportarMunicipio (var a_texto: text; dato: tipoCasos; positivos: integer);
begin
	writeln (a_texto, dato.NombreLoc);
	writeln (a_texto, positivos, ' ', dato.NombreMun);
end;


procedure leerArchivo (var a_Casos: archivo_tipoCasos);
var
	anterior, actual: tipoCasos;
	a_Texto: text;
	cantHosp, cantMun, cantLoc: integer;
begin
	Reset (a_Casos);
	Assign (a_Texto, 'b');
	Rewrite (a_Texto);
	
	leer (a_Casos, actual);
	//anterior:= actual;
	writeln ('hola', actual.Localidad);
	while (actual.Localidad <> valorAlto)  do begin
	writeln ('hola');
		cantLoc:= 0;
		anterior:= actual;
		writeln ('		Localidad ', actual.Localidad);
		while ((actual.Localidad <> valorAlto) and (actual.Localidad = anterior.Localidad)) do begin
			cantMun:= 0;
			anterior:= actual;
			writeln ('				Municipio ',  actual.Municipio);
			while ((actual.Localidad <> valorAlto) and (actual.Localidad = anterior.Localidad) and (actual.Municipio = anterior.Municipio)) do begin
				cantHosp:= 0;
				anterior:= actual;
				while ((actual.Localidad <> valorAlto) and (actual.Localidad = anterior.Localidad) and (actual.Municipio = anterior.Municipio) and (actual.Hospital = anterior.Hospital)) do begin
					cantHosp+= actual.Positivos;																//la cantida de condicionales del while esta mal pero ni ganas de arrglarlo,
					leer (a_Casos, actual);																		//mas que nada por que no creo que se deberian repetir los codigos de hospitales
				end;																										//y en mis ejemplos para probar si andaba repeti todo :/
				writeln ('						',anterior.NombreHosp, '......................', cantHosp);
				cantMun+= cantHosp;
				
			end;
			writeln ('				Cantidad de casos  del municipio: ', cantMun);
			cantLoc+= cantMun;
			if cantMun > 15 then
				ExportarMunicipio (a_Texto, anterior, cantMun);
		end;
		writeln ('		Cantidad de casos de la localidad: ', cantLoc);
	end;
	Close (a_Casos);
	Close (a_Texto);
	
end;

var
	archivo_Casos: archivo_tipoCasos;
begin
	assign (archivo_Casos, 'maestro');
	leerArchivo (archivo_Casos);

end.


