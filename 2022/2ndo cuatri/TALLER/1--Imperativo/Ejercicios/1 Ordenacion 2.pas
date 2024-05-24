{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, 
		DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}
program ej2;
const dimF = 300;
type rango1 = 0..dimF;
     oficina = record
				codigoi: integer;
				dni: integer;
				expensas: real;
			 end;
	 vector = array [1..dimF] of oficina;
	 lista = ^nodo;
	 nodo = record
	          dato: oficina;
	          sig: lista;
	        end;
procedure AlmacenarInformacion (var v: vector; var dimL: rango1);
  
  procedure Leeroficina (var v: oficina);
  begin
   // Randomize;
    write ('Codigo de producto: ');
   // v.codigoi:= random(3) -1;
    readln(v.codigoi);
   // writeln (v.codigoi);
    if (v.codigoi <> -1)
    then begin
			 Randomize;
           write ('Ingrese el dni): ');
           v.dni:= random(1000);
           writeln (v.dni);
           write ('Ingrese el valor de las expensas): ');
           v.expensas:= random(1000);
           writeln(v.expensas:2:2);
         end;
  end;

var unaoficina: oficina;
begin
    dimL := 0;
    Leeroficina (unaoficina);
    while (unaoficina.codigoi <> -1)  and ( dimL < dimF ) do 
    begin
       dimL := dimL + 1;
       v[dimL]:= unaoficina;
       Leeroficina (unaoficina);
    end;
end;
Procedure Ordenar ( var v: vector; dimLog: rango1 );
var i, j: rango1; actual: oficina;	
		
begin
 for i:=2 to dimLog do begin 
     actual:= v[i];
     j:= i-1; 
     while (j > 0) and (v[j].codigoi > actual.codigoi) do      
       begin
         v[j+1]:= v[j];
         j := j - 1;                  
       end;  
     v[j+1]:= actual; 
 end;
end;



procedure ImprimirVector (v: vector; dimL: rango1);
var
   i: integer;
begin
     for i:= 1 to diml do begin
		writeln ('Los datos de la posicion ', i , ': ');
       writeln (v[i].codigoi);
       writeln (v[i].dni);
       writeln (v[i].expensas:2:2);
     end;
End;
var v: vector; diml: rango1;
begin
 AlmacenarInformacion(v,diml);
 ImprimirVector (v, diml);
 Ordenar(v, diml);
  writeln ('');
   writeln ('');
 writeln ('...ESPERE SE ESTA ORDENANDO EL VECTOR');
 writeln ('');
  writeln ('');
 ImprimirVector (v, dimL);
end.
