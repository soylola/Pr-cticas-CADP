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
	writeln('Ingrese el numero de inscripcion:');
	readln(a.nIns);
	writeln('Ingrese el DNI del alumno:');
	readln(a.DNI);
	writeln('Ingrese el apellido del alumno:');
	readln(a.ape);
	writeln('Ingrese el nombre del alumno:');
	readln(a.nom);
	writeln('Ingrese el anio de nacimiento:');
	readln(a.anioNac);
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

procedure dnis3DigitosPares (v:vecAlumnos; var cantDNIPares:integer);
var
	dig,i, numDNI: integer;
begin
	cantDNIPares:=0;
	for i:= 1 to DF do
	begin
		numDNI:= v[i].DNI;
		while (numDNI <> 0) do  // si el DNI no es 0
		begin
			dig:= (numDNI mod 10); // toma el ultimo digito
			if (dig mod 2 = 0) then  // si ese digito es par
				numDNI:= (numDNI div 10);  // recorta el numero 
		end;
		if (numDNI = 0) then            // si el DNI es 0 (todos sus digitos son pares)
			cantDNIPares:= cantDNIPares + 1 // suma 1 a cantDNIPares
	end;
end;



function porcentaje (cantDNIPares:integer):real; 
begin
	porcentaje := ((cantDNIPares * 100) / DF);
end;
	
var
	alu:vecAlumnos;
	registroAlu:alumno;
	cantPares:integer;
	porcentajeDNIPar:real;
begin
	cargar (alu,registroAlu); // TODOS LOS DATOS YA ALMACENADOS
	dnis3DigitosPares(alu,cantPares);
	porcentajeDNIPar:= porcentaje (cantPares);
	writeln('El porcentaje de alumnos con DNI con todos sus digitos pares es: ',porcentajeDNIPar:1:2);
end.

{entrada de prueba
6 dnis
* 1234
* 2345
* 6842 // PAR
* 1199
* 2446 // PAR
* 9276
* salida de prueba ------------ 2*100/6 = 33,33}
