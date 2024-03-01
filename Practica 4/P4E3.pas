{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.

a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.

b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.

c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.

d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.

e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}

program P4E3;

const
	DF = 5;
	
type
	vdatos = array [1..DF] of integer;
	
// modulos


// carga del vector
procedure cargarVector(var v:vdatos; var dimL : integer);
var
	num:integer;
begin
	writeln('[>]Ingresa un numero: ');
	readln(num);
	while ((dimL < DF) and (num <> 0)) do
	begin
		dimL:= (dimL + 1);
		v[dimL] := num;
		if (dimL <> DF) then
		begin
			writeln('[>]Ingresa un numero: ');
			readln(num);
		end;
	end;
end;

// inciso a
procedure imprimirVector (v:vdatos; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
	begin
		writeln(v[i]);
	end;
end;

// inciso b
procedure imprimirAlReves (v:vdatos; dimL:integer);
var
	i:integer;
begin
	for i:= dimL downto 1 do
	begin
		writeln(v[i]);
	end;
end;

// inciso c
procedure imprimirMitad (v:vdatos; dimL:integer);
var
	i,mitad: integer;
begin
	mitad:= (dimL div 2);
	
	for i:= mitad downto 1 do
	begin
		writeln(v[i]);
	end;
	
	for i:= (mitad+1) to dimL do
	begin
		writeln(v[i]);
	end;
end;

// inciso d
procedure imprimirPosXY (v:vdatos; posX:integer; posY:integer);
var
	i:integer;
begin
	if (posX <= posY) then
	begin
		for i:= posX to posY do
			writeln (v[i]);
	end
	
	else
	begin
		for i:= posX downto posY do
			writeln (v[i]);
	end;
end;


var
	vector : vdatos;
	DL, posicionX, posicionY : integer;

begin
	DL := 0;
	cargarVector(vector, DL);
	writeln('');
	imprimirVector(vector,DL);
	writeln('');
	imprimirAlReves(vector,DL);
	writeln('');
	imprimirMitad (vector,DL);
	writeln('');
	writeln('Ingrese el rango de posiciones que quiere imprimir: ');
	readln(posicionX);
	readln(posicionY);
	writeln('');
	imprimirPosXY(vector,posicionX,posicionY);
end.














