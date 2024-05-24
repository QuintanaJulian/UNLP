Program merge;
Type 
 lista =^nodo;
 nodo = record
  dato:string;
  sig:lista;
 end; 

Procedure minimo(var e1,e2:lista; var min:string);
Begin
  min := 'ZZZ';
  if (e1 <> nil) and (e2 <> nil)then
       if (e1^.dato <= e2 ^.dato ) then 
         begin
           min:= e1^.dato;
           e1:= e1 ^.sig; 
         end
       else begin
         min:= e2 ^.dato;
         e2:= e2 ^.sig;
       end 
  else 
    if (e1 <> nil) and (e2 = nil) then begin
      min:= e1^.dato;
      e1:= e1 ^.sig;
    end 
    else 
      if (e1 = nil) and (e2 <> nil) then begin
         min:= e2 ^.dato;
         e2:= e2 ^.sig; 
       end;
end;


Procedure merge (E1,E2:lista; var Enuevo:lista);
Var 
 min: string;
Begin
  Enuevo:= nil;
  minimo (E1,E2,min);
  while (min <> 'ZZZ') do begin
     agregarAtras (Enuevo,min);
     minimo (E1,E2,min);
    end;
End;  

Var
 estante1, estante2: lista;
 estanteNuevo: lista; 

Begin
 generarEstante (estante1);
 generarEstante (estante2);
 merge (estante1,estante2,estanteNuevo);
End.  
