program P2E3;
const
	cantDetalles = 3;
	valorAlto = 9999;


type
	tipoArchivo_Maestro = record
		Codigo: integer;
		Nombre: String;
		Descripcion: String;
		Stock: integer;
		StockMin: integer;
		Precio: double;
		end;
	
	archivo_Maestro = file of tipoArchivo_Maestro;
	
	tipoArchivo_Detalle = record
		Codigo: integer;
		Cantidad: integer
		end;
		
	vectorDetalle = array [1 .. cantDetalles] of tipoArchivo_Detalle;
	
	archivo_Detalle = file of tipoArchivo_Detalle;
	
	vectorArchivo_Detalle = array [1 .. cantDetalles] of archivo_Detalle;
	

procedure CrearDetalles (var v: vectorArchivo_Detalle);
var
	nuevo: tipoArchivo_Detalle;
	aux: integer;
begin
	for aux:= 1 to cantDetalles do begin
		//Assign (v[aux], IntToStr(aux)); //supongo que algo asi existe?
		Rewrite (v[aux]);
		write ('Ingrese codigo de lproduccto: ');
		readln (nuevo.Codigo);
		while nuevo.Codigo <> 000 do begin
		write ('Ingrese cantidad vendida: ');
		readln (nuevo.Cantidad);
		write (v[aux], nuevo);
		write ('Ingrese codigo de lproduccto: ');
		readln (nuevo.Codigo);
		end;
		
		Close (v[aux]);
	end;

end;


procedure Leer (var a_Detalle: archivo_Detalle; var D:tipoArchivo_Detalle);
begin
	if not EOF (a_Detalle) then
		read (a_Detalle, D)
	else
		D.Codigo:= valorAlto;

end;

procedure EncontrarMenor (var v_Detalle: vectorArchivo_Detalle; var D: vectorDetalle; var menor: tipoArchivo_Detalle);
var
	posMin: integer;
	aux: integer;
begin
	menor.Codigo:= 9999;
	for aux:= 1 to cantDetalles do begin
		if D[aux].Codigo < menor.Codigo then begin
			menor:= D[aux];
			posMin:= aux;
			end;
	
	end;
	
	Leer (v_Detalle[posMin], D [posMin] );
end;




procedure ActualizarMaestro (var a_Maestro: archivo_Maestro; v_Detalle: vectorArchivo_Detalle);
var
	M: tipoArchivo_Maestro;
	D: vectorDetalle;
	menor: tipoArchivo_Detalle;
	aux: integer;
begin
	for aux:= 1 to cantDetalles do begin
		Reset (v_Detalle[aux]);
		Leer (v_Detalle[aux], D[aux]);
	end;
	Reset (a_Maestro);
	EncontrarMenor (v_Detalle, D, menor);
	writeln ('hola mundo 1	', menor.Codigo, menor.Cantidad);
	
	while (menor.Codigo <> valorAlto) do begin
		Read (a_Maestro, M);
		while menor.Codigo <> M.codigo do read (a_Maestro, M);
		Seek (a_Maestro, FilePos(a_Maestro) - 1);
		while M.Codigo = menor.Codigo do begin
			M.Stock:= M.Stock - menor.Cantidad;
			EncontrarMenor (v_Detalle, D, menor);
		end;
		write (a_Maestro, M);
	end;
	
	
	for aux:= 1 to cantDetalles do
		Close (v_Detalle[aux]);
	Close (a_Maestro);
		
end;


procedure ComprobarStock (var a_Maestro: archivo_Maestro);
var
	a_Stock: text;
	M: tipoArchivo_Maestro;
begin
	Reset (a_Maestro);
	Assign (a_Stock, '1.txt');
	Rewrite (a_Stock);
	while not EOF (a_Maestro) do begin
		read (a_Maestro, M);
		if (M.Stock < M.StockMin )then 
		writeln (a_Stock, M.Nombre, ', ', M.Descripcion, ', ', M.Stock, ', ',M.Precio);
	end;
	
	close (a_Maestro);
	close (a_Stock);
	
end;








var
	a_Maestro: archivo_Maestro;
	v_Detalle: vectorArchivo_Detalle;
	aux: integer;
begin 
	for aux:= 1 to cantDetalles do 
		Assign (v_Detalle[aux], 'sd');
		
	Assign (v_Detalle[1], '1');
	Assign (v_Detalle[2], '2');
	Assign (v_Detalle [3], '3');
	
	Assign (a_Maestro, 'M1');
	Rewrite (a_Maestro);

	repeat
		writeln ('Ingrese numerop de la operacion deseada.');
		writeln ('		1- CREAR nuevos archivos detalles.');
		writeln ('		2- ACTUALIZAR el archivo maestro.');
		writeln ('		3- CREAR archivos del stock faltante');
		writeln ('		9- Terminar.');
		read (aux);
		case aux of
			1:	CrearDetalles (v_Detalle);
			2: ActualizarMaestro (a_Maestro, v_Detalle);
			3: ComprobarStock (a_Maestro);
			9: writeln ('CERRANDO..');
			else writeln ('Dicha operacion no esta determinada.');
			end;
	until aux = 9;
end.












































