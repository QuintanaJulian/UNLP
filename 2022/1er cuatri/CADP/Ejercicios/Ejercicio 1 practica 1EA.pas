//	LEER EMPRESSAS HASTA LA 100			CANTIDAD DE INVERSIONES 		MONTO INVERTIDO EN CADA UNA DE ELLAS		PROMEDIO DE CAPITAL POR INVERSION	
//
//	EMPRESA CON MAYOR MONTO TOTAL INVERTIDO				CANTIDAD DE EMPRESAS CON MAS DE 50000 INVERTIDOS.



program Practica1EAEj1;

var
 nEmpresa, cantInversiones, empresaInversionesMax: integer;
 montoInversiones, montoInversionesEmpresa, montoInversionesMax: integer;
 empresas50, aux: integer;
  promedioInversiones: real;
begin

promedioInversiones:= 0;
montoInversionesMax:= 0;
empresaInversionesMax:= 0;
empresas50:= 0;

repeat
	aux:= 1;
	montoInversionesEmpresa:= 0;
	write ('Codigo de la empresa: ');
	readln (nEmpresa);
	write ('Cantidad de inversiones: ');	
	readln (cantInversiones);
	writeln ('Capital invertido en cada empresa: ');

	while (aux <= cantInversiones) do begin
		write ('Invertido en empresa ', aux, ' :');
		readln (montoInversiones);
		montoInversionesEmpresa:= montoInversionesEmpresa + montoInversiones;
		aux:= aux + 1;
		end;
	
//	promedioInversiones:= (montoInversionesEmpresa div cantInversiones) + (montoInversionesEmpresa mod cantInversiones);
	promedioInversiones:= (montoInversionesEmpresa / cantInversiones);

	if montoInversionesMax < montoInversionesEmpresa then begin
		montoInversionesMax:= montoInversionesEmpresa;
		empresaInversionesMax:= nEmpresa;
		end;
	
	if montoInversionesMax > 50000 then begin
		empresas50:= empresas50 + 1;
		end;


	writeln ('El monto promedio invertido por la empresa ', nEmpresa, ' es de: ', promedioInversiones:2:2,
					' con un total de $', montoInversionesEmpresa, ' invertidos.');
//	writeln (promedioInversiones:2:2);

until (nEmpresa >= 100);

writeln ('La empresa numero: ', empresaInversionesMax, ' fue la que mayor capital invirtio, con un total de: $', montoInversionesMax);
writeln ('Hubo un total de ', empresas50, ' empresas que invirtieron mas de $50.000')

end.

