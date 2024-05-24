{1.- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa que:
a)	Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, 
			DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.

b)	Ordene el vector, aplicando uno de los métodos de inserción vistos en la cursada, para obtener el vector ordenado por código de identificación de la oficina.

c)	Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho código está en el vector. 
			En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el código buscado no existe.

d)Tenga un módulo recursivo que retorne el monto total de las expensas}


program P5E1;
const
	dimF = 300;

type
	oficina = record
		codigo: integer;
		DNI: integer;
		expensa: integer;
		end;

	oficinas = array [1..dimF] of oficina; 



procedure leerDatos (var D: oficina); 
begin
	random;
	write ('Insertar codigo oficina: ');
	readln (D.codigo);
	//D.codigo:= random (300) -1;
	//writeln (D.codigo);
	if (D.codigo <> -1) then begin
			write ('Insertar DNI propietario: ');
	//		readln (D.DNI);
	//		D.DNI:= 0;
			D.DNI:= random (99);
			writeln (D.DNI);
			write ('Insertar valor expensa: ');
	//		readln (D.expensa);
	//		D.expensa:= 0;
			D.expensa:= random (30);
			writeln (D.expensa);
	end;
end;


procedure crearVector (var V: oficinas; var dimL: integer);
var
	D: oficina;
begin
	dimL:= 0;
	leerDatos (D);
	while (D.codigo <> -1) do begin
		dimL:= dimL + 1;
		V [dimL]:= D;
		leerDatos (D);	
	end;
end;


procedure ordenarVector (var V: oficinas; dimL: integer);
var
	i, j, m: integer;		item: oficina;
begin
	for i:=1 to dimL do begin
		m:= i;
		for j:=2 to dimL do begin
			if (V[j].codigo < V[m].codigo) then
					m:= j;
		end;
		item:= V[i];
		V[i]:= V[m];
		V[m]:= item;
	end;
end;

procedure busqueda (V: oficinas; dimL: integer);
var
	bus, min, medio, max: integer;
begin
	write ('Inserte el codigo de identificacion a buscar: ');
	read (bus);
	min:= 1; max:= dimL; medio:= (min + max) div 2;
	while (min<=max) and (V[medio].codigo <> bus) do begin
		if (bus < V[medio].codigo) then
			max:= medio - 1
		else	min:= medio + 1;
		medio:= (min + max) div 2;
	end;
	if (bus = V[medio].codigo) then
		writeln ('El propietario de dicha oficina es el DNI: ', V[medio].DNI)
		else 
			writeln ('El codigo de identificacion no se encontro en los archivos.');
end;


procedure sumarExpensas (V: oficinas; dimL: integer; var suma: integer; i: integer);
begin
	if (i < (dimL + 1)) then begin
		suma:= suma + V[i].expensa;
		sumarExpensas (V, dimL, suma, i + 1);
	end;	
end;


var
	V: oficinas; dimL, suma, i: integer;
begin 
	crearVector (V, dimL);
	ordenarVector (V, dimL);
	busqueda (V, dimL);
	suma:= 0;		i:= 1;
	sumarExpensas (V, dimL, suma, i);
	writeln ('La suma de todas las expensas dio un total de ', suma, '$. ');
end.
