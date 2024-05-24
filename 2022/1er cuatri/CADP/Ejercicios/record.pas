//		numero atomico = Z = orden tabla periodica			carga pro y elec:		postivo= cationes	negativo= aniones	neutro= carga neutra
//		numero masico= protones + neutrones					masa= masaProtones + masaElectrones + masaNeutrones		
//
//		isotopos: son las posibles variantes de neutrones que puede tener un mismo elemento quimico (Z)
//		molecula: conjunto de atomos


program tp66;

const
	masaProtones = 1;		//uma (unidad de masa atomica)
	masaElectrones = 0.000555556;
	masaNeutrones = 1.0005;
	
type
atomos = record
	nombre: string;
	protones: real;
	electrones: real;
	neutrones: real;
end;

procedure ingresarDatos (var datos: atomos) ; 
	begin
		
		write ('Ingrese nombre: ');
		readln (datos.nombre);
		write ('Ingrese cantidad de Protones: ');
		readln (datos.protones);
		write ('Ingrese cantidad de Electrones: ');
		readln (datos.electrones);
		write ('Ingrese cantidad de Neutrones: ');
		readln (datos.neutrones);
	
	end;

	
procedure calculoMasa (var masa: real; datos: atomos);
var
	masaTotalElectrones, masaTotalProtones, masaTotalNeutrones: real;
begin
	masaTotalElectrones:= masaElectrones * datos.electrones;
	masaTotalProtones:= masaProtones * datos.protones;
	masaTotalNeutrones:= masaNeutrones * datos.neutrones;
	masa:=  masaTotalElectrones + masaTotalProtones + masaTotalNeutrones;
end;

procedure calculoCarga (var carga: string; datos: atomos);
begin
	if datos.protones > datos.electrones then begin
		carga:= 'Positiva';
		end
	else if datos.protones < datos.electrones then begin
		carga:= 'Negativa';
		end
	else if datos.protones = datos.electrones then begin
		carga:= 'Neutra';
	end
end;


procedure calculoNumeroMasico (var numeroMasico: real; datos: atomos);
begin
	numeroMasico:= datos.protones + datos.neutrones;
	
end;


var
	datos: atomos;
	masa, numeroMasico: real;
	carga: string;
	
begin
	ingresarDatos (datos);
	calculoMasa (masa, datos);
	calculoCarga (carga, datos);
	calculoNumeroMasico (numeroMasico, datos);
	writeln ('Es un atomo de ',datos.nombre, '. Esta compuesto por ',datos.protones:0:0, ' protones (Z)',', ',datos.electrones:0:0, ' electrones',' y  ',datos.neutrones:0:0, ' neutrones (A).');
	writeln ('La masa de este ', datos.nombre, ' es de ', masa:2:4, ', el numero masico es ', numeroMasico:2:0, ' y tiene una carga ',carga,'. ');

end.



//	writeln ('Compuesto por ',datos.protones:2:0, ' protones','Compuesto por ',datos.electrones:2:0, ' electrones','Compuesto por ',datos.neutrones:2:0, ' neutrones');
//	writeln ('Compuesto por ',datos.electrones:2:0, ' electrones');
//	writeln ('Compuesto por ',datos.neutrones:2:0, ' neutrones');
