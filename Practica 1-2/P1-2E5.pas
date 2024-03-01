program P12E5;
var
	num, min, max, suma: integer;
begin
	min:= 1000;
	max:= -1;
	suma:=0;
	repeat
		writeln('Ingrese un numero:');
		readln(num);
		suma:=suma+num;
		if (num < min) then
			min:=num
		else if (num > max) then
			max:=num;
	until (num = 100);
	writeln('El numero maximo es: ', max);
	writeln('El numero minimo es: ', max);
	writeln(' La suma total de los numeros leidos es: ', suma);
end.
