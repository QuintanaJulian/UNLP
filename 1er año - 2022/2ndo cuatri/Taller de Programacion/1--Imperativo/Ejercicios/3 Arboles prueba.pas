Program arboles;

Type
		arbol = ^nodo;
	
		nodo = record
			dato: integer;
			HI: arbol;
			HD: arbol;
		end;

Procedure crear (var A:arbol; num:integer);
	Begin
		if (A = nil) then begin
			new(A);
			A^.dato:= num; 		A^.HI:= nil; 		A^.HD:= nil;
		end else
				if (num < A^.dato) then 
					crear(A^.HI,num)
				else crear(A^.HD,num)   
		End;

Procedure GenerarArbol (var A: arbol);
var
num: integer;
begin
	A:= nil;
	read (num);
	while (num <> 0) do begin
		crear (A, num);
		read (num);
end;
end;


Procedure enOrden ( a : arbol );
begin
   if ( a<> nil ) then begin
    enOrden (a^.HI);
    write (' - ',a^.dato);
    enOrden (a^.HD);
   end;
end;

Procedure preOrden ( a : arbol );
begin
   if ( a<> nil ) then begin
    write (' - ',a^.dato);   
    preOrden (a^.HI);
    preOrden (a^.HD);
   end;
end;

Procedure posOrden ( a : arbol );
begin
   if ( a<> nil ) then begin
    posOrden (a^.HI);
    posOrden (a^.HD);
    write (' - ',a^.dato);

   end;
end;

Function Buscar (a:arbol; x:integer): arbol; 
 begin
  if (a=nil) then 
      Buscar:=nil
  else if (x = a^.dato) then 
		write ('El numero buscado se encuentra en el arbol')
       else 

        if (x < a^.dato) then 
          Buscar:= Buscar(a^.hi ,x)
        else  
          Buscar:=Buscar(a^.hd ,x)
end;




Var
	A: arbol; elemento: integer;
Begin
	GenerarArbol (A);
	writeln ('LOS DATOS INGRESADOS EN ORDEN: ');
	enOrden (A);
	WRITELN ('');
	writeln ('LOS DATOS INGRESADOS EN PRE-ORDEN: ');
	preOrden (A);
	WRITELN ('');
	writeln ('LOS DATOS INGRESADOS EN POS-ORDEN: ');
	posOrden (A);
	
	read (elemento);
	Buscar (A, elemento);
	//write (Buscar(A, elemento)^.dato);
End.
