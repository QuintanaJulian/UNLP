program prueba recursivo;

procedure recursivo (var vuelta:integer );
var
numero: integer;
begin
	writeln ('-- Primera parte --', vuelta);
	read (numero);
	if (numero > 1) then begin
		writeln ('---- Segunda parte ----', vuelta);
		vuelta:= vuelta + 1;
		recursivo (vuelta);
		writeln ('------ Tercera parte ------', vuelta);
		end;
	writeln ('-------- Cuarta parte --------', vuelta);
end;

var
	vuelta: integer;
begin
	vuelta:= 1;
	recursivo (vuelta);
end.
