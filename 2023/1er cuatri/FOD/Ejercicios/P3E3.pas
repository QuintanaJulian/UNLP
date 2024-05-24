Program P3E3;
type
	tipoNovela = record
		Codigo: integer;
		Genero: String;
		Duracion: integer;
		Director: String;
		Precio: Integer;
		end;
		
	archivo = file of tipoNovela;
	
procedure CrearArchivo (var a: archivo);
var
	nomFisico: String;
	dato: tipoNovela;
begin
	//Write ('Ingrese nombre del archivo a crear: ');
	//Readln (nomFisico);
	//Assign (a, nomFisico);
	Rewrite (a);
	dato.Codigo:= 0;
	write (a, dato);
	write ('Ingrese codigo de la novela: ');
	readln (dato.Codigo);
	while (dato.Codigo <> -1) do begin
		dato.Genero:= 'Novela';
		dato.Duracion:= 120;
		dato.Director:= 'Springfield';
		dato.Precio:= 99;
		write (a, dato);
		write ('Ingrese codigo de la novela: (-1 para terminar)');
		readln (dato.Codigo);
	end;
	Close (a);
end;

procedure AltaNovela (var a: archivo);
var
	nuevo, actual: tipoNovela;
begin
	write ('Ingrese codigo de la novela: ');
	readln (nuevo.Codigo);
	nuevo.Genero:= 'Novela';
	nuevo.Duracion:= 120;
	nuevo.Director:= 'Springfield';
	nuevo.Precio:= 99;

	Reset (a);
	read (a, actual);
	if (actual.Codigo < 0) then begin
		Seek (a, (actual.Codigo * -1));
		Read (a, actual);
		Seek (a, (FilePos (a)  - 1));
		Write (a, nuevo);
		Seek (a, 0);
		Write (a, actual);
	end else begin
		Seek (a, FileSize (a));
		write (a, nuevo);
	end;
	
	Close (a);

end;

procedure ModificarNovela (var a: archivo);
var
	nuevo,actual: tipoNovela;

begin
	reset (a);
	write ('Ingrse codigo de la novela a modificar');
	readln ( nuevo.Codigo);
	nuevo.Genero:= 'Ficcion';
	nuevo.Duracion:= 200;
	nuevo.Director:= 'Howarts';
	nuevo.Precio:= 66;
	
	read (a, actual);
	while ((not EOF(a)) and (nuevo.Codigo <> actual.Codigo)) do
		read (a, actual);
	if (nuevo.Codigo = actual.Codigo) then begin
		Seek (a, FilePos(a)-1);
		write (a, nuevo);
	end else writeln ('Dicho codigo no se encontro en el archivo');
	
end;
		
		
procedure  BajaNovela (var a: archivo);
var
	base, nodo: tipoNovela;
	codBaja: integer;
begin
	reset (a);
	write ('Ingrese codigo de la novela a eliminar:');
	read (codBaja);
	read (a, base);
	nodo:= base;
	while ((not EOF(a)) and (nodo.Codigo<>codBaja)) do 
		read (a, nodo);
	if (nodo.Codigo = codBaja) then begin
		nodo.Codigo:= base.Codigo;
		Seek (a, FilePos(a)-1);
		base.Codigo:= FilePos(a) * -1;
		write (a, nodo);
		Seek (a, 0);
		write (a, base);
	end else writeln ('Dicho codigo no se encontro en el archivo. ');
end;
		
procedure ModificarArchivo (var a: archivo);
var
	i: integer;
begin
	writeln ('Ingrese: ');
	writeln ('		1-  Agregar novela nueva.');
	writeln ('		2- Modificar novela. ');
	writeln ('		3- Eliminar novela.');
	read (i);
	case i of
		1:  AltaNovela(a);
		2: ModificarNovela (a);
		3: BajaNovela (a);
	end;
end;
		
		
procedure ExportarTexto (var a: archivo);
var
	nodo: tipoNovela;
	exportar: text;
	nombFisico: String;
begin
	write ('Ingrese nombre del archivo a exportar.');
	readln (nombFisico);
	Assign (exportar, nombFisico);
	Rewrite (exportar);
	reset (a);
	Seek (a, 1);
	while (not EOF(a)) do begin
		Read (a, nodo);
		write (exportar, nodo.Codigo, ' ', nodo.Precio, ' ', nodo.Genero);
	end;
	
	close (a);
end;
		
		
var
	a: archivo;
	i: integer;
begin
	Assign (a, 'a');
	Reset (a);
	
	writeln ('Ingrese: ');
	writeln ('		1- Crear nuevo archivo.');
	writeln ('		2- Modificar archivo.');
	writeln ('		3- Exportar archivo txt.');
	writeln ('		9- Salir.');
	read (i);
	while (i  <> 9  ) do begin
		case i of 
			1: CrearArchivo (a);
			2: ModificarArchivo (a);
			3: ExportarTexto(a);
			else writeln ('Dicha operacion no esta definida');
		end;
		writeln ('Ingrese: ');
		writeln ('		1- Crear nuevo archivo.');
		writeln ('		2- Modificar archivo.');
		writeln ('		3- Exportar archivo txt.');
		writeln ('		9- Salir.');
		read (i);
	end;
	
end.
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
