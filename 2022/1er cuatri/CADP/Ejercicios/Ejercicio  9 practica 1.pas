program ejercio9;
var
	character: char;
	numero, valorT: integer;
begin
	valorT:= 0;
	numero:= 0;
	read (character);
	if ((character = '+') or (character = '-' )) then
	begin
		repeat begin
			read (numero);
			valorT:= valorT + numero;
		end;
		until(numero= 0);
	end;
end.
