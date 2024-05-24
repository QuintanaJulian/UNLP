program Final2022;
const
	maxCategoria = 5;
	dimF = 5000;
type
	tamanoCategoria = 1..maxCategoria;
	
participantes = record
	DNI: integer;
	Nombre: String;
	Categoria: tamanoCategoria;
	end;

vDispone = array [1..500] of participantes;


lista = ^nodo;

nodo = record
	dato: participantes;
	sig: lista;
	end;

vCumplen = array [1.. maxCategoria] of integer;



procedure CargarParticipantes (var V: vDispone; var dimL: integer);		//se dispone
begin
	dimL:= 1;
end;

procedure Buscar50 (Participantes: vDispone; dimL: integer; var Cumplen: vCumplen);
var
	tempCumplen: integer;
	i: integer;
begin
	for i:= 1 to maxCategoria do
		Cumplen [i]:= 0;
	i:= 1;
	tempCumplen:= 0;
	while (i <= dimL) and (tempCumplen < maxCategoria) do begin
		Cumplen [Participantes[i].Categoria]:= Cumplen [Participantes[i].Categoria] + 1;
		if Cumplen [Participantes[i].Categoria] = 50 then
			tempCumplen:= tempCumplen + 1;
		i:= i + 1;
	end;
end;

procedure InsertarAdelante (var L: lista; dato: participantes);
var
	nuevo: lista;
begin
	new (nuevo); nuevo^.dato:= dato;
	nuevo^.sig:= L;
	L:= nuevo;
end;

procedure Anadir50 (Participantes: vDispone; dimL: integer; v50: vCumplen; var L: lista);
var
	i: integer;
begin
	L:= nil;
	i:= 1;
	while (i < dimL) do begin
		if  v50[Participantes[i].Categoria] >= 50 then
			InsertarAdelante (L, Participantes[i]);
		i:= i + 1;
	end;
end;


procedure CrearLista (Participantes: vDispone; dimL: integer; var Lista50: lista);
var
	Vector50: vCumplen;
begin
	Buscar50 (Participantes, dimL, Vector50);
	Anadir50 (Participantes, dimL, Vector50, Lista50);
		
end;


var
	Participantes: vDispone;
	dimL: integer;
	Lista50: lista;
begin
	CargarParticipantes (Participantes, dimL);
	CrearLista (Participantes, dimL, Lista50);
	writeln ('terminio');
end.
