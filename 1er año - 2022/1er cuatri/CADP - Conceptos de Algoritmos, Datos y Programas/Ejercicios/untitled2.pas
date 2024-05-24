// analizar terrenos hasta '@'			terrenos H = A		terrenos con H < 2A
//leer mientras superficie total de terrenos < 10000m2			informar terrenos > 200m2



program PracticaWhileRepeatFor;

var 
	H, A : real;

procedure terrenosCuadrados;
	begin
	
		if (H = A) then

			terrenosCuadrados:= terrenosCuadrados + 1;
	end;
	
procedure terrenosRectangulares;
	begin 
		if (H < (2 * A)) then
			terrenosRectangulares:= terrenosRectangulares + 1;
	end;
	
var 	
	d,c: integer;

BEGIN
//	terrenosCuadrados:= 0;
//	terrenosRectangulares:= 0;
	write ('Ingrese ancho del terreno: ');
	readln (A);
	write ('Ingrese alto del terreno: ');
	readln (H);
	terrenosCuadrados;
	terrenosRectangulares;
	writeln (terrenosCuadrados);
	writeln (terrenosRectangulares);
END.

