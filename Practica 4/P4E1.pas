program sumador;
type
	vnums = array [1..10] of integer;
	
procedure imprimirVector (v:vnums);
var
	i:integer;
begin
	for i:= 1 to 10 do
		writeln(v[i]);
end;

var
	numeros : vnums;
	i : integer;
begin
	for i:=1 to 10 do {primer bloque for}
		numeros[i] := i;

	for i:=1 to 9 do
		numeros[i+1] := numeros[i];
	imprimirVector(numeros);
end.
