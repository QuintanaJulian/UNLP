program hola; 
var
	valor: char;
	letras, numero, especiales: integer;
begin
	valor:= 'z'; letras:=0; numero:=0; especiales:= 0;
	//while (valor <> '0' ) do begin
	repeat

		write ('ingrese valor: ');
		readln (valor);
		if (valor <> '0') then begin
		case valor of
			'a', 'b', 'c': letras:= letras + 1;
			'1', '2', '3': numero:= numero + 1;
			else 
				begin 
				writeln ('Es un caracter no identificado'); 
				especiales:= especiales + 1; 
				end;
		end;
		end;
	until (valor = '0');
	//end;
	writeln ('cantidad de letras: ', letras );
	writeln ('cantidad de numeros: ', numero);
	writeln ('cantidadd de caracteres especiales: ', especiales);

end.
	
