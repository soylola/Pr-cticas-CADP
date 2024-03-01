program P42E1;

const
	DF = 10;
	
type
	vector = array [1..DF] of integer;

procedure cargarVector (var v:vector; var dimL:integer);
var
	num:integer;
begin
	writeln('Ingrese un numero: ');
	readln(num);
	while (dimL <> DF) and (num <> 0) do
	begin
		dimL:= dimL +1;
		v[dimL]:= num;
		writeln('Ingrese un numero: ');
		readln(num);
	end;
end;

procedure imprimirVector (v:vector; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
		writeln(v[i]);
end;

function buscar (v:vector; n:integer):boolean;
var
	pos:integer;
begin
	pos:=1;
	while ((pos < DF) and (v[pos] < n)) do
	begin
		pos:= pos+1;
		writeln('analizando el numero ',v[pos]);
	end;
	if (v[pos] = n) then
		buscar:= true
	else
		buscar:= false;
end;



var
	vec:vector;
	DL:integer;
	numero:integer;
begin
	DL:=0;
	cargarVector(vec,DL);
	imprimirVector (vec,DL);
	
	writeln('Ingrese un numero para saber si se encuentra en el vector:');
	readln(numero);
	writeln(buscar (vec,numero));
end.
