program P2E1;
type 
	tipoEmpleado = record
		Codigo: integer;
		Nombre: String;
		Comision: integer;
		end;
		
	archivo_Empleados = file of tipoEmpleado;
	
procedure CompactarComisiones (var a: archivo_Empleados; var a_comp: archivo_Empleados);
var
	actual, total: tipoEmpleado;

begin
	reset (a);
	rewrite (a_comp);
	
	read (a, actual);
	while (not EOF (a)) do begin
		total:= actual;
		total.Comision := 0;
		while ((not eof(a)) and (actual.Codigo = total.Codigo)) do begin
			total.Comision:= total.Comision + actual.Comision;
			read (a, actual);
		end;
		write (a_comp, total);
	end;
	
	close (a);
	close (a_comp);
end;

var
	a, comp: archivo_Empleados;
begin
	Assign (a, 'a');
	Assign (comp, 'b');
	Reset(a);
	Reset (comp);
	CompactarComisiones (a, comp);


end.
