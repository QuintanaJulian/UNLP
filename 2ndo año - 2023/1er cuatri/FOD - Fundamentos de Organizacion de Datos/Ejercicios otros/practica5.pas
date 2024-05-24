program practica5;

type
	celular = record
		cod: integer;
		precio: integer;
		marca: string;
		stockDisponible: integer;
		stockMin: integer;
		descripcion: string;
		nombre: string;
		
	end;
	
	ArchivoCelulares = file of celular;
	

procedure imprimirBinario(var Celulares: ArchivoCelulares);
var c:celular;
begin
	reset(Celulares);
	while(not eof (Celulares)) do
	begin
		read(Celulares,c);
		write('Codigo: ', c.cod, ' nombre: ', c.nombre, ' Descripcion: ', c.descripcion, ' Marca: ', c.marca, ' Precio: ', c.precio, ' Stock Minimo: ', c.stockMin, ' Stock Disponible: ', c.stockDisponible);
	end;
	close(Celulares);
end;

procedure stockMinimo(var Celulares: ArchivoCelulares);
var c:celular;
begin
	reset(Celulares);
	while not eof(Celulares) do
	begin
		read(Celulares,c);
		if(c.stockDisponible >= c.stockMin) then
				write('Codigo: ', c.cod, ' nombre: ', c.nombre, ' Descripcion: ', c.descripcion, ' Marca: ', c.marca, ' Precio: ', c.precio, ' Stock Minimo: ', c.stockMin, ' Stock Disponible: ', c.stockDisponible);
	end;
	close(Celulares);
end;

procedure conDescripcion(var Celulares: ArchivoCelulares);
var c:celular;
begin
	reset(Celulares);
	while not eof(Celulares) do
	begin
		read(Celulares,c);
		if(c.Descripcion <> ' ') then
				write('Codigo: ', c.cod, ' nombre: ', c.nombre, ' Descripcion: ', c.descripcion, ' Marca: ', c.marca, ' Precio: ', c.precio, ' Stock Minimo: ', c.stockMin, ' Stock Disponible: ', c.stockDisponible);
	end;
	close(Celulares);
end;

procedure leerCelular(var c:celular);
begin
	write(' Codigo: ');readln(c.cod);
	if(c.cod <> 0) then
	begin
		write('Precio: ');readln(c.precio);
		write('Marca: ');readln(c.marca);
		write('stock diponible: ');readln(c.stockDisponible);
		write('stock minimo: ');readln(c.stockMin);
		write('Descripcion: ');readln(c.descripcion);
		write('Nombre: ');readln(c.nombre);
	end;
end;

procedure agregarCelular(var Celulares: ArchivoCelulares);
var c:celular;
begin
	reset(Celulares);
	seek(Celulares,filesize(Celulares));
	leerCelular(c);
	while (c.cod <> 0) do 
	begin
		write(Celulares,c);
		leerCelular(c);
	end;
	close(Celulares);
end;

procedure modificarStock(var Celulares: ArchivoCelulares; var co: integer);
var c:celular; 
begin
	reset(Celulares);
	while not(EOF(Celulares)) do
	begin
		read(Celulares,c);
		if(c.cod = co) then
		begin
			write(' Nuevo stock: ');readln(c.stockDisponible);
			seek(Celulares,filePos(Celulares)-1);
			write(Celulares,c);
		end;
	end;
	close(Celulares);
end;

procedure sinStock(var Celulares: ArchivoCelulares);
var carga2: Text;
	c:celular;
begin
	assign(carga2,'sinStock.txt');
	rewrite(carga2);
	reset(Celulares);
	while not EOF(Celulares) do
	begin
		read(Celulares,c);
		if(c.stockDisponible = 0) then
			with c do writeln(carga2,cod,precio,marca);
		
			with c do writeln(carga2,stockDisponible,stockMin,descripcion);
		
			with c do writeln(carga2,nombre);
	end;
	close(carga2);
	reset(Celulares);				
end;


var Celulares: ArchivoCelulares;
	carga: Text;
	c: celular;
	co:integer;
begin
	
	assign(Celulares,' CelularesBinario');
	assign(carga,'celulares.txt');
	reset(carga);
	rewrite(Celulares);
	
	while(not eof (carga)) do
	begin
		with c do readln(carga,cod,precio,marca);
		
		with c do readln(carga,stockDisponible,stockMin,descripcion);
		
		with c do readln(carga,nombre);
		
		write(Celulares,c);
	end;
	
	writeln('Archivo cargado');
	close(carga);close(Celulares);
	
	writeln();
	
	imprimirBinario(Celulares);
	writeln();
	writeln(' ----------------------------------------- ');
	writeln();
	stockMinimo(Celulares);
	
	writeln();
	writeln(' ----------------------------------------- ');
	writeln();
	
	conDescripcion(Celulares);
	
	writeln();
	writeln(' Agregar nuevo celular: ');
	writeln();
	
	agregarCelular(Celulares);
	
	write(' Codigo de ceular a modificar: ');readln(co);
	modificarStock(Celulares,co);
	
	imprimirBinario(Celulares);
	
	sinStock(Celulares);
end.
