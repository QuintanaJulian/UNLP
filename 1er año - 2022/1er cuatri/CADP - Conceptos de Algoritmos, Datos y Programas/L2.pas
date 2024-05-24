program listainsertar;
type
	 listaE= ^datosEnteros;
	 
	 datosEnteros=record
		elem: integer;
		sig:listaE;
	 end;
	 
	 
procedure crear (var pri: listaE);
	begin
		pri:= nil;	
	end;


Procedure insertar (var pI:listaE; valor:integer);
Var
  nuevo,actual,ant:listaE;
Begin
  new (nuevo); nuevo^.elem:= valor; nuevo^.sig:=nil;
  if (pI = nil) then
    pI:= nuevo
  else begin
    actual:= pI; ant:=pI;
    while (actual <> nil) and (actual^.elem < nuevo^.elem) do   
	begin
		ant:=actual;
		actual:= actual^.sig;
		end;
     
	if (actual = pI) then 
	begin
		nuevo^.sig:= pI;
		pI:= nuevo;
		end
	else
	begin
	ant^.sig:=nuevo;
	nuevo^.sig:= actual;
 end
End;
End;

function buscar (pI: listaE; valor:integer):boolean;
Var
 aux:listaE; 
 encontre:boolean;

Begin
  encontre:= false;
  aux:= pI;
  while ((aux <> nil) and (encontre = false)) do
   begin
      if (aux^.elem = valor) then encontre:=true
      else
        aux:= aux^.sig;
   end;
   buscar:= encontre; 
end;

procedure posicion (pI: listaE; nPosicion: integer; var valorPosicion: real);
var
	i: integer;
	auxS: listaE;
begin
	i:= 1;
	auxS:= pI;
	while (i <> nPosicion) and (auxS<>nil) do begin
		auxS:= auxS^.sig;
		i:= i + 1;		
		end;
	valorPosicion:= auxS^.elem;
end;

var
	pri:listaE; num:integer;	encontre:boolean; i:integer;

	nPosicion: integer; valorPosicion: real;
begin
	crear (pri);
	for i:=1 to 8 do begin
		read (num);
		insertar (pri,num);
	end;
	
	write(pri^.elem);
	write ('El numero a encontrar es: ');
	read (num);
	encontre:= buscar (pri, num);
	write (encontre);
	
	valorPosicion:= 100;
	write ('el valor en ');
	read (nPosicion);
	posicion (pri,nPosicion, valorPosicion);
	
	write (' es de ', valorPosicion:2:2);
end.
