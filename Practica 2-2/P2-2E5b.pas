program P22E5b;

procedure dobleDeNum (numA, numB:integer; var cantParDoble:integer);
begin
	if (numB = numA*2) then
	begin
		cantParDoble:= cantParDoble+1
	end;
end;

var
	num1, num2, doble, cantPar: integer;
begin
	cantPar:=0;
	writeln('Ingresa un par de numeros: ');
	read(num1);
	read(num2);
	while (num1 <> 0) AND (num2 <> 0) do
	begin
		cantPar:= cantPar+1;
		dobleDeNum(num1, num2, doble);
		writeln('Ingresa un par de numeros: ');
		read(num1);
		read(num2);
	end;
	writeln('El total de pares es: ',cantPar);
	writeln('El total de pares donde el segundo numero es el doble del primero es: ', doble);
end.

