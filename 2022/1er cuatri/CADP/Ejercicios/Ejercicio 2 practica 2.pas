//		pantalon remera camisa media				precio >> codigo >> tipo
// 100 productos		2 producots mas baratoas		pantalon mas caro con su codigo		promedio

program untitled;

//procedure	productoMasBarato (var productoBarato1: real; var productobarato2: real; precio:real;)
//	var
//	begin
//
//		si mas barato que el 1
//		
//		si mas barato que el 2
//
//	end;
	
procedure pantalonMasCaro (var pantalonCodigoCaro: real; var pantalonPrecioCaro: real; precio: real; codigo: real; tipo: string );

	begin
		if (tipo = 'pantalon') then begin
			if (precio > pantalonPrecioCaro) then begin
				pantalonCodigoCaro:= codigo;
				pantalonPrecioCaro:= precio;
			end;
		end;
	end;

procedure	precioPromedio (var promedioTotal: real; var precioTotal: real; precio: real; prendas: real);

	begin
		precioTotal:= precioTotal + precio;
		promedioTotal:= precioTotal / prendas;
	end;


var 
	precio, codigo: real;
	prendas: integer;
	tipo: string;
	pantalonCodigoCaro, pantalonPrecioCaro: real;
	promedioTotal, precioTotal: real;
	
	
BEGIN

precioTotal:= 0;
pantalonCodigoCaro:= 0;
pantalonPrecioCaro:= 0;


for prendas:=1 to 2 do begin
	readln (precio);
	readln (codigo);
	readln (tipo);
	
	pantalonMasCaro (pantalonCodigoCaro, pantalonPrecioCaro, precio, codigo, tipo);
	precioPromedio (promedioTotal,precioTotal, precio, prendas);
	
end;

writeln (pantalonCodigoCaro:2:2, pantalonPrecioCaro:2:2);
writeln (promedioTotal:2:2);

END.

