program P2E16;
const
	cantidadDetalles = 10;
	valorAlto = 9999;

type
	tipoDetalle = record
		Codigo: integer;
		Precio: double;
		Fecha: integer;
	end;
	
	tipoMaestro= record	
		Codigo: integer;
		Nombre: String;
		Descripcion: String;
		Modelo: String;
		Marca: String;
		Stock: integer;
	end;
	
	archivo_Detalle = file of tipoDetalle;
	
	archivo_Maestro = file of tipoMaestro;
	
	vector_Archivo_Detalle = array [1..cantidadDetalles] of archivo_Detalle;

procedure LeerDet (var a: archivo_Detalle; var dato: tipoDetalle);
begin
	if (not EOF(a)) then begin
		read (a, dato);
		Seek (a, FilePos(a) - 1);
	end else
		dato.Codigo:= valorAlto;
		
end;


procedure MinimoDetalle (v_Det: vector_Archivo_Detalle; var datoMin: tipoDetalle);
var
	actual: tipoDetalle;
	i, posMin: integer;
	
begin
	datoMin.Codigo:= valorAlto;
	i:= 0;
	for i:= 1 to cantidadDetalles do begin
		LeerDet (v_Det[i], actual);
		if (actual.Codigo < datoMin.Codigo) then begin
			datoMin := actual;
			posMin:= i;
		end;
	end;
	if (posMin <> 0) then Seek (v_Det[posMin], (FilePos(v_Det[posMin]) + 1));
end;
	
	
procedure ActualizacionMaestroDetalle (var a_Mae: archivo_Maestro; v_Det: vector_Archivo_Detalle);
var
	i: integer;
	anterior, actual: tipoDetalle;
	datoMaestro: tipoMaestro;
	actVendidas, maxVendidas: integer;
	motoVendidasMax: tipoMaestro;
begin
	for i:= 1 to cantidadDetalles do
		Reset (v_Det[i]);
	Reset (a_Mae);
	
	MinimoDetalle (v_Det, actual);
	maxVendidas:= 0;
	while (actual.Codigo <> valorAlto) do begin
		actVendidas:= 0;
		anterior:= actual;
		read (a_Mae, datoMaestro);
		while (actual.Codigo <> datoMaestro.Codigo) do
			read (a_Mae, datoMaestro);
		Seek (a_Mae, FilePos (a_Mae) - 1);
		
		while (actual.Codigo = anterior.Codigo) do begin
			actVendidas+= 1;
			datoMaestro.Stock:= datoMaestro.Stock - 1;
			MinimoDetalle (v_Det, actual);
		end;
		
		if (actVendidas > maxVendidas) then begin
			maxVendidas:= actVendidas;
			motoVendidasMax:= datoMaestro;
		end;
		
		write (a_Mae, datoMaestro);
	end;
	
	
	writeln ('La moto mas vendida fue la moto: ', motoVendidasMax.Marca, ' ', motoVendidasMax.Modelo, ' ',motoVendidasMax.Nombre);
end;


var
	a_Mae: archivo_Maestro;
	v_Det: vector_Archivo_Detalle;
	i: integer;
	cadena: String;
begin
	for i:= 1 to cantidadDetalles do begin
		Str(i, cadena);
		Assign (v_Det[i], ('Detalle' + cadena));
		reset (v_Det[i]);
	end;
	reset (a_Mae);
	
	ActualizacionMaestroDetalle (a_Mae, v_Det);


end.
		
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
