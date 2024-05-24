program punteros;
type
cadena = string[50];
puntero_cadena = ^cadena;
ArrPunteros = array[1..2500] of puntero_cadena;
ArrCadena = array [1..2500] of cadena;

var
pc: puntero_cadena;
ArrayPunteros: ArrPunteros;
ArrayCadena: ArrCadena;
PunArrayCadena: ^ArrCadena;

begin
writeln(sizeof(pc), ' bytes un puntero de un string');
new(pc);
writeln(sizeof(pc), ' bytes un puntero de un string ya inicializado'); 
pc^:= 'un nuevo nombre'; 
writeln(sizeof(pc), ' bytes un puntero de un string ya inicializado y con datos'); 
writeln(sizeof(pc^), ' bytes contenidos dentro del string con 15 digitos');
pc^:= 'otro nuevo nombre distinto al anterior';
writeln(sizeof(pc^), ' bytes contenidos dentro del string con 38 digitos');
writeln (sizeof(ArrayCadena), ' bytes un array de strings');
writeln (sizeof(ArrayPunteros), ' bytes un array de punteros de strings');
writeln (sizeof(PunArrayCadena), ' bytes un puntero array de strings');
new(PunArrayCadena);
writeln (sizeof(PunArrayCadena^), ' bytes un puntero array de strings');


end.
