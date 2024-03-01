program Vectores;

const
	cant_datos = 5;
	
type
	vdatos = array [1..cant_datos] of real;
	
// modulos

procedure cargarVector(var v:vdatos; var dimL : integer);
var
	num:real;
begin
	writeln('[>]Ingresa un numero: ');
	readln(num);
	while ((dimL < cant_datos) and (num <> 0)) do
	begin
		dimL:= (dimL + 1);
		v[dimL] := num;
		writeln('[>]Ingresa un numero: ');
		readln(num);
	end;
end;

procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
	i:integer;
begin
	for i:= 1 to dimL do
	begin
		v[i] := v[i] + n;
		suma := suma + v[i];
	end;
end;

//programa principal
var
	datos : vdatos;
	dim : integer;
	num, suma : real;

begin
	dim := 0;
	suma := 0;
	cargarVector(datos, dim);
	writeln('Ingrese un valor a sumar: ');
	readln(num);
	modificarVectorySumar(datos,dim,num,suma);
	writeln('La suma de los valores es: ', suma:1:2);
	writeln('Se procesaron: ',dim, ' numeros')
end.
