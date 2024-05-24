program PParcial2;

const
	poliza1 = 1;
	poliza2 = 2;
	poliza3 = 3;
	poliza4 = 4;
	poliza5 = 5;
	
type
	montoA = array [1..6] of integer;
	
	datos = record
		codigo: integer;
		dni: integer;
		nombre: integer;
		poliza: integer;	
		end;
	
	clientes = ^lista;
	
	lista = record
		datos : datos;
		sig : clientes;
		end;

procedure cargarMontoA (MontoA: montoA);
	var
		i: integer;
	begin
		for i:=1 to 5 do begin
			MontoA [i]:= i * 1;
		end;
	end;

procedure insertarAtras (clientes: clientes);
var

begin

end;



var
clientes: clientes;

begin
cargarMontoA (MontoA);
new (clientes);
insertarAtras (clientes);


end.
