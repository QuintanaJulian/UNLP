program P2E5;
const
	totalDelegaciones = 5;
	valorAlto = 9999;
type
	tipoMaestro = record
		Partida: integer;
		Nombre: String;
		Direccion: String;
		matriculaNacimiento: Integer;
		nombreMadre: String;
		DNIMadre: integer;
		nombrePadre: String;
		DNIPadre: integer;
		matriculaDefuncion: integer; 
		fechaDefuncion: String; 
		lugarDefuncion: String;
	end;
		
	tipoDefuncion = record
		Partida: integer;
		DNI: integer;
		Nombre: String;
		matriculaDefuncion: integer; 
		fechaDefuncion: String; 
		lugarDefuncion: String;
	end;
	
	tipoNacimiento = record
		Partida: integer;
		Nombre: String;
		Direccion: String;
		matriculaNacimiento: Integer;
		nombreMadre: String;
		DNIMadre: integer;
		nombrePadre: String;
		DNIPadre: integer;
	end;
	
	archivo_Detalle_Nacimiento = file of tipoNacimiento;
	archivo_Detalle_Defuncion = file of tipoDefuncion;
	archivo_Maestro = file of tipoMaestro;
	
	vector_Detalle_Nacimiento = array [1..totalDelegaciones] of archivo_Detalle_Nacimiento;
	vector_Detalle_Defuncion =  array [1..totalDelegaciones] of archivo_Detalle_Defuncion;
	
	
	procedure leerDefuncion (var a: archivo_Detalle_Defuncion; var dato: tipoDefuncion);
	begin
		if (not EOF (a)) then begin
			read (a, dato);
			Seek (a, FilePos(a) -1);
		end else dato.Partida:= valorAlto;
	end;
	
	procedure leerNacimiento (var a: archivo_Detalle_Nacimiento; var dato: tipoNacimiento);
	begin
		//mismo codigo que leerDefuncion()  pero con tipos de variables  cambiadas para nacimiento
	end;
	
	
	
	Procedure MinimoDefuncion (v: vector_Detalle_Defuncion; var dato: tipoDefuncion);
	var
		i: integer;
		actual, minimo: tipoDefuncion;
		posMin: integer;
	begin
		//saca el minimno entre todos los archivos de defuncion
		minimo.Partida := valorAlto;
		for i:= 1 to totalDelegaciones do begin
			leerDefuncion (v[i], actual);
			if (actual.Partida < minimo.Partida) then begin
				minimo:= actual;
				posMin:= i;			
			end;
		end;
		Seek (v[posMin], FilePos(v[posMin]) + 1);
	end;
	
	
	Procedure MinimoNacimiento (v: vector_Detalle_Nacimiento; var dato: tipoNacimiento);
	begin
			//saca el minimop entre todos lso archivos de nacimiento
			//mismo codigo MinimiDefuncion pero con tipo de varialbes cambiadas
	end;
	
	procedure GuardarVivo (var maestro: archivo_Maestro; datoNac: tipoNacimiento);
		var
		dato: tipoMaestro;
	begin
		//guarda los datos tipoNacimiento en un tipoMaestro y esto lo guarda en archivo Maestro
		dato.Partida:= datoNac.Partida;
		//y asi con todos los datos pedidos
		write (maestro, dato);
	end;
	
	
	procedure GuardarDifunto (var maestro: archivo_Maestro; datoNac: tipoNacimiento; datoDef: tipoDefuncion);
	var
		dato: tipoMaestro;
	begin
		//guarda los datos tipoNacimiento y tipoDifunto en un tipoMaestro y esto lo guarda en el archivo Maestro
		dato.Partida:= datoNac.Partida;
		//y asi con todos los datos pedidos
		write (maestro, dato);
	end;
	
	
	
	Procedure ActualizacionMaestroDetalle (var v_Nac: vector_Detalle_Nacimiento; var v_Def: vector_Detalle_Defuncion; var a_Maestro: archivo_Maestro);
	var
		i: integer;
		minDef: tipoDefuncion;
		minNac: tipoNacimiento;
	
	begin
		for i:= 1 to totalDelegaciones do begin
			reset (v_Nac[i]);
			reset (v_Def[i]);
		end;
		Rewrite (a_Maestro);
		
		MinimoDefuncion (v_Def, minDef);
		while (minDef.Partida <> valorAlto) do begin
			MinimoNacimiento (v_Nac, minNac);
			while (minDef.Partida <> minNac.Partida) do begin
				GuardarVivo(a_Maestro, minNac);
				MinimoNacimiento (v_Nac, minNac);
			end ;
			GuardarDifunto (a_Maestro, minNac, minDef);
			MinimoDefuncion (v_Def, minDef);
		end;
		
		MinimoNacimiento (v_Nac, minNac);
		while (minNac.Partida <> valorAlto) do begin
			GuardarVivo (a_Maestro, minNac);
			MinimoNacimiento (v_Nac, minNac);
		end;
		
		for i:= 1 to totalDelegaciones do begin
			Close (v_Def[i]);
			Close (v_Nac[i]);
		end;
		Close (a_Maestro);
		
	end;
	
	
	var
		i: integer;
		v_Nac: vector_Detalle_Nacimiento; 
		v_Def: vector_Detalle_Defuncion;
		v_Maestro: archivo_Maestro;
		cadena: String;
	begin
	

		for i:= 1 to totalDelegaciones do begin
			Str(i , cadena);
			Assign (v_Nac[i], 'Archivo_nacimiento'+ cadena);
			Assign (v_Def[i], 'Archivo_defuncion'+ cadena);
			//se podria asignar manualmente o a un string ponerle de nombre 1: i*2 y al 2: (i*2) - 1
		end;

		Assign (v_Maestro, 'a');
		
		ActualizacionMaestroDetalle (v_Nac, v_Def, v_Maestro);
	
	end.
	
	
	
	
	
