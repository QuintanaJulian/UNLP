program P3E8;
const
	valorAlto = 9999;

type
	tipoArchivo = record
			Nombre: String;
			Lanzado: integer;
			Version: double;
			Devs: integer;
			Descripcion: String;
			
		end;
		
		Archivo = file of tipoArchivo;
	
procedure Leer (var A: Archivo; var dato: tipoArchivo);
begin
	if (EOF(A)) then
	read (A, dato)
	else dato.Devs := valorAlto;
end;
	
	
	
	
function ExisteDistribucion (var a_linux: Archivo; nombre: String) :boolean;
var
	actual: tipoArchivo;
	encontrado: boolean;
begin
	encontrado:= false;
//	Reset (a_linux); //entiendo que no seria necesario el reset si se realiza un seek
	Seek (a_linux, 1);
	Leer (a_Linux, actual);
	while ((actual.Devs <> valorAlto) and (not encontrado)) do begin
		if (actual.Nombre = nombre) then begin
			encontrado:= true;
			end
		else Leer (a_Linux, actual);
	end;
	ExisteDistribucion:= encontrado;
end;


procedure AltaDistribucion (var a_linux: Archivo);
var 
	nuevo: tipoArchivo;
	actual: tipoArchivo;
begin
	writeln ('Ingese los datos de la nueva distribucion a insertar');
	write ('	Nombre: ');
	readln (nuevo.nombre);
	write ('	Año de lanzamiento: ');
	//readln(nuevo.Lanzado);
	nuevo.Lanzado:= 2002;
	write ('	version: ');
	nuevo.Version:= 1.0;
	write ('	Cantidad de developers: ');
	//readln (nuevo.Devs);
	nuevo.Devs := 3;
	write ('	Descripcion: ');
	nuevo.Descripcion:= 'Lorem ipsum';
	
	if (ExisteDistribucion(a_linux, nuevo.Nombre)) then begin
		write ('Ya existe la distribución. ');
	end else begin
		Reset (a_linux);
		read (a_linux, actual);
		if (actual.Devs < 0) then begin
			Seek (a_linux, (actual.Devs * -1));
			read (a_linux, actual);
			Seek (a_linux, FilePos(a_linux)-1);
			write (a_linux, nuevo);
			Seek (a_linux, 0);	///corroborar
			write (a_linux, actual);
		end else begin
			Seek (a_linux, FileSize(a_linux));
			write (a_linux, nuevo);
		end;
		Close (a_linux);
	
	end;

end;

procedure BajaDistribucion (var a_linux: Archivo);
var
	direccionBaja: integer;
	base: tipoArchivo;
	bajaNombre: string;
begin
	Reset (a_linux);
	read (a_linux, base);
	
	write ('Ingrese nombre de la distribucion a borrar: ');
	readln (bajaNombre);
	
	if (ExisteDistribucion (a_linux, bajaNombre)) then begin
		//Habria que chekear si ExisteDistribucion me dejaria el puntero donde el archivo
		Seek (a_linux, FilePos(a_linux)-1);
		direccionBaja:= (FilePos(a_linux))*-1;
		write (a_linux, base);
		base.Devs:= direccionBaja;
		Seek (a_linux, 0);	///corroborar
		write (a_linux, base);
			
	end else write ('Dicho distribucion no se encuentra. ');
	
	close (a_linux);

end;


var
	a_linux: Archivo;
	dir: string;
begin
	write ('Ingrese nombre del archivo: ');
	readln (dir);
	Assign (a_linux, dir);
	AltaDistribucion (a_linux) ;
	BajaDistribucion (a_linux);

end.


