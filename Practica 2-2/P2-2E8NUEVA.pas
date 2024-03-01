program P22E8;

// cantidad de digitos pares e impares por c/ numero

procedure parImpar (num, p,i:integer);
var
	dig:integer;
begin
	while (num <> 0) do
	begin
		dig:= num mod 10;
		if (dig mod 2=0) then
			p:=p+dig
		else
			i:=i+1;
		num:= num div 10;
	end;
	writeln('La suma de los pares es ',p,' y tiene ',i,' impares');
end;

var
	numero, par, impar:integer;
begin
	par:=0;
	impar:=0;
	writeln('Ingrese un numero para saber la suma de sus digitos pares y cuantos impares tiene:');
	readln(numero);
	while (numero <> 12345) do
	begin
		parImpar(numero,par,impar);
		writeln('Ingrese un numero para saber cuantos digitos pares e impares tiene:');
		readln(numero);
	end;
end.
