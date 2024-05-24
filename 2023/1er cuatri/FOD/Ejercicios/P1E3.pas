program P1J3;

type
	tipoEmpleados  = record
		Numero: integer;
		Apellido: string;
		Nombre: string;
		Edad: integer;
		DNI: integer ;
		end;

	archivo = file of tipoEmpleados;
	

procedure CrearArchivo (var a_empleados: archivo);
var
	a_fisico: string;
	dato: tipoEmpleados;
begin
	write ('Ingrese nombre del archivo que quiere crear.');
	read (a_fisico);
	Assign (a_empleados, a_fisico);
	Rewrite (a_empleados);
	
	
	
	writeln ('Datos del empleado a intresar:');
	write ('	Ingrese apellido: ');
	readln (dato.apellido);																				// CHEQUEAR POR QUE DA ESTE ERROR
	readln (dato.Apellido);																				// AL PRIMER READ SE LO COME
	while (dato.Apellido <> 'fin' ) do begin
		write ('	Ingrese nombre: ');
		readln (dato.Nombre);
		write ('	Ingrese numero de empleado: ');
		readln (dato.Numero);
		write ('	Ingrese edad: ');
		readln (dato.Edad);
		write ('	Ingrese DNI: ');
		readln (dato.DNI);
		
		Write (a_empleados, dato);
		writeln ('Empleado guardado.');
		writeln ('Ingrese "fin" para terminar');
		write ('	Ingrese apellido: ');
		readln (dato.Apellido);
	end;
	
	Close (a_empleados);
	
end;


procedure LeerEmpleado (E: tipoEmpleados);
begin
	writeln ('	|  Nombre: ', E.Nombre, '				|  Apellido: ', E.Apellido);
	writeln ('	|  Edad: ', E.Edad, '				|  DNI: ', E.DNI, '			|  Numero:', E.Numero);
	writeln ('----- -----	----- -----	----- -----	----- -----	----- -----	----- -----	----- -----')
end;

Procedure BuscarUnEmpleado (var a_empleados: archivo);
var
	nombre, apellido: string;
	empleado:  tipoEmpleados;
	encontrado: boolean;
begin
	encontrado:= false;
	write ('Nombre: ');
	readln (nombre);
	readln (nombre);
	write ('				Apellido: ');
	readln (apellido);
	Reset (a_empleados);
	while not EOF (a_empleados)  do begin
		read (a_empleados, empleado);
		if (empleado.Apellido = apellido) and (empleado.Nombre = nombre) then begin
			encontrado:= true;
			LeerEmpleado (empleado)
			end;
	end;
	
	if encontrado = true then
		writeln ('Esos son todos los empleados con dicho nombre')
	else
		writeln ('Dicho empleado no se encuentra guardado.');

end;

procedure LeerTodosEmpleados (var a_empleados: archivo);
var
	empleado: tipoEmpleados;
begin
	reset (a_empleados);
	while not EOF (a_empleados) do begin
		read (a_empleados, empleado);
		LeerEmpleado (empleado);
	end;
	writeln ('----- -----	----- -----	----- -----	----- -----	----- -----	----- -----	----- -----');
	end;

Procedure LeerProximosJubilados (var a_empleados: archivo);
var
	empleado: tipoEmpleados;
begin
	reset (a_empleados);
	writeln ('Esta es la lista de los empleados proximos a jubilarse: ');
	while not EOF (a_empleados) do begin
		read (a_empleados, empleado);
		if empleado.Edad > 70 then
			LeerEmpleado (empleado);
	end;
	writeln ('----- -----	----- -----	----- -----	----- -----	----- -----	----- -----	----- -----');
end;







procedure AnalizarArchivo (var a_empleados: archivo);
var
 aux: integer;
begin
aux:= 0;
while aux <> 9 do begin
	writeln ('Que desea leer del archivo?');
	writeln ('          1-  Buscar persona.');
	writeln ('          2-  Leer todos los empleados.');
	writeln ('          3-  Ver proximas jubilaciones.');
	writeln ('          9-  Volver.');
	read (aux);
	case aux of
		1: BuscarUnEmpleado(a_empleados);
		2: LeerTodosEmpleados(a_empleados);
		3: LeerProximosJubilados(a_empleados);
		9: writeln ('Volviendo.')
		else writeln ('Esa funcionalidad no esta implementada.');
end;
end;
end;


var
aux: integer;
a_empleados:archivo;
begin
	assign (a_empleados, '1');
	aux:=0;
	while aux <> 9 do begin
		writeln ('Que operacion desea hacer:');
		writeln ('       1-  Crear archivo.');
		writeln ('       2-  Modificar archivo existente.');
		writeln ('       9-  Cerrar.');
		readln (aux);
	
		case aux of
			1: CrearArchivo (a_empleados);
			2: AnalizarArchivo (a_empleados);
			9: write ('Gracias por utilizarnos');
			else writeln ('Esa funcionalidad no esta implementada.');
		end;
	end;
end.

