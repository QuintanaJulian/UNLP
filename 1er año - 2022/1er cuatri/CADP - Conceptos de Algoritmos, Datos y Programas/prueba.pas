program ejercicio;
var
 i, valor, valorTotal, valor5: integer;
begin
 valorTotal:= 0;
 valor5:= 0;
 for i:= 1 to 10 do
	begin
		write ('Inserte nuevo valor: ');
		readln (valor);
		valorTotal:= valorTotal + valor;
		writeln ('El valor total es: ', valorTotal);
		if (valor > 5) then
			valor5:= valor5 + 1;
	end;
	write ('Hubo un total de ', valor5, ' numeros mayores a 5')
end.
