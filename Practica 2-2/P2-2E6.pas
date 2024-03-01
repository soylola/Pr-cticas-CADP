program P22E6;

procedure masBaratos (pre:real;cod:integer;var cod1,cod2:integer; var min1,min2:real);
begin
	if (pre < min1) then
	begin
		min2:=min1;
		min1:=pre;
		cod2:=cod1;
		cod1:=cod;
	end
	else if (pre < min2) then
	begin
		min2:=pre;
		cod2:=cod;
	end;
end;


procedure masCaro (t:string; p:real; var cod,codMax:integer; var max:real);
begin
	if (t = 'pantalon')then
	begin
		if (p > max) then
		begin
			max:=p;
			codMax:=cod;
		end;
	end;
end;


var
	precio,minimo1,minimo2,maximo:real;
	i,codigo, codigo1, codigo2:integer;
	tipo:string;
	codigoMax:integer;
	
begin
	minimo1:=10000;
	minimo2:=10000;
	maximo:=-1;
	for i:= 1 to 4 do
	begin
		writeln('Ingresa el precio del producto:');
		readln(precio);
		writeln('Ingresa el codigo del producto:');
		readln(codigo);
		writeln('Ingresa el tipo del producto:');
		readln(tipo);
		masBaratos(precio,codigo,codigo1,codigo2,minimo1,minimo2);
		masCaro(tipo,precio,codigo,codigoMax,maximo);
	end;
	writeln('Los codigos de los dos productos mas baratos son: ',codigo1,' y ', codigo2);
	writeln('El codigo del producto de tipo pantalon mas caro es: ',codigoMax);
end.
