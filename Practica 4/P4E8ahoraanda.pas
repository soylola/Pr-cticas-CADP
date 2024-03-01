{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.
}

program P4E8;
const
	DF = 6;
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
	todosLosDigitosPares: boolean;
begin
	cantDNIPares:=0;
	
	for i:= 1 to DF do
	begin
		todosLosDigitosPares:= true;
		numDNI:= v[i].DNI;
		while ((numDNI <> 0) and (todosLosDigitosPares = true)) do  // si el DNI no es 0 y todos los digitos (hasta ahora) son pares
		begin
			dig:= (numDNI mod 10); // toma el ultimo digito
			
			writeln('Analizando el digito: ', dig);
			
			if (dig mod 2 <> 0) then  // si ese digito no es par
				todosLosDigitosPares:= false // corta
			else
				numDNI := numDNI DIV 10; // si es par sigue actualizando el numero
		end;
		if (todosLosDigitosPares = true) then // si todos los digitos fueron pares
			cantDNIPares:= cantDNIPares + 1; // suma 1 a cantDNIPares
	end;
end;



function porcentaje (cantDNIPares:integer):real; 
begin
	porcentaje := ((cantDNIPares * 100) DIV DF);
end;


//inciso b (Apellido y nombre de los dos alumnos de mayor edad.)
procedure mayorEdad (v:vecAlumnos; var maxE1,maxE2:integer; var maxApe1,maxApe2,maxNom1,maxNom2:string);
var
	i:integer;
begin
	for i:= 1 to DF do
	begin
		if (v[i].anioNac < maxE1) then
		begin
			maxE2:= maxE1;
			maxE1:= v[i].anioNac;
			maxApe2:= maxApe1;
			maxApe1:= v[i].ape;
			maxNom2:= maxNom1;
			maxNom1:= v[i].nom;
		end
		
		else if (v[i].anioNac < maxE2) then
		begin
			maxE2:= v[i].anioNac;
			maxApe2:= v[i].ape;
			maxNom2:= v[i].nom;
		end;
	end;
end;



// programa principal
var
	alu:vecAlumnos;
	registroAlu:alumno;
	cantPares, maximaEdad1, maximaEdad2:integer;
	maximoApe1, maximoApe2, maximoNom1, maximoNom2: string;
	porcentajeDNIPar:real;
begin
	maximaEdad1:=10000;
	maximaEdad2:=10000;
	cargar (alu,registroAlu); // TODOS LOS DATOS YA ALMACENADOS
	writeln('<> <> <> <> <> <> <> <> <> <> <> <> ');
	dnis3DigitosPares(alu,cantPares);
	writeln('<> <> <> <> <> <> <> <> <> <> <> <> ');
	porcentajeDNIPar:= porcentaje (cantPares);
	writeln('El porcentaje de alumnos con DNI con todos sus digitos pares es: ',porcentajeDNIPar:1:2);
	writeln('<> <> <> <> <> <> <> <> <> <> <> <> ');
	mayorEdad (alu,maximaEdad1,maximaEdad2,maximoApe1, maximoApe2, maximoNom1, maximoNom2);
	writeln('El apellido y nombre de los dos alumnos de mayor edad son: ',maximoApe1,' ',maximoNom1,' y ',maximoApe2,' ',maximoNom2);
end.

