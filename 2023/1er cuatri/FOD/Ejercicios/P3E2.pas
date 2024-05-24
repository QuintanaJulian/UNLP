program P3E2;
type
	tipoAsistentes = record
		Numero: integer;
		Nombre: String;
		Mail: String;
		Telefono: integer;
		DNI: integer;
		end;
		
	archivo = file of tipoAsistentes;
	
procedure CrearAsistentes (var a_asistentes: archivo);
var
	nuevo: tipoAsistentes;
begin
	Rewrite (a_asistentes);
	write ('Ingrese DNI');
	readln (nuevo.DNI);

		while (nuevo.DNI<>0) do begin
			write ('Ingrese numero de asistente: ');
			read (nuevo.Numero);
			nuevo.Telefono:= 9999;
			nuevo.Nombre:= 'Random';
			nuevo.Mail:= 'hola@gmail.com';
			write (a_asistentes, nuevo);
		
			write ('Ingrese DNI (0 para terminar)');
			readln (nuevo.DNI);
		end;
		close (a_asistentes);
end;


procedure LimpiarPrimeros (var a_asistentes: archivo);
var
	actual: tipoAsistentes;
begin
	reset (a_asistentes);
	read (a_asistentes, actual);
	while (not EOF(a_asistentes)) do begin
		if (actual.Numero < 1000) then begin
			Seek (a_asistentes, FilePos(a_asistentes) - 1);
			actual.Nombre:= 'hola';
			write (a_asistentes, actual);
		end;
		read (a_asistentes, actual);
	end;
	close (a_asistentes);
end;


var
	a_asistentes: archivo;
	actual: tipoAsistentes;
begin
	Assign (a_asistentes, 'a');
	CrearAsistentes (a_asistentes);
	
//	reset (a_asistentes);
//	while (not EOF (a_asistentes)) do begin
	//	read (a_asistentes, actual);
//		writeln (actual.Nombre, '	', actual.DNI);
		//writeln('		-------	');
//	end;
	
	
	LimpiarPrimeros (a_asistentes);
	
	reset (a_asistentes);
	while (not EOF (a_asistentes)) do begin
		read (a_asistentes, actual);
		writeln (actual.Nombre, '	', actual.DNI);
		writeln('		-------	')
	end;
	
end.
