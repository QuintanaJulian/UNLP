// Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
//del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
//lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
//total acumulado en ventas de todo el mes



program ej8;
var 
	aux, dia, ingreso, ingresoDia, ingresoT, montoMax, diaMax : integer;
begin  
dia:= 0;
ingreso:= 0;
ingresoDia:= 0;
ingresoT:= 0;
montoMax:= 0;
diaMax:= 0;
	for aux:=1 to 3 do 
	begin
		repeat begin
			write ('Monto cobrado: ');
			readln (ingreso);
			ingresoDia:= (ingresoDia + ingreso);
		end;
		until (ingreso=0);
		dia:= dia + 1;
		writeln ('Los ingresos del dia ', dia, ' fueron de: ', ingresoDia);
		ingresoT:= ingresoT + ingresoDia;
		if (montoMax < ingresoDia) then begin
			montoMax:= ingresoDia;
			diaMax:= dia;
		end;
		ingresoDia:=0;
	end;
	writeln ('Los ingresos totales del mes fueron de: ', ingresoT);
	writeln ('El dia ', diaMax, ' fue el dia con los mayores ingresos. Los ingresos de este dia fueron de: ', montoMax)
end.
