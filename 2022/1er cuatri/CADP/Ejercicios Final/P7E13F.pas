program P7E13;
const
	maxTematicas = 35;
type

Tematicas = 1..maxTematicas;

libro = record
	Titulo: String;
	Nombre: String;
	Paginas: integer;
	Edicion: integer;
	Ventas: integer;
	Tematica: Tematicas;
	end;
	
lista = ^nodo;

nodo = record
	dato: libro;
	sig: lista;
	end;

vector = array [1..100] of integer;

procedure cargarVector (var V: vector);
var
	i: integer;
begin
		for i:= 1 to 100 do begin
			V[i] := i * 2;
		end;
end;

function busquedaDicotomica (V: vector): boolean;
var
	pri, medio, ult, Busc: integer;
begin
	busquedaDicotomica:= false;
	read (Busc);
	pri:= 1;
	ult:= 100;
	medio:= (pri + ult) div 2;
	while (pri <= ult) and (V[medio] <> Busc) do begin
		if (V[medio] < Busc) then
			pri:= medio + 1
		else ult:= medio - 1;
		medio:= (pri + ult)  div 2;
	end;
	if (pri <= ult) and  (V[medio] = Busc) then
		busquedaDicotomica:= true;
	
end;





procedure LeerVector (V: vector);
var
	i: integer;
begin
	for i:=1 to 100 do
		writeln (i, '	',V[i]);
end;

var
	V: vector;
begin
	cargarVector (V);
	if 	busquedaDicotomica (V) = true then
		write ('Se encontro')
	else	write ('No se econtro');
	LeerVector (V);
end.
