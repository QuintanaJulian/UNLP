program PFinal;
const
	dimF = 100;

type
	
	tipoArray = array [1..dimF] of integer;
	
	
	
procedure CrearVector (var V: tipoArray; var dimL: integer);
var
	i: integer;
	//num: integer;
begin
	dimL:= 0;
	//num:= random(1000);
	for i:=0 to (dimF) do begin
		V[i]:= i;
		dimL+= 1;
	end;
	
end;
	
	
function BusquedaDicotomica (V: tipoArray; num: integer): integer;
var
	inicio, fin, medio: integer;
begin
	inicio:= 1;
	fin:= dimF;
	medio:= (inicio + fin) div 2;
	
	if (num <= V[dimF]) and (num > V[1]) then begin
	
		while (inicio <= fin) and (V[medio] <> num) do begin
		
			if (V[medio] < num) then begin
				inicio:= medio + 1;
			end else begin
				fin:= medio - 1;
			end;
			medio:= (inicio + fin) div 2;
		end;
	
		if (V[medio] = num) then begin
			BusquedaDicotomica:= medio;
		end else begin
			writeln ('El valo ingresado no se encuentra');
			BusquedaDicotomica:= 0;
		end;
	
	end else begin
		writeln ('El valo ingresado no se encuentra');
		BusquedaDicotomica:= 0;
	end;
end;


procedure EliminarDato (var V: tipoArray; num: integer; var dimL: integer);
var
	i, posicion : integer;
begin
	posicion:= BusquedaDicotomica (V, num);
	
	for i:= posicion to dimF do begin
		V[i]:= V[i+1];
	end;
	dimL-= 1;
	
end;

procedure AgregarDato (var V: tipoArray; num: integer; dimL: integer);
var
	i, posicion: integer;
begin

	if (dimL < dimF ) then begin
		posicion:= BusquedaDicotomica (V, num);
	
		for i:= dimL downto posicion do begin
			V[i+1]:= V[i];
		end;
		
		V[posicion] := num
	end;
end;

procedure LeerVector (V: tipoArray);
var
	i: integer;
begin
	writeln ('-------------- VECTOR -----------------');
	for i:=1 to 100 do begin
		Write (V[i] , ' ');
	end;
	writeln (' ');
	writeln ('---------------------------------------');
end;



var
	V:tipoArray;
	dimL: integer;
begin
	CrearVector (V, dimL);
	
	LeerVector (V);
	
	writeln ('El num 1 se encuentra en la pos ', BusquedaDicotomica (V, 1000));
	
	EliminarDato (V, 55, dimL);
	
	writeln ('En la posicion 55 se encuentra:= ', V[55]);
	LeerVector(V);
	
	AgregarDato (V, 56, dimL);

	writeln ('En la posicion 55 se encuentra:= ', V[55]);
	LeerVector (V);
end.
