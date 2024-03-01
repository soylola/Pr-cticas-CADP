{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:

a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse. (((((LISTO)))))
c) sumaVector: retorna la suma de todos los elementos del vector. (((((LISTO)))))
d) promedio: devuelve el valor promedio de los elementos del vector. (((((LISTO)))))
e) elementoMaximo: retorna la posición del mayor elemento del vector (((((LISTO)))))
f) elementoMinimo: retorna la posicion del menor elemento del vector (((((LISTO)))))}
program P4E4;

const
	DF = 5;
type
	vdatos = array [1..DF] of integer;
	
// modulos


// carga del vector
procedure cargarVector(var v:vdatos; var dimL:integer);
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
function posicion (v:vdatos; num:integer):integer;

var 
	pos:integer;
	seguir: boolean;
begin
	seguir:= true;
	pos:=1;
	while ((seguir = true) and (pos<=DF)) do
	begin
		if (v[pos] = num) then
		begin
			seguir:= false;
		end
		else
			pos:= pos+1;
	end;
	if (seguir = false) then
		posicion:= pos
	else
		posicion:=-1;
end;

// inciso c
function sumaVector (v:vdatos; dimL:integer):integer;
var
	suma, i: integer;
begin
	suma:=0;
	for i:= 1 to dimL do
	begin
		suma:= suma + v[i];
	end;
	sumaVector:= suma;
end;


//inciso d
function promedio (suma:integer;dimL:integer):real;
begin
	promedio:= (suma/dimL);
end;



//inciso e
procedure elementoMaximo (v:vdatos; var max,posMax:integer; dimL:integer);
var
	pos:integer;
begin
	pos:=1;
	while (pos<=dimL) do
	begin
		if (v[pos] > max) then
		begin
			max:= v[pos];
			posMax:= pos;
		end;
		pos:=pos+1;
	end;
end;

//inciso f
procedure elementoMinimo (v:vdatos; var min,posMin:integer; dimL:integer);
var
	pos:integer;
begin
	pos:=1;
	while (pos<=dimL) do
	begin
		if (v[pos] < min) then
		begin
			min:= v[pos];
			posMin:= pos;
		end;
		pos:=pos+1;
	end;
end;

//programa principal
var
	vector : vdatos;
	DL, numero,pos,sumaElementos, maximo, posicionMax, minimo, posicionMin: integer;
	promSumaElementos:real;
begin
	DL := 0;
	maximo:=-1;
	minimo:= 10000;
	cargarVector(vector, DL);
	writeln('');
	writeln('- La dimension logica es: ', DL);
	writeln('');
	writeln('- Ingrese un numero para conocer su posicion en el vector: ');
	readln(numero);
	pos:= posicion(vector, numero);
	writeln('[>] La posicion del elemento ',numero,' es: ',pos);
	sumaElementos:= sumaVector (vector,DL);
	writeln('[>] La suma de todos los elementos es: ',sumaElementos);
	promSumaElementos:= promedio (sumaElementos,DL);
	writeln('[>] El promedio de todos los elemtnos es: ',promSumaElementos:1:2);
	elementoMaximo (vector,maximo,posicionMax,DL);
	writeln('[>] El elemento mas grande esta en la posicion: ',posicionMax);
	elementoMinimo (vector,minimo,posicionMin,DL);
	writeln('[>] El elemento mas chico esta en la posicion: ',posicionMin);
end.

pos:= 1;
while (pos < DF) and (num <> v[pos]) do
begin
		pos:= pos+1;
end;
if (num = v[pos]) then
	posicion:= pos;
else
	posicion:= -1;
