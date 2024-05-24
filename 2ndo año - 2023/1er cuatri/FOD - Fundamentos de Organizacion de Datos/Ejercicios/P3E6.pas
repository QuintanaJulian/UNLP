program P3E6;

type




tipoPrenda = record
	Codigo: integer;
	Descripcion: String;
	Tipo: String;
	PrecioUnitario: double;
	end;

lista = ^nodo;	

nodo = record
	dato: tipoPrenda; 
	sig: lista;
	end;

	archivo_Maestro = file of tipoPrenda;
	
	archivo_Detalle = file of integer;
	
	
procedure actualizacionMaestroDetalle (var maestro: archivo_Maestro; var detalle: archivo_Detalle);
var
	datoD: integer;
	datoM: tipoPrenda;
begin
	Reset (maestro);
	Reset (detalle);
	read (detalle, datoD);
	while (not EOF(detalle)) do begin
		read (maestro, datoM);
		while (datoD <> datoM.Codigo) do
			read (maestro, datoM);
		datoM.Codigo:= datoM.Codigo * -1;
		seek (maestro, FilePos (maestro) - 1);
		write (maestro, datoM);
		read (detalle, datoD);
	end;
	
	close (detalle);
	close (maestro);
end;


procedure GuardarEnLaLista (var L: lista; dato: tipoPrenda; var LU: lista);
var
	nuevo: lista;
begin
	new (nuevo);	nuevo^.sig:= nil; nuevo^.dato:= dato;
	if (L = nil) then begin
		L := nuevo;
		LU:= L;
	end else begin
		LU^.sig:= nuevo;
		LU:= nuevo;	
	end;
end;



procedure BajaFisica (var maestro: archivo_Maestro);
var
	L, LU: lista;
	viejoM: archivo_Maestro;
	dato: tipoPrenda;
begin
	Assign (viejoM, 'MaestroAnterior');
	Rewrite (viejoM);
	L:= nil;
	LU:= nil;
	reset (maestro);
	
	while (not EOF (maestro)) do begin
		read (maestro, dato);					//////////////////////////////////////////////////		IDK
		write (viejoM, dato);
		if (dato.Codigo < 0) then
			GuardarEnLaLista (L, dato, LU);
	end;
	
	Rewrite (maestro);
	while (L <> nil) do begin
		write (maestro, L^.dato);
		L:= L^.sig;	
	end;
	
	Close (maestro);
	Close (viejoM);

end;



var
	a_Maestro: archivo_Maestro;
	a_Detalle: archivo_Detalle;
begin
	Assign (a_Maestro, 'a');
	reset (a_Maestro);
	Assign (a_Detalle, 'b');
	reset (a_Detalle);
	
	actualizacionMaestroDetalle (a_Maestro, a_Detalle);
	bajaFisica (a_Maestro);


end.

