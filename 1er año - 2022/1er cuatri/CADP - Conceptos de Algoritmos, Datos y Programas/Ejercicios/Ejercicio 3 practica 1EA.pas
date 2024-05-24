//		tanques circulares C				rectanculares R
//
//		Radio (R) Alto (H)			Ancho (A) Largo (L) Alto (H)
//		
//2 mayores volumenes			volumen promedio C		volumen promedio R		cant tanques H<1.4		cant tanques Vol < 800m3		

program untitled;

const
	pi= 3.1416;

var
	RC: char;
	volumen: real;
	R, A, L, H: integer;
	volumenMax1, volumenMax2: real;
	volumenPromedioC, volumenPromedioR, volumenSumaR, volumenSumaC, tanquesRectangulares, tanquesCirculares: real;
	
BEGIN

RC:= 'C';
volumenMax1:= 1;
volumenMax2:= 1;
volumenPromedioR:= 0 ; volumenPromedioC:= 0 ;volumenSumaR:= 0 ;volumenSumaC:= 0 ;tanquesRectangulares:= 0 ; tanquesCirculares := 0 ;

while (RC <> 'Z') do begin

	write('Tipo de tanque circular(C) o rectangular(R): ');
	readln (RC);

	if(RC = 'R') then begin
		write ('Ingrese ancho: ');		readln (A);
		write ('Ingrese largo: ');		readln (L);
		write ('Ingrese alto: ');		readln (H);
		volumen:= A * L * H;
		volumenSumaR:= volumenSumaR + volumen;
		tanquesRectangulares:= tanquesRectangulares + 1; 
	end;

	if (RC = 'C') then begin
		write ('Ingrese radio: ');		readln (R);
		write ('Ingrese alto: ');		readln (H);
		volumen:= pi * R * R * H; 
		volumenSumaC:= volumenSumaC + volumen;
		tanquesCirculares:= tanquesCirculares + 1; 
	end;
	writeln ('El volumen es de ', volumen:2:2, ' m2');	
	if	(volumenMax1 < volumen) then begin
			volumenMax2:= volumenMax1;
			volumenMax1:= volumen;
			end
	else if (volumenMax2 < volumen) then
			volumenMax2:= volumen;
	end;
	
	
	
//end; 





writeln ('El tanque vendido con mayor volumen fue de: ', volumenMax1:2:2, 'm3');
writeln ('El segundo tanque vendido con mayor volumen fue de: ', volumenMax2:2:2, 'm3');
	
	
END.

