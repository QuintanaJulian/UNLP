program f1nal_feb2020;

const
	maxTipo = 12;

type
	
	cantTipoP = 1..maxTipo;
	
	datoPublicacion = record
		Titulo: String;
		Nombre: String;
		DNI: integer;
		Tipo: cantTipoP;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: datoPublicacion;
		sig: lista;
		end;

	vectorTipos = array [1..maxTipo] of integer;
	
	
procedure InsertarAdelante (var L: lista; dato: datoPublicacion);
var
	nuevo: lista;
begin
	new (nuevo); nuevo^.dato:= dato;
	
	nuevo^.sig:= L;
	L:= nuevo 
end;

procedure CargarDatos (var L: lista);
var
	dato: datoPublicacion;
begin
	repeat begin
		write ('Insertar DNI: ');
		read (dato.DNI);
		if (dato.DNI <> 0) then begin
			dato.Titulo:= 'El pricipito';
			dato.Nombre := 'Corina Graciano';
			dato.Tipo:= random (11) + 1;
			writeln ('        - Publicacion tipo: ', dato.Tipo);
			InsertarAdelante (L, dato);
		end;
	end until (dato.DNI = 0)
end;

procedure AnalizarCantPublicaciones (cantT: vectorTipos);
var
	maxPubli, numPubli, i : integer;
begin
	maxPubli:= -99;
	for i:= 1 to maxTipo do begin
		if ( cantT[i] > maxPubli) then begin
			maxPubli:= cantT[i];
			numPubli:= i;
		end;
	end;
	writeln ('El tipo de publicacion con mas votos es el tipo ', numPubli, ' con ', maxPubli, ' votos.');
end;

procedure AnalizarAutor (dato: datoPublicacion; var publicaciones: integer; var DNI: integer);
begin
//	if (dato <> nil) then begin
		if (dato.DNI = DNI) then
			publicaciones:= publicaciones + 1
		else begin
			if (DNI <> 0) then 
				writeln ('El autor con DNI ', DNI, ' tuvo un total de ', publicaciones, ' publicaciones.');
			publicaciones:= 1;
			DNI:= dato.DNI;
		end;
	end;


procedure AnalizarLista (L: lista);
var
	cantT: vectorTipos;
	i, publicaciones, DNI: integer;
begin
	for i:= 1 to maxTipo do
		cantT[i]:= 0;
	Publicaciones:= 0;
	DNI:= 0;
	
	while (L <> nil) do begin
		cantT[ L^.dato.Tipo ] := cantT[ L^.dato.Tipo ] + 1;
		AnalizarAutor ( L^.dato,  publicaciones, DNI);
		L:= L^.sig;
	end;
	writeln ('El autor con DNI ', DNI, ' tuvo un total de ', publicaciones, ' publicaciones.');
	AnalizarCantPublicaciones (cantT);
end;

var
	L: lista;
begin
	L:= nil;
	CargarDatos (L);
	AnalizarLista (L);
end.





