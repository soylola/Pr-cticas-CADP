program P42E2;

const
	DF = 10;

type
	vAlumnos = array [1..DF] of string;

{inciso a}

procedure cargarAlumnos (var v:vAlumnos; var dimL:integer);
var
	alumno:string;
begin
	writeln('[!] Ingrese un alumno:');
	readln(alumno);
	while (dimL <> DF) and (alumno <> 'ZZZ') do
	begin
		dimL:= dimL+1;
		v[dimL]:= alumno;
		writeln(' ');
		writeln('[!] Ingrese un alumno:');
		readln(alumno);
	end;
end;

{inciso b}

procedure eliminarAlumno (var v:vAlumnos; var dimL:integer);
var
	aluParaEliminar:string;
	i,pos:integer;
begin
	pos:=1;
	writeln('[!] Ingrese el nombre de un alumno para eliminarlo:');
	readln(aluParaEliminar);
	while (((pos>=1) and (pos <= dimL)) and (aluParaEliminar <> v[pos])) do
	begin
		pos:= pos+1;
	end;
	if (aluParaEliminar = v[pos]) then
	begin
		for i:= pos to (dimL-1) do
		begin
			v[i] := v[i+1];
		end;
		dimL:= dimL-1;
	end;
end;

{inciso c}
procedure insertarAlumno (var v:vAlumnos; var dimL:integer);
var
	i,pos:integer;
	aluParaInsertar:string;
begin
	pos:=4;
	writeln('[!] Ingrese el nombre de un alumno para insertarlo en la posicion 4:');
	readln(aluParaInsertar);
	if ((pos>=1) and (pos <= dimL)) then
	begin
		for i:= dimL downto pos do
		begin
			v[i+1] := v[i];
		end;
		v[pos]:= aluParaInsertar;
		dimL:= dimL+1;
	end;
end;

{inciso d}
procedure agregarAlumno (var v:vAlumnos; var dimL:integer);
var
	aluParaAgregar:string;
begin
	writeln('[!] Ingrese el nombre de un alumno para agregarlo al vector:');
	readln(aluParaAgregar);
	
	if (dimL < DF) then
	begin
		dimL:= dimL+1;
		v[dimL]:= aluParaAgregar;
	end;
end;

{impresion del vector}

procedure imprimirAlumno (v:vAlumnos; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
		writeln('> ',v[i]);
end;

{programa principal}

var
	vector: vAlumnos;
	DL:integer;
	
begin
	cargarAlumnos(vector,DL);
	writeln('Vector cargado: ');
	imprimirAlumno(vector,DL);
	
	writeln('_______________________');
	
	eliminarAlumno(vector,DL);
	writeln('Vector con el alumno eliminado: ');
	imprimirAlumno(vector,DL);
	
	writeln('_______________________');
	
	insertarAlumno(vector,DL);
	writeln('Vector con el alumno insertado: ');
	imprimirAlumno(vector,DL);
	
	writeln('_______________________');
	
	agregarAlumno(vector,DL);
	writeln('Vector con el alumno agregado: ');
	imprimirAlumno(vector,DL);
end.




