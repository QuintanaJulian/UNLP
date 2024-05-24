program FinalOctubre2018;

type
	aDispone = array [1..100] of char;
	
	vContadorChar = array ['a'..'z'] of integer;
	

procedure CargarDatos (var V: aDispone; var dimL: integer);
var
	dato: char;
begin
	dimL:= 0;																																						//1 + 1  +  (n + 1) + ((3  + 3) *  n)					.3 + ( 7* n) 	
	dato:= '0';
	while (dato <> '-')do begin
		read (dato);
		if (dato <> '-') and ( dato >= 'a') and ( dato <= 'z' ) then begin
			dimL:= dimL + 1;
			V[dimL]:= dato;
			
		end;
end;
end;

procedure ContadorCharacters (vChar: aDispone; dimL: integer; var vContador: vContadorChar);
var
	aux: char;
	i: integer;
begin
	for aux:='a' to 'z' do																																					//  (26 *3) +2  + (1 * 26) + (3 * n) + 2 + (2 * n)					78 + 2 + 26 + 2 + ( 5 * n) 			108 + (5 * n)
		vContador[ aux ]:= 0;
	for i:= 1 to dimL do 
		vContador[  vChar[i] ]  := vContador[  vChar[i] ] + 1;
end;
	
procedure ImprimirVector ( V: vContadorChar);
var
	aux: char;
begin
	writeln ('-	-	-	-	-	-');	
	for aux:='a' to 'z' do																																				// (3* 26) + 2 												18 + 60 +2				80
		writeln ('	letra ', aux, '		cantidad: ', V[aux]);	
	writeln ('-	-	-	-	-	-');	
end;


procedure InsertarDato (var V: aDispone; var dimL: integer);
var
	dato: char;
	i, g: integer;
begin
	dato:= 'c';
	i:= 1;
	while  (i < dimL) and (V[i] <> dato) do  begin
		i:= i + 1;
	end;
	if (V[i]  = dato) then begin
		g:= dimL;
		while (g >= i) do begin
			V[g+1]:= V[g];
			g:= g -1;
		end;
		V[i]:= dato;
		dimL:= dimL + 1;
	end;
end;






var																																												// TOTAL  ==			80 + 108 + 3 + 7n + 5n		 ==	191 + 12n
	vectorCharacters: aDispone;
	dimL: integer;
	vectorContador: vContadorChar;
	i: integer;
begin
	CargarDatos (vectorCharacters, dimL);
	InsertarDato (vectorCharacters, dimL);
	for i:= 1 to dimL do
		writeln (vectorCharacters[i]);
	ContadorCharacters (vectorCharacters, dimL, vectorContador);
	
	ImprimirVector (vectorContador);
end.























