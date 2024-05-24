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
	writeln ('------');
	Assign (a_empleados, a_fisico);												//una vez que el programa empieza a mdificarlo no puede ser renombrado
	writeln ('------');
	Rewrite (a_empleados);
	writeln ('------');
	
	
	
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
	
	Close (a_empleados);
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
	Close (a_empleados);
end;



procedure Chekear (var a_empleados: archivo; dato: tipoEmpleados; var esta: boolean);
var
	actual: tipoEmpleados;
begin
	reset (a_empleados);
	esta:= false;
	if not EOF (a_empleados) then begin
		read (a_empleados, actual);
		while (not EOF (a_empleados)) and (esta = False) do begin
			if 	(dato.Numero = actual.Numero) then begin
					esta:= True;
					end
			else begin
				read (a_empleados, actual);
			end;
		end;
		
	end;
	if 	(dato.Numero = actual.Numero) then
		esta:= true;
	
end;

{
if not EOF (a_empleados) then begin
	repeat
		read (a_empleados, actual);
		if (actual.Codigo = dato.Codigo) then
			esta:= true;
		
		
	until (EOF (a_empleados)) or (esta = true);
end;
end;}


procedure AnadirEmpleado (var a_empleados: archivo);
var
	nuevo: tipoEmpleados;
	Repetido: boolean;
begin
	reset (a_empleados);
	
	write ('Ingrese Codigo de empleado a añadir');
	readln (nuevo.Numero);
	while nuevo.Numero <> 000 do begin
		write ('	Ingrese nombre: ');
		readln (nuevo.Nombre);
		write ('	Ingrese apellido: ');
		readln (nuevo.Apellido);
		write ('	Ingrese edad: ');
		readln (nuevo.Edad);
		write ('	Ingrese DNI: ');
		readln (nuevo.DNI);
		
		Chekear (a_empleados, nuevo, Repetido);

		if Repetido = false then begin
			Seek (a_empleados, FileSize(a_empleados));
			write (a_empleados, nuevo);
			end
		else
			writeln ('Dicho empleado ya se encuentra guardado');
			
		write ('Ingrese Codigo de empleado a añadir o 000 para terminar');
		readln (nuevo.Numero);
		end;
	close (a_empleados);
end;




procedure ModificarEdad (var a_empleados: archivo);
var
	nuevo, actual: tipoEmpleados;
	repetido: boolean;
begin
	write ('Ingrese Codigo de empleado deseado: ');
	readln (nuevo.Numero);
	while nuevo.Numero <> 00 do begin
		write ('Nueva edad que desea cargarle: ');
		readln (nuevo.Edad);
		Chekear (a_empleados, nuevo, repetido);
		if repetido = true then begin
			Seek (a_empleados, (FilePos(a_empleados) - 1));
			read (a_empleados, actual);
			actual.Edad:= nuevo.Edad;
			Seek (a_empleados, (FilePos(a_empleados) - 1));
			write (a_empleados, actual);
			end
			else
				writeln ('No se encontro dicho empleaado.');
		write ('Ingrese Codigo de empleado deseado: (codigo 00 para terminar)');
		readln (nuevo.Numero);
		end;
		close (a_empleados);
end;

procedure ExportarArchivo (var a_empleados: archivo);
var
	a_texto: Text;
	E: tipoEmpleados;
begin
	Assign (a_texto, 'TodosEmpleados.txt');
	Reset (a_empleados);
	if not EOF (a_empleados) then begin
		Rewrite (a_texto);
	
		repeat
		read (a_empleados, E);
	//while not EOF (a_empleados) do begin
//	cadena:= 'Nombre: ' + E.Nombre + ',  Apellido: ' + E.Apellido ; //+', Edad: ' + E.Edad  + ', DNI: ' + E.DNI + ', Numero empleado:' + E.Numero ;
		//writeln (a_texto, E.Edad, ' ', E.DNI, ' ', E.Numero, ' ',E.Nombre,  ' ', E.Apellido); 
		writeln (a_texto, 'Nombre: ', E.Nombre, '					|  Apellido: ', E.Apellido, '					|  Edad: ', E.Edad, '					|  DNI: ', E.DNI, '					|  Numero:', E.Numero);
	//	read (a_empleados, E);
		until  EOF (a_empleados);
	//end;
		close (a_texto);
		end;
		close (a_empleados);
	end;

procedure ExportarNoCumplen (var a_empleados: archivo);
var
	a_texto: text;
	E: tipoEmpleados;
begin
	Assign (a_texto, 'FaltaDNIEmpleado.txt');
	Reset (a_empleados);
	if not EOF (a_empleados) then begin
		rewrite (a_texto);
		while not EOF (a_empleados) do begin
			read (a_empleados, E);
			if (E.DNI = 00) then begin
				writeln (a_texto, 'Nombre: ', E.Nombre, '					|  Apellido: ', E.Apellido, '					|  Edad: ', E.Edad, '					|  DNI: ', E.DNI, '					|  Numero:', E.Numero);
			end;
		end;
		close (a_texto);
	end;
	close (a_empleados);
	
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
	writeln ('          4-  Añadir empleados.');
	writeln ('          5-  Modificar edad de empleados.');
	writeln ('          6-  Exportar empleados (todos_empleados.txt)');
	writeln ('          7-  Exportar empleados que no cargaron DNI (faltaDNIEmpleado.txt)');
	writeln ('          9-  Volver.');
	read (aux);
	case aux of
		1: BuscarUnEmpleado(a_empleados);
		2: LeerTodosEmpleados(a_empleados);
		3: LeerProximosJubilados(a_empleados);
		4: AnadirEmpleado (a_empleados);
		5: ModificarEdad (a_empleados);
		6: ExportarArchivo (a_empleados);
		7: ExportarNoCumplen (a_empleados);
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

