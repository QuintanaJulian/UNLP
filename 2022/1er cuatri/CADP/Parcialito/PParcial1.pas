program PParcial1;

type
//	tipoG = record
//		drama: integer;
//		romantico: integer;
//		accion: integer;
//		suspenso: integer;
//		terror: integer;
//		end;
	
	tipoG = array [1..5] of integer;


	dato = record
		dni: integer;
		nombres: char;			//ayudaaaa no va con string
		edad: integer;
		genero: integer;		
		end;

	lista= ^buenas;	

	buenas=record
		datos: dato;
		sig: lista;
		end;
		
procedure leerDatos (var datoIngresados: dato);
	begin
	write ('DNI: ');	
	readln (datoIngresados.dni);
	write ('Nombre (char): ');
	readln (datoIngresados.nombres);
	write ('Edad: ');
	readln (datoIngresados.edad);
	write ('Genero preferido: ');
	read (datoIngresados.genero);
	end;

procedure insertarAdelante (var actores:lista);
	var
		nuevo: lista;
		datoIngresados: dato;
	begin
	repeat
		leerDatos (datoIngresados);
		new (nuevo); nuevo^.datos:= datoIngresados; nuevo^.sig:= nil;
		
		if (actores = nil) then begin
			actores:= nuevo;
			end
		else begin
			nuevo^.sig:= actores;
			actores:= nuevo;
			end;
	until (actores^.datos.dni = 33);
	end;
	
	
	
procedure analizarDni (dni:integer; var dniA: boolean); //no logro hacerlo con function
var
	n, par, impar: integer;
begin
	par:= 0; impar:= 0;
	repeat begin
		n:= dni mod 10;
		if (n mod 2 = 0) then begin
			par:= par + 1
			end
			else
				impar:= impar + 1;
			dni:= dni div 10
			end;
	until (dni = 0); 
	
	if (par > impar) then
		dniA:= true //
	else
		dniA:= false; // analizarDni
end;


procedure analizarGenero (actual: lista; var genero: tipoG);
//var
//aux: integer;
begin
	
//	aux:= actual^.datos.genero;
//	writeln (aux);
//	writeln (genero [aux]);
//	genero [aux]:= genero [aux]+1;
//	writeln (genero [aux]);
genero [actual^.datos.genero]:= genero[actual^.datos.genero] + 1;
	//	datoIngresados.genero[aux]:= datoIngresados.genero[aux] + 1;
end;

procedure ordenarGenero (var genero: tipoG);
var
//	I, P, J, item: integer;
	may1, may2, aux, numMay2, numMay1: integer;
begin
//	for i:=1 to 5 do begin
//		P:= I;
//		for J:=I+1 to 5 do
//			if genero[J] > genero[P] then
//				P:=J;
//		item:= genero[P];
//		genero[P] := genero [I];
//		genero [I] := item;
	may1:= 0; may2:= 0; numMay1:= 0; numMay2:= 0;
	for aux:=1 to 5 do begin
		if may1 < genero[aux] then begin
			may2:= may1;
			numMay2:= numMay1;
			may1:= genero[aux];
			numMay1:= aux;
		end
		else begin
			if (may2< genero[aux]) then begin
				may2:= genero [aux];
				numMay2:= aux;
				end;
		end;
	end;
	writeln ('El genero numero ', numMay1, ' es el mas elegido con ', may1, ' votos');
	writeln ('El genero numero ', numMay2, ' es el segundo mas elegido con ', may2, ' votos');
end;

procedure borrarDatos (var actores:lista);
var
actual, anterior: lista;
usuarioBorrar: integer;
begin
	actual:= actores;
	writeln ('Ingrese el DNI del usuario a borrar: ');
	readln (usuarioBorrar);
	while (actual <> nil) do begin
		if (actores^.datos.dni <> usuarioBorrar) then begin
			anterior:= actual;
			actual:= actual^.sig;
			end
			else begin
				if (actual = actores) then
					actores:= actual^.sig
				else
					anterior^.sig:= actual^.sig;
				dispose (actual);
				actual:= anterior;
				writeln ('El DNI a sido CORRECTAMENTE borrado ');
				end;
		end;
	end;




procedure analizarDatos (var actores:lista; var genero:tipoG; var dniPar: integer);
var
	actual: lista;
	dni: integer;
	dniA: boolean; //
	i: integer;
begin
	for i:=1 to 5 do
	genero[i]:= 0;
	
	actual:= actores;
	repeat
		dni:= actual^.datos.dni;
		analizarDni (dni, dniA);
		if (dniA = true) then
			dniPar:= dniPar + 1;
		analizarGenero (actual, genero);
		actual:= actual^.sig;
	until (actual = nil);
	ordenarGenero (genero);	

end;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var

actores: lista;
dniPar: integer;
genero: tipoG;

begin
	actores:= nil;
	insertarAdelante (actores);
	analizarDatos (actores, genero, dniPar);
	write ('Son', dniPar, ' DNIs con mas digitos pares.');
//	write ('El genero mas elegido es el: ', genero[1]);
//	write ('El 2ndo genero mas elegido es el: ', genero[2]);

	borrarDatos (actores);
	
end.

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//	datoIngresados.genero[aux]:= datoIngresados.genero[aux] + 1;


//crear el primero
//
//crear nuevo
//cargar nuevo
//
//si li=nill
//linkearlo a Li (primero)
//
//si li<>nill 
//	nuevo.sig= li
//	li= nuevo
