program P4E4;
type
	reg_flor= record
		nombre: String[45];
		codigo: integer;
		end;
		
		tArchFlores= file of reg_flor;
		
		
		
procedure crearArchivo (var a: tArchFlores);
var
	nuevo: reg_flor;
	n_fisico: string;
	str: string;
begin
	write ('Ingrese nombre del archivo');
	read (n_fisico);
//	read (str);
//	str:= n_fisico;
	//read (nuevo.codigo);
	write ('hola');
//	Assign (a, n_fisico);
	Rewrite (a);
	
	nuevo.codigo:= 0;
	nuevo.nombre:= 'Lista vacios. ';
	Write (a, nuevo);
	
	write ('Codigo: ');
	read (nuevo.codigo);
	
	while (nuevo.codigo <> 0) do begin
		write ('nombre: ');
		read (nuevo.nombre);
		write (a, nuevo);
		write ('Codigo:  (0 para salir)');
		read (nuevo.codigo)
		end;
	close (a);
end;

procedure agregarFlor (var a: tArchFlores);
var
	borrado, nuevo: reg_flor;
	i: integer;
begin
	reset (a);

	writeln ('Codigo de la flor a agregar: ');
	read (nuevo.codigo);
	if (nuevo.codigo <> 0) then begin
		writeln ('nombre: ');
		read (nuevo.nombre);
		writeln ('check');
		read (a, borrado);
		if (borrado.codigo = 0) then begin
			
			Seek (a, fileSize(a));
			write (a, nuevo);
			writeln ('check5');
		end
		else begin
			i:= borrado.codigo * (-1);
			Seek (a, i);
			read (a , borrado);
			Seek (a, FilePos(a) - 1);
			write (a, nuevo);
			Seek (a, 0);
			write (a, borrado);
		end;
	end;
	
	close (a);
end;


procedure listarContenido (var a: tArchFlores);
var
	dato: reg_flor;
begin
	reset (a);
	read (a, dato);
	while (not EOF(a)) do begin
		if (dato.codigo > 0) then
			writeln ('Flor ',dato.nombre, ' con codigo: ',dato.codigo, '. ');
		read (a, dato);
	end;
	close (a);
end;

procedure listarContenidoCompleto  (var a: tArchFlores);
var
	dato: reg_flor;
begin
	reset (a);
	seek (a, 1);
	read (a, dato);
	while (not EOF(a)) do begin
		writeln ('Flor ',dato.nombre, ' con codigo: ',dato.codigo, '. ');
		read (a, dato);
	end;
	close (a);
end;

procedure eliminarFlor (var a: tArchFlores);
var
	borrado: reg_flor;
	dato: reg_flor;
	direccion: integer;
begin
	write ('Ingrese el codigo de la flor a borrar');
	read (borrado.codigo);
	reset (a);
	read (a, dato);
	direccion:= dato.codigo;
	while ((dato.codigo <> borrado.codigo) and (not EOF(a))) do
		read (a, dato);
	if (dato.codigo = borrado.codigo) then begin
		Seek (a, FilePos (a) - 1);
		borrado.codigo := direccion;
		borrado.nombre :='eliminado';
		dato.codigo:= FilePos (a) * -1;
		dato.nombre:= 'borrado';
		write (a, borrado);
		Seek (a, 0);
		write (a, dato);
	end
	else writeln('La flor ingresada no se encuentra en el archivo.');
end;



var
	a: tArchFlores;
	aux: integer;
begin
	Assign (a, '1');
	aux:= 100;
	
	while (aux <> 9) do begin
	
		writeln ('Ingrese 1 para CREAR archivo de flores.');
		writeln ('Ingrese 2 para AGREGAR una flor');
		writeln ('Ingrese 3 para LEER el archivo');
		writeln ('Ingrese 4 para LEER TODO el archivo (Incluidos borrados)');
		writeln ('Ingrese 5 para BORRAR una flor');
		writeln ('Ingrese 9 para SALIR');
		read (aux);
		
		case aux of
			1: crearArchivo(a);
			2: agregarFlor (a);
			3: listarContenido (a);
			4: listarContenidoCompleto(a);
			5: eliminarFlor (a);
			9: writeln ('SALIENDO..');
		else writeln ('ERROR (Ingrese un valor valido)');
	end;
	end;
end.
