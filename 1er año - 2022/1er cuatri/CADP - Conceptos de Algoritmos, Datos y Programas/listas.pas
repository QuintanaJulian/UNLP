Program uno;

Type listaE= ^datosEnteros;
     
     datosEnteros= record
                    elem:integer;
                    sig:listaE;
                   end;
procedure crear (var pri:listaE);
	begin
	pri:= nil;	
	end;

procedure agregarAdelante (var pri:listaE; num: integer);
	var
		nuevo:listaE; 
		
		begin
			new(nuevo); nuevo^.elem:= num; nuevo^.sig:=nil;
			if (pri=nil) then pri:= nuevo			
			else begin
				nuevo^.sig:= pri;
				pri:= nuevo;
			end;	
		end;

Var 
  pri: listaE; 
  num:integer;
Begin
  crear(pri);
  read (num);
  agregarAdelante (pri,num);
  
  writeln (pri.^elem);
End.
