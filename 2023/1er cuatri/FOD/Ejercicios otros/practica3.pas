program practica3;

type
	empleado = record
		nro: integer;
		apellido: string;
		nombre: string;
		edad: integer;
		dni: longint;
	end;
	
	ArchivoEmpleado = file of empleado;

procedure buscarEmpleado(var Empleados: ArchivoEmpleado; var busqueda: string);

var e:empleado;
begin
	reset(Empleados);
	while not EOF(Empleados) do
	begin
		read(Empleados, e);
		if((busqueda = e.nombre) or (busqueda = e.apellido)) then
			writeln('Nombre:', e.nombre, ' Apellido: ', e.apellido);
	end;
	close(Empleados);
end;

procedure imprimirEmpleados(var Empleados: ArchivoEmpleado);
var e:empleado;
begin
	reset(Empleados);
	while not EOF(Empleados) do
	begin
		read(Empleados,e);
		writeln('Nombre: ' ,e.nombre, ' Apellido: ', e.apellido, ' DNI: ', e.dni, ' Edad: ', e.edad, ' Numero de Empleado: ', e.nro);
	end;
	close(Empleados);
end;

procedure mayor70 (var Empleados: ArchivoEmpleado);
var e:empleado;
begin
	reset(Empleados);
	while not EOF(Empleados) do
	begin
		read(Empleados,e);
		if(e.edad > 70) then
			writeln('Nombre: ' ,e.nombre, ' Apellido: ', e.apellido, ' DNI: ', e.dni, ' Edad: ', e.edad, ' Numero de Empleado: ', e.nro);
	end;
	close(Empleados);
end;

procedure agregarEmpleado(var Empleados: ArchivoEmpleado);
var e:empleado;
	
begin
	reset(Empleados);
	seek(Empleados,filesize(Empleados));
	
	write('Ingrese Apellido: '); readln(e.apellido);
	while(e.apellido <> 'fin') do
	begin
		write('Ingrese Nombre: '); readln(e.nombre);
		write('Ingrese Numero de Empleado: '); readln(e.nro);
		write('Ingrese Edad: '); readln(e.edad);
		write('Ingrese DNI: '); readln(e.dni);
		
		write(Empleados,e);
		
		write('Ingrese Apellido: '); readln(e.apellido);
	end;
	close(Empleados);
end;

procedure modificarEdad(var Empleados: ArchivoEmpleado);
var e:empleado;
begin
	reset(Empleados);
	while not EOF(Empleados) do
	begin
		read(Empleados,e);
		e.edad:=e.edad + 1;
		seek(Empleados,filePos(Empleados)-1);
		write(Empleados,e);
	end;
	close(Empleados);

end;

procedure exportarATexto(var Empleados: ArchivoEmpleado);
var carga: Text;
	e:empleado;
begin
	reset(Empleados);
	assign(carga,' todos_empleados.txt');
	rewrite(carga);
	
	while not eof(Empleados) do
	begin
		read(Empleados,e);
		write(carga,' ',e.apellido, ' ', e.nombre, ' ', e.edad, ' ', e.nro, ' ', e.dni);
	end;
	
	close(Empleados);close(carga);
	
end;

var
	Empleados : ArchivoEmpleado;
	e: empleado; 
	busqueda: string;
	
BEGIN

	assign(Empleados, 'Archivo de Empleados');
	
	rewrite(Empleados);
	
	write('Ingrese Apellido: '); readln(e.apellido);
	while(e.apellido <> 'fin') do
	begin
		write('Ingrese Nombre: '); readln(e.nombre);
		write('Ingrese Numero de Empleado: '); readln(e.nro);
		write('Ingrese Edad: '); readln(e.edad);
		write('Ingrese DNI: '); readln(e.dni);
		
		write(Empleados,e);
		
		write('Ingrese Apellido: '); readln(e.apellido);
	end;
	
	close(Empleados);	

	write('Empleado a buscar: ');readln(busqueda);
	buscarEmpleado(Empleados, busqueda);

	writeln('Lista de Empleados');
	writeln();
	imprimirEmpleados(Empleados);
	writeln();
	writeln('Lista empleado mayor a 70 anios');
	writeln();
	mayor70(Empleados);
	writeln();
	agregarEmpleado(Empleados);
	imprimirEmpleados(Empleados);
	modificarEdad(Empleados);
	writeln();
	writeln('Modificar Edad');
	writeln();
	imprimirEmpleados(Empleados);
	exportarATexto(Empleados);
END.
