program PParcial3;

type
	dato = record
		nViaje: integer;
		codigo: integer;
		dirOrigen: string;
		dirDestino: string;
		km: real; 
		end;
	
	lista = ^buenas;

	buenas = record
		datos: dato;
		sig: lista;
		end;


procedure analizarDatos (L: lista; var max1: real; var max2: real; var codMax1: integer; var codMax2: integer; var l15KM: lista);
	var
		actual: lista;
		sumaKM: real;
		codigo: integer;
		
	begin
		actual:= L;
		while (actual <> nil) do  begin
			codigo:= actual^.datos.codigo;
			while (actual^.datos.codigo = codigo) do begin
					if (actual^.datos.sig > 5) then begin
						insetarOrdenado (actual, l5KM);
						sumaKM:= sumaKM + actual^.datos.km;
						actual:= actual^.sig;
					end
			end;
			
			if	(sumaKM > max1) then begin
				max2:= max1;
				codMax2:= codMax1;
				max1:= sumaKm;
				codMax2:= actual^.datos.codigo;
				end
				else begin
					if (sumaKM > max2) then begin
						codMax2:= actual^.datos.codigo;
						max2:= sumaKM;
					end;	
				end;
			end;
		end;
	end;

procedure insertarOrdenado (actual: lista; var l5KM: lista);
var
	
begin
	
	
end;

var
L:lista;

begin
CargarDatos (L);
anaizarDatos (L);

end
