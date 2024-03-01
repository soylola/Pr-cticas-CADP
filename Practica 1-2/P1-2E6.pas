program P12E6;
uses Windows;
const
	prod_final= 200;
type
	codigo= 0..200;
var
	precio, precio1, precio2: real;
	i, prod_cod_par:integer;
	cod, codigo1, codigo2: codigo;
begin
	setConsoleOutputCP(CP_UTF8);
	precio1:= 10000;
	precio2:= 10000;
	codigo2:=0;
	codigo1:=0;
	prod_cod_par:=0;
	for i:= 1 to prod_final do
	begin
		writeln('Ingrese el código del producto(entre 1 y 200): ');
		readln(cod);
		writeln('Ingrese el precio del producto: ');
		readln(precio);
		if (precio > 16) AND (cod MOD 2 = 0) then
			prod_cod_par:= prod_cod_par + 1;
		if (precio < precio1) then
		begin
			precio2 := precio1;
			precio1:= precio;
			codigo2:=codigo1;
			codigo1:=cod;
		end
		else if (precio < precio2) then
		begin
			precio2:= precio;
			codigo2:=cod;
		end;
			
	end;
	writeln('Los códigos de los dos productos mas baratos son: ',codigo1,' y ',codigo2);
	if (prod_cod_par = 1) then
		writeln('Hay ',prod_cod_par,' producto de más de 16 pesos con código par.')
	else
		writeln('Hay ',prod_cod_par,' productos de más de 16 pesos con código par.');
end.
