program untitled;

type
prenda= record
	tipo: string;
	codigo: string;
	precio: string;
end; 

vector = array [1..10] of prenda;


var
v: vector;
BEGIN
 writeln ('Ingrese prenda 1');
 readln (v[1].tipo);
 readln (v[1].codigo);
 readln (v[1].precio);
 
  writeln ('Ingrese prenda 2');
 readln (v[2].tipo);
 readln (v[2].codigo);
 readln (v[2].precio);
 
 
writeln (v[2].tipo);
writeln (v[2].codigo);
writeln (v[2].precio);
	
END.

