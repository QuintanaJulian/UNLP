program parcialTema1;
const
  cantCategorias = 20;
type
   categoria = record
       nombre : string;
       precio : real;
       end;
   rangoCategorias = 1..cantCategorias;    
   vectorCategorias = array[rangoCategorias] of categoria;    
 
   compra = record
		DNI : integer;
		categoria : rangoCategorias;
		cantKilos : real;
		end;
	lista = ^nodo;
	nodo = record
			dato : compra;
			sig : lista;
		end;
	vectorMontos = array[rangoCategorias] of integer;

var
  L : lista;
  vec : vectorCategorias;
  DNIMax, cantCompras : integer;
  montos : vectorMontos;
begin
  cargarLista(L); 
 // cargarCategorias(vec); //SE DISPONE
  procesarCompras(L, vec, DNIMax, montos, cantCompras);
end. 			

procedure leerCompra(var C : compra);
begin
  readln(c.DNI);
  readln(c.categoria);
  readln(c.cantKilos);
end;
procedure agregarAdelante(var L : lista; c : compra);
var 
  aux : lista;
begin
  new(aux); aux^.dato := c;
  aux^.sig := L; 
  L := aux;
end;  
procedure cargarLista(var L : lista);
var
  c : compra;
begin
  L := NIL;
  leerCompra(c);
  while (c.DNI <> -1) do begin
    agregarAdelante(L,c);
    leerCompra(c);
  end; 
end;

procedure inicializarVector(var v : vectorMontos);
var
  i : rangoMontos;
begin
  for i:=1 to cargarCategorias do v[i] := 0;
end;
   
function tieneALosumo5Impares(num : integer) : boolean;
var
  cantImpares : integer;
begin
  cantImpares := 0;
  while (num <> 0) and (cantImpares <= 5) do begin
    if (num MOD 2 = 1) then
      cantImpares := cantImpares + 1;
    num := NUM DIV 10;  
  end;
  
  tieneALosumo5Impares := (cantImpares <= 5);
end;     
function tieneAlMenos3Pares(num : integer) : boolean;
var
  cantPares, dig : integer;
begin
  cantPares := 0;
  while (num <> 0) and (cantPares < 3) do
  begin
     dig := num MOD 10;
     if ( dig MOD 2 = 0) then
       cantPares := cantPares + 1;
     num := num DIV 10;  
  end;
  if (cantPares = 3) then
       tieneAlMenos3Pares :=  true
  else 
		tieneAlMenos3Pares := false;
end;   
    
procedure actualizarMax(dni, cantCompras : integer; var maxDNI, maxCompras : integer);
begin
  if (cantCompras > maxCompras) then begin
     maxCompras := cantCompras;
     maxDNI := dni;
  end;
end;    


procedure procesarCompras(L : lista; vec : vectorCategorias; var DNImin : integer; 
						var montos : vectorMontos; var cantCompras : integer);
var
  DNIactual : integer;
  gastoActual, gastoMin : real;

begin
	gastoMin := 99999;
	inicializarVector(montos);
	cantCompras := 0;
	while (L<>NIL) do begin
		DNIActual := L^.dato.DNI;
		gastoActual := 0;
		while (L<>NIL) and (L^.dato.DNI = DNIActual) do begin
		  gastoActual := gastoActual + (L ^.dato.cantKilos*vec[L^.dato.categoria].precio); 
		  montos[L^.dato.categoria] := montos[L^.dato.categoria] + 1;
		  if (tieneALosumo5Impares(L^.dato.DNI) then
		     cantCompras := cantCompras + 1;
		   L^.sig;		
		end;
		actualizarMin(DNIActual, gastoActual, DNIMin, gastoMin);
	end;
end;

procedure procesarCompras(L : lista; vec : vectorCategorias; var DNIMax : integer; 
				var montos : vectorMontos; var cantCompras : integer);
var
  cantComprasMax : integer;
  DNIActual, cantComprasActual : integer;
begin
  cantCompras := 0;
  inicializarVector(montos);
  cantComprasMax := 0;
  
  while L <> NIL do begin
     DNIActual := L^.dato.DNI;
     cantComprasActual := 0;
     while (L <> NIL) and (L^.dato.DNI = DNIActual) do begin
        cantComprasActual := cantComprasActual + 1;
        montos[L^.dato.categoria] := montos[L^.dato.categoria] + 
								(L^.dato.cantKilos*vec[L^.dato.categoria].precio);
		if (tieneAlMenos3Pares(L^.dato.DNI)) then
			cantCompras := cantCompras + 1;
		L := L^.sig;	
     end;
     actualMax(DNIActual, cantComprasActual, DNIMax, cantComprasMax);
  end;
end;	


procedure leerCategoria(var cat : categoria; var cod : rangoCategorias);
begin
  readln(cat.nombre);
  readln(cat.precio);
  readln(cod);
end;

procedure cargarCategorias(var v : vectorCategorias);
var
  i, cod : rangoCategorias;
  cat : categoria;
begin
   
   for i := 1 to cantCategorias do begin
      leerCategoria(cat, cod);
      v[cod] := cat;
   end;
end;
