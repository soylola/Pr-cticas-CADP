program empresa;

procedure leer (var legajo: integer; var salario: real);
begin
	writeln('Escriba el legajo: ');
	read(legajo);
	writeln('Ingrese el salario: ');
	read(salario);
end;

procedure salarioMaxLeg (legajo:integer; salario:real; var maximo: real);
begin
	if (legajo > maximo) then
		maximo:= salario;
end;

var
	i, leg:integer;
	sal, sumaSalario, max: real;
begin
	max:=-1;
	sumaSalario:=0;
	for i:= 1 to 5 do
	begin
		leer(leg,sal);
		salarioMaxLeg(leg, sal, max);
		sumaSalario:= sumaSalario + sal;
	end;
	writeln('En todo el mes se gastan ', sumaSalario:1:2, ' pesos en salario');
	writeln('El salario del empleado más nuevo es ',max:1:2);
end.
