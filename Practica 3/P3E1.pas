program P3E1;
type
	str20 = string[20];
	
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;

procedure leer(var alu : alumno);
begin
	writeln('Ingrese el codigo del alumno');
	readln(alu.codigo);
	if (alu.codigo <> 0) then
	begin
		writeln('Ingrese el nombre del alumno');
		readln(alu.nombre);
		writeln('Ingrese el promedio del alumno');
		readln(alu.promedio);
	end;
end;

{ declaración de variables del programa principal }
var
	a : alumno;
	cant: integer;
	maxProm: real;
	maxAlu:string;
	
{ cuerpo del programa principal }
begin
	maxProm:=-1;
	cant:=0;
	leer(a);
	while (a.codigo <> 0) do
	begin
		if (a.promedio>maxProm) then
		begin
			maxProm:=a.promedio;
			maxAlu:=a.nombre;
		end;
		cant:= cant+1;
		leer(a);
	end;
	writeln('La cantidad de alumnos es: ', cant);
	writeln('El alumno con mejor promedio fue: ', maxAlu);
end.
