program f1nal_octubre2022;
const
	maxDispone = 100;

type

	DISPONE = array [1..maxDispone] of char;
	
	cantLetras = array [1..27] of integer;
	
procedure ADISPONE (var A100 : DISPONE; var diml: integer);
var
	i: integer;
	aux: char;
begin
	i:= 1;
	aux:= z;
	while (i <= maxDispone) and (aux <> '0') do begin
		read (aux);
		A100[i]:= aux;
		dimL:= dimL + 1;
		end;
	i:= i-1;
end;

procedure AnalizarVector (V: DISPONE; dimL: integer;)






var
	A100: DISPONE;
	dimL: integer;
begin
	ADISPONE (A100, dimL);
	 
end;
