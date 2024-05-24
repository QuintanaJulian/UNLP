//Examen practica CBD primera fecha 23/5/23

program PParcia2;
const
	valorAlto= 9999;
	
type
	profesional = record
		DNI: integer;
		Nombre: String;
		Apellido: String;
		Sueldo: real
	end;
	
	tArchivo = file of profesional;
	

Procedure leerTexto (var info: TEXT; var dato: profesional);
begin
	if (not EOF (info)) then begin
		readln (info, dato.DNI, dato.Nombre);
		readln (info, dato.Sueldo, dato.Apellido);
	end else dato.DNI:= valorAlto;
end;

procedure leer (var a: tArchivo; var dato: profesional);
begin
	if (not EOF(a)) then
		read (a, dato)
	else dato.DNI:= valorAlto;
end;


Procedure crear (var arch: tArchivo; var info: TEXT);
var 
 dato: profesional; 
begin
	Rewrite (arch);
	Reset (info);
	
	dato.DNI:= 0;
	write (arch, dato);
	
	leerTexto (info, dato);
	while (dato.DNI <> valorAlto) do begin
		write (arch, dato);
		leerTexto (info, dato);
	end;
	
	Close (arch);
	Close (info);
end;


Procedure agregar (var arch: tArchivo; var p: profesional);
var 
	base: profesional;
begin
	Reset (arch);
	
	leer (arch, base);
	
	if (base.DNI <> 0) then begin
		Seek (arch, (base.DNI * -1));
		leer (arch, base);
		Seek (arch, (FilePos(arch) - 1));
		Write (arch, p);
		Seek (arch, 0);
		write (arch, base);
	end else begin
		Seek (arch, FilePos(arch));
		write (arch, p);
	end;
	
	Close (arch);
end;




Procedure eliminar (var arch: tArchivo; DNI: integer; var bajas: TEXT);
var
	base, actual: profesional;

begin
	Reset (arch);
	Reset (bajas);
	leer (arch, base);
	
	leer (arch, actual);
	while ((actual.DNI <> valorAlto) and (actual.DNI <> DNI)) do
		leer (arch, actual);
	
	
	if (actual.DNI = DNI) then begin
		append (bajas);
		writeln (bajas, actual.DNI, ' ', actual.Nombre);
		writeln (bajas, actual.Sueldo, ' ', actual.Apellido);
		
		
		Seek (arch, filepos(arch) - 1);
		actual.DNI:= base.DNI;
		base.DNI:= FilePos(arch) * -1;
		write (arch, actual);
		Seek (arch, 0);
		write (arch, base);
	end;
end;


var
 arch: tArchivo;
 bajas: text;
begin
	Assign (arch, 'a');
	Rewrite (arch);
	Assign (bajas, 'b');
	Rewrite (bajas);
	
	eliminar (arch, 44, bajas);
end.






























