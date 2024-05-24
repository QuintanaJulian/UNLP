program P3E7;
type 
	tipoAve = record
		Nombre: String;
		Codigo: integer;
	end;

	archivo = file of tipoAve;

procedure BorrarDato (var a: archivo);
var
	base: tipoAve;
	baja: tipoAve;
	dirBaja: integer;
begin
	dirBaja:= filePos(a);
	read (a, baja);
	baja.Codigo:= (dirBaja) * -1;
	Seek (a, 0);
	read (a, base);
	Seek (a, 0);
	write (a, baja);
	Seek (a, dirBaja);
	baja.Codigo:= base.Codigo;
	write (a, baja);	
end;



procedure EliminarAves (var a_Aves: archivo);
var
	aveBaja: Integer;
	actual: tipoAve;
begin
	reset (a_Aves);
	write ('Ingrse codigo del ave a dar de baja: ');
	readln (aveBaja);
	
	while (aveBaja <> 5000) do begin
		Seek (a_Aves, 1);
		read (a_Aves, actual);
		
		actual.Nombre:= actual.Nombre + '#';
		writeln ('La pos es :',   pos('#', actual.Nombre));
		
		
		
		while (not EOF(a_Aves)) and (actual.Codigo <> aveBaja) do
			read (a_Aves, actual);
		if (actual.Codigo = aveBaja) then begin
			Seek (a_Aves, FilePos(a_Aves) - 1);
			BorrarDato (a_Aves);
		end else writeln('El codigo de ave ingresado no se encuentra en el archivo');

		write ('Ingrse codigo del ave a dar de baja (Ingrese 50000 para terminar): ');
		readln (aveBaja);
	end;
end;

procedure BajaFisica (var a: archivo);
var
	nodo, ultimo: tipoAve;
	
	cantBajas, dirBaja: integer;
begin
	reset (a);
	read (a, nodo);
	cantBajas:= 0;
	if (nodo.Codigo < 0) then begin
		dirBaja:= nodo.Codigo * -1;
		while (dirBaja <> 0) do begin			
			Seek (a, FileSize(a) - cantBajas);
			read (a, ultimo);
			Seek (a, dirBaja);
			read (a, nodo);
			Seek (a, dirBaja);
			write (a, ultimo);
			dirBaja:= nodo.Codigo * -1;
			cantBajas:= cantBajas + 1;
		end;
		Seek (a, FileSize(a) - cantbajas);
		Truncate (a);
	end;
		
end;

procedure Leer  (var a: archivo);
var
	nodo : tipoAve;
begin
	while (not EOF(a)) do begin
		read (a, nodo);
		writeln (nodo.Nombre, ' ', nodo.Codigo);
	end;
	write ('	---	---	---	---	---');


end; 
	

var 
	a: archivo;
begin
	Assign (a, 'a');
	Reset (a);
	Leer (a);
	EliminarAves (a);
	Leer (a);
	BajaFisica(a);
	Leer (a);
end.
