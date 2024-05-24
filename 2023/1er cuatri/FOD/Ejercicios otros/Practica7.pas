program Practica7;

type
	novela = record
		cod:integer;
		nombre: string;
		genero: string;
		precio: integer;
	end;
	
	archivoNovela = file of novela;


procedure imprimir(var Novelas: archivoNovela);
var n: novela;
begin
	reset(Novelas);
	while not EOF(Novelas) do
	begin
		read(Novelas,n);
		writeln('Codigo: ', n.cod, ' Nombre: ', n.nombre, ' Genero: ', n.genero, ' Precio: ', n.precio);
	end;
	close(Novelas);
end;
	
var Novelas: archivoNovela;
	carga: Text;
	n: novela;
begin
	Assign(Novelas,'NovelasBinario');
	Assign(carga,'novelas.txt');
	rewrite(Novelas);
	reset(carga);
	
	while not EOF(carga) do
	begin
		with n do readln(carga,cod,precio,genero);
		with n do readln(carga,nombre);
		
		write(Novelas,n);
	end;
	writeln('Archivo Cargado');
	close(Novelas);close(carga);
	
	imprimir(Novelas);
end.
