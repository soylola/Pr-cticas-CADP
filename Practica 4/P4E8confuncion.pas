{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.
}

program P4E8;
const
	DF = 3;
type

	alumno = record
		nIns:integer;
		DNI:integer;
		ape: string;
		nom: string;
		anioNac: integer;
	end;
	
	vecAlumnos = array [1..DF] of alumno;

// modulos

procedure leerAlumno (var a:alumno);
begin
	writeln('<> <> <> <> <> <> <> <> <> <> <> <> ');
	{writeln('Ingrese el numero de inscripcion:');
		readln(a.nIns);}
	writeln('Ingrese el DNI del alumno:');
	readln(a.DNI);
	{writeln('Ingrese el apellido del alumno:');
		readln(a.ape);
		writeln('Ingrese el nombre del alumno:');
		readln(a.nom);
		writeln('Ingrese el anio de nacimiento:');
		readln(a.anioNac);}
end;

procedure cargar (var v: vecAlumnos; var a: alumno);
var
	i: integer;
begin
	for i:= 1 to DF do
	begin
		leerAlumno(a);
		v[i]:= a;
	end;
end;

//inciso a (El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.)

function dnis3DigitosPares (v:vecAlumnos):integer;
var
	dig, i, numDNI, cantDNIPares:integer;
	todosLosDigitosPares: boolean;
begin
	cantDNIPares:=0;
	for i:= 1 to DF do
	begin
		todosLosDigitosPares:= true;
		numDNI:= v[i].DNI;
		while ((numDNI <> 0) and (todosLosDigitosPares = true)) do
		begin
			dig:= (numDNI mod 10); 
			if (dig mod 2 <> 0) then  
				todosLosDigitosPares:= false 
			else
				numDNI := numDNI DIV 10; 
		end;
		if (todosLosDigitosPares = true) then 
			cantDNIPares:= cantDNIPares + 1;
	end;
	dnis3DigitosPares:= cantDNIPares;
end;



function porcentaje (cantDNIPares:integer):real; 
begin
	porcentaje := ((cantDNIPares * 100) DIV DF);
end;
	
var
	alu:vecAlumnos;
	registroAlu:alumno;
	cantPares:integer;
	porcentajeDNIPar:real;
begin
	cargar (alu,registroAlu); // TODOS LOS DATOS YA ALMACENADOS
	writeln('<> <> <> <> <> <> <> <> <> <> <> <> ');
	cantPares:= dnis3DigitosPares(alu);
	writeln('<> <> <> <> <> <> <> <> <> <> <> <> ');
	porcentajeDNIPar:= porcentaje (cantPares);
	writeln('El porcentaje de alumnos con DNI con todos sus digitos pares es: ',porcentajeDNIPar:1:2);
end.
