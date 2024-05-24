program ej1;
var 
	caramelos, clientes, resto: integer;
	cobro: real;
begin    
	write ('El quioskero posee: ');
	read (caramelos);
	write ('Para vender entre: ');
	read (clientes);
	resto:= caramelos mod clientes;
	writeln ('Si vendio ', caramelos, ' cada cliente obtiene: ', caramelos div clientes, ' el quisquero se quedo con: ',
	resto);
	write ('El precio de cada caramelo es: ');
	readln (cobro);
	write ('En total Cobro: ');
	cobro := cobro * ((caramelos div clientes) * clientes);
	writeln (cobro:2:2);
end.
