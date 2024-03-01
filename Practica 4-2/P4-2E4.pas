program P42E4;

const
	DF = 10;

type
	
	alumno = record
		nroAlu:integer;
		apeNom: string;
		cantAsis:integer;
	end;
	
	vAlumnos = array [1..DF] of alumno;


{carga del vector}

procedure leerAlumno (var alu:alumno);
begin
	writeln('[>] Ingrese el numero de alumno: ');
	readln (alu.nroAlu);
	if (alu.nroAlu <> 0) then
	begin
		writeln('[>] Ingrese el nombre y apellido del alumno: ');
		readln (alu.apeNom);
		writeln('[>] Ingrese la cantidad de asistencias del alumno: ');
		readln (alu.cantAsis);
		writeln(' ');
	end;
end;

procedure cargarVector (var v:vAlumnos; var alu:alumno; var dimL:integer);
begin
	leerAlumno(alu);
	while ((dimL < DF) and (alu.nroAlu <> 0))do
	begin
		dimL:= dimL+1;
		v[dimL] := alu;
		leerAlumno(alu);
	end;
end;


{modulo a}

function posicionAlu (v:vAlumnos; num:integer):integer;
var
	pos:integer;
begin
	pos:=1;
	while (pos < DF) and (v[pos].nroAlu < num) do
	begin
		pos:= pos+1;
	end;
	if  (num = v[pos].nroAlu) then
		posicionAlu:= pos;
	
end;

{modulo b}

procedure insertarAlu (var v:vAlumnos; dimL:integer; aluParaInsertar:alumno);
var
	i,pos:integer;
begin
	pos:=1;
	while ((dimL < DF) and (aluParaInsertar.nroAlu > v[pos].nroAlu)) do
	begin
		pos:=pos+1;
	end;
	if (aluParaInsertar.nroAlu <= v[pos].nroAlu) then
	begin
		for i:= dimL downto pos do
		begin
			v[i+1]:= v[i];
		end;
		v[pos]:= aluParaInsertar;
		dimL:=dimL+1;
	end;
end;

{modulo c}

procedure eliminarAlumno (var v:vAlumnos; var dimL:integer; pos:integer);
var
	i:integer;
begin
	if ((pos <= dimL) and (pos >= 1)) then
	begin
		for i:= pos to (dimL-1) do
		begin
			v[i]:= v[i+1];
		end;
		dimL:=dimL-1;
	end;
end;


{modulo para imprimir el vector}

procedure imprimirAlumnos (vec:vAlumnos; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
	begin
		writeln('> Numero de alumno: ',vec[i].nroAlu);
		writeln('> Nombre y apellido: ',vec[i].apeNom);
		writeln('> Cantidad de asistencias: ',vec[i].cantAsis);
		writeln(' ');
	end;
end;

{programa principal}

var
	DL: integer;
	alum: alumno;
	vec: vAlumnos;
	numero: integer;
	pos: integer;
	alumnoParaInsertar: alumno;
	posAEliminar:integer;
begin
	DL:= 0;
	
	// carga del vector ordenado
	cargarVector(vec,alum,DL);
	writeln(' ');
	writeln('La dimension logica es: ',DL,' y la dimension fisica es: ',DF);
	
	
	writeln('---------------------------------');
	
	// inciso a (Un módulo que retorne la posición de un alumno)
	writeln('[>] Ingrese un numero de alumno para saber en que posicion del vector se encuentra:');
	readln(numero);
	writeln(' ');
	pos:= posicionAlu (vec,numero);
	writeln('El alumno se encuentra en la posicion: ',pos);
	
	writeln('---------------------------------');
	
	// inciso b (Un módulo que inserte un alumno en el vector
	writeln('[!] Datos de un alumno para insertarlo en el vector ');
	leerAlumno(alumnoParaInsertar);
	insertarAlu (vec,DL,alumnoParaInsertar);
	
	writeln('---------------------------------');
	
	// imprimir vector
	imprimirAlumnos (vec,DL);
	
	writeln('---------------------------------');
	
	// inciso c (Un módulo que reciba la posición de un alumno dentro del vector y lo elimine)
	writeln('[>] Ingrese una posicion para eliminar a ese alumno del vector:');
	readln(posAEliminar);
	eliminarAlumno(vec,DL,posAEliminar);
	
	writeln('---------------------------------');
	
	// imprimir vector
	imprimirAlumnos (vec,DL);
end.
