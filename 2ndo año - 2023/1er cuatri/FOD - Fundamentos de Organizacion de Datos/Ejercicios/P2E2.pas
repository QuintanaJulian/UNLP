program P2E4;
const
	valorAlto = 9999;
type
	 tipoAlumnos = record
		Codigo: integer;
		Cursadas: integer;
		Materias: integer;
		Nombre: String;
		end;
		
	tipoA_Detalle= record
		Codigo: integer;
		Materia: boolean;
		end;
		
	Archivo_Detalle = file of tipoA_Detalle;
	
	Archivo_Maestro = file of tipoAlumnos;


procedure GenerarDetalle (var a_Detalle: Archivo_Detalle);
var
	dato: tipoA_Detalle;
	aux: integer;
begin
	Rewrite (a_Detalle);
	
	writeln ('Ingrese Codigo del alumno que aprobo.');
	read (dato.Codigo);
	while (dato.Codigo <> 000) do begin
		write ('Ingrese 0 si aprobo la MATERIA. Ingrese 1 si unicamente aprobo la CURSADA');
		read (aux);
		if aux = 0 then begin
			dato.Materia:= TRUE;
			write (a_Detalle, dato);
			end
			else if aux = 1 then begin
				dato.Materia:=FALSE;
				write (a_Detalle, dato);
				end
			else writeln ('INGRESE VALORES 0 o 1');
			
			writeln ('Ingrese Codigo del alumno que aprobo.			(000 para salir)');
			read (dato.Codigo);
		end;
		close (a_Detalle);
end;


procedure LeerDetalle ( var a_Detalle: Archivo_Detalle);
var
	D: tipoA_Detalle;
begin
	reset (a_Detalle);
	while (not EOF (a_Detalle)) do begin
	read (a_Detalle, D);
	if (D.Materia = TRUE) then
		writeln ( D.Codigo, ' aprobo la MATERIA')
	else
		writeln (D.Codigo, ' aprobo la CURSADA');
	end;
	
	Close (a_Detalle);
end;

Procedure Leer (var a_Detalle: Archivo_Detalle; var D: tipoA_Detalle);
begin
	if (not EOF (a_Detalle)) then
		Read (a_Detalle, D)
	else
		D.Codigo:= valorAlto;
end;


Procedure LeerM (var a_Detalle: Archivo_Maestro; var D: tipoAlumnos);
begin
	if (not EOF (a_Detalle)) then
		Read (a_Detalle, D)
	else
		D.Codigo:= valorAlto;
end;


procedure ActualizarMaestro (var a_Maestro: Archivo_Maestro; var a_Detalle: Archivo_Detalle);
var
	D: tipoA_Detalle; 
	M:tipoAlumnos;
begin
	reset (a_Maestro);
	reset (a_Detalle);
	
	writeln ('CHECK 1');
	Leer (a_Detalle, D);
	
	while (D.Codigo <> valorAlto) do begin
		Read (a_Maestro, M);
		writeln ('CHECK 1', D.Codigo, M.Codigo);
		while (D.Codigo <> M.Codigo) do begin
			writeln ('CHECK 2');
			Read (a_Maestro, M);
			end;
		while (D.Codigo <> valorAlto) and (D.Codigo = M.Codigo) do begin
			writeln ('CHECK 3');
			if D.Materia = true then
				M.Materias:= M.Materias + 1
			else
				M.Cursadas:= M.Cursadas + 1;
			Leer (a_Detalle, D);
			writeln ('CHECK 4');
		end;
		Seek (a_Maestro, FilePos (a_Maestro) - 1);
		writeln ('CHECK 1', D.Codigo, M.Codigo);
		Write (a_Maestro, M);
		writeln ('CHECK 6');
		
	end;
	Close (a_Maestro);
	Close (a_Detalle);
end;



procedure Generar4Pendientes (var a_Maestro: Archivo_Maestro);
var
	dato: tipoAlumnos;
	Pendientes: text;
begin
	Assign (Pendientes, 'deben.txt');
	Rewrite (Pendientes);
		
	Reset (a_Maestro);
	LeerM (a_Maestro, dato);
	while (dato.Codigo <> valorAlto) do begin
		if (dato.Cursadas > 4) then begin
			write (Pendientes, dato.Codigo,' ', dato.Cursadas, ' ',dato.Materias,' ',dato.Nombre );
		end;
		LeerM (a_Maestro, dato);
		
	end;
end;





var
	a_Maestro: Archivo_Maestro;
	a_Detalle: Archivo_Detalle;
	
	aux: integer;
	
BEGIN
	Assign (a_Maestro, '1');
	Assign (a_Detalle, '2');
	
	writeln ('Ingrese el numero de la operacion deseada');
	writeln ('		1- Para  generar nuevo archivo DETALLE');
	writeln ('		2- Para  leer archivo DETALLE');
	writeln ('		3- Para  ACTUALIZAR los datos del archivo de texto.');
	writeln ('		4- Para generar archivo de alumnos que tienen 4 o mas finales pendientes.');
	writeln ('');
	writeln ('		9- Para  SALIR');
	read (aux);
	
	while aux <> 9 do begin
		case aux of
			1: GenerarDetalle (a_Detalle);
			2: LeerDetalle (a_Detalle);
			3: ActualizarMaestro (a_Maestro, a_Detalle);
			4: Generar4Pendientes (a_maestro);
			9: writeln ('Gracias por usar nuestros servicios');
			else writeln ('Dicho codigo de operacion no pudo ser identificado.');
		end;
		writeln ('Ingrese el numero de la operacion deseada');
		writeln ('		1- Para  generar nuevo archivo DETALLE');
		writeln ('		2- Para  leer archivo DETALLE');
		writeln ('		3- Para  ACTUALIZAR los datos del archivo de texto.');	
		writeln ('		4- Para generar archivo de alumnos que tienen 4 o mas finales pendientes.');
		writeln ('');
		writeln ('		9- Para  SALIR');
		read (aux);
	
	end;
	

END.

