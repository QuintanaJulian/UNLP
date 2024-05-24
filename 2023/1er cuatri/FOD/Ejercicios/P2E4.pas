program P2E4;
const
	valorAlto = 9999;
	cantDetalles = 3;

type
	tipoArchivo = record
		Codigo: Integer;
		Fecha: Integer;
		Tiempo: integer;
		end;
		
	archivo_MD = file of tipoArchivo;	
		
	vectorA_Detalle = array [1..cantDetalles] of archivo_MD;
	
	
	
	

procedure CrearDetalles (var v: vectorA_Detalle);
var
	nuevo: tipoArchivo;
	aux: integer;
begin
	for aux:= 1 to cantDetalles do begin
		Rewrite (v[aux]);
		write ('Ingrese codigo: ');
		readln (nuevo.Codigo);
		while nuevo.Codigo <> 000 do begin
			write ('Ingrese Tiempo: ');
			readln (nuevo.Tiempo);
			write ('Ingrese Fecha: (minutos) ');
			readln (nuevo.Fecha);
			write (v[aux], nuevo);
		
			write ('Ingrese codigo : ');
			readln (nuevo.Codigo);
		end;
		
		Close (v[aux]);
	end;
end;

procedure leer (var a : archivo_MD; var dato: tipoArchivo);
begin
	if (not EOF(a)) then begin
		Read (a, dato);
		Seek (a, FilePos(a)-1);
	end else dato.Codigo := 9999;

end;


procedure CrearMaestro (var a_Maestro: archivo_MD; v_Detalle: vectorA_Detalle);
var
	i, posMinimo: integer;
	actual, minimo, total: tipoArchivo;
begin
	for i:=1 to cantDetalles  do 
		reset (v_Detalle[i]);
	rewrite (a_Maestro);
	minimo.Codigo:= 9999;
	for i:= 1 to cantDetalles do begin
		leer (v_Detalle[i], actual);
		
		//writeln (actual.Codigo);
		if (actual.Codigo < minimo.Codigo) then begin
			minimo := actual;
			posMinimo:= i;
		end else if (actual.Codigo = minimo.Codigo) then begin
			if (actual.Fecha < minimo.Fecha) then begin
				minimo:= actual;
				posMinimo:=i;
			end;
		end;
	end;
	Seek (v_Detalle[posMinimo], FilePos(v_Detalle[posMinimo]) + 1);
	total:= minimo;
//	writeln ('---			---			---			---');
//	writeln (minimo.Codigo);
//	writeln ('---			---			---			---');
	while (minimo.Codigo <> 9999) do begin
		minimo.Codigo:= 9999;
		for i:= 1 to cantDetalles do begin
			leer (v_Detalle[i], actual);
			//writeln (actual.Codigo);
			
			if (actual.Codigo < minimo.Codigo) then begin
				minimo := actual;
				posMinimo:= i;
			end else if (actual.Codigo = minimo.Codigo) then begin
				if (actual.Fecha < minimo.Fecha) then begin
					minimo:= actual;
					posMinimo:=i;
				end;
			end;
		end;
		Seek (v_Detalle[posMinimo], FilePos(v_Detalle[posMinimo]) + 1);
	//	writeln (minimo.Codigo);
		if ((total.Codigo = minimo.Codigo) and (total.Fecha = minimo.Fecha)) then
				total.Tiempo:= total.Tiempo + minimo.Tiempo
		else begin
			write (a_Maestro, total);
			total:= minimo;
		end;
	//	writeln ('---			---			---			---');
	end;
	close (a_Maestro);
	for i:=1 to cantDetalles do
		close(v_Detalle[i]);
end;


var
	v_Detalle: vectorA_Detalle;
	a_Maestro: archivo_MD;
	aux: integer;
	nodo: tipoArchivo;

begin
//	for aux:= 1 to cantDetalles do 
	//	Assign (v_Detalle[aux], 'sd');
		
	Assign (v_Detalle[1], '1');
	Assign (v_Detalle[2], '2');
	Assign (v_Detalle [3], '3');
	
	Assign (a_Maestro, 'M1');
	Rewrite (a_Maestro);

	repeat
		writeln ('Ingrese numerop de la operacion deseada.');
		writeln ('		1- CREAR nuevos archivos detalles.');
		writeln ('		2- CREAR el archivo maestro.');
		writeln ('		9- Terminar.');
		read (aux);
		case aux of
			1:	CrearDetalles (v_Detalle);
			2: CrearMaestro (a_Maestro, v_Detalle);
			9: writeln ('CERRANDO..');
			else writeln ('Dicha operacion no esta determinada.');
			end;
	until aux = 9;
	
	reset (a_Maestro);
	while (not EOF(a_Maestro)) do begin
		read (a_Maestro, nodo);
		writeln ('dato:	', nodo.Codigo,'	', nodo.Fecha,'	', nodo.Tiempo);
	end;
	
	
end.
