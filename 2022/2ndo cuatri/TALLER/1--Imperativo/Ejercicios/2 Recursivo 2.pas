program C2e2;

procedure leerNumero ( numero: integer);

begin
	if (numero <> 0) then begin
			writeln (numero mod 10);		//Lee al contrario
			leerNumero (numero div 10); 
			writeln (numero mod 10 );	//Lee en orden
		end;
end;


var
 numero: integer;
begin

	read (numero);
	while (numero <> 0) do begin
		leerNumero (numero);
		read (numero)
		end;
end.
