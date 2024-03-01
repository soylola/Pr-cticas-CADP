{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:

a) La cantidad de galaxias de cada tipo.

b) La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.

c) La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
 
d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program P4E12;
const
	DF = 3;

type
	vTipo = array [1..4] of integer;
	
	galaxia = record
		nom:string;
		tipo: integer;
		masa: real;
		distanciaPc: real;
	end;
	
	vGalaxia = array [1..DF] of galaxia;


// modulos para cargar vector
procedure leerGalaxia (var g:galaxia);
begin
	writeln('Ingresa el nombre de la galaxia: ');
	readln(g.nom);
	writeln('Ingresa el tipo de la galaxia: ');
	readln(g.tipo);
	writeln('Ingresa la masa de la galaxia: ');
	readln(g.masa);
	writeln('Ingresa la distancia en pc de la galaxia: ');
	readln(g.distanciaPc);
end;


procedure  leerVector (var v:vGalaxia; var g:galaxia);
var
	i:integer;
begin
	for i:= 1 to DF do
	begin
		leerGalaxia(g);
		v[i]:= g;
	end;
end;

// modulo que inicializa el vector contador
procedure inicializarVCont (var t:vTipo);
var
	i:integer;
begin
	for i:= 1 to 4 do
	begin
		t[i]:= 0;
	end;
end;


// inciso a (La cantidad de galaxias de cada tipo.)

procedure cantGalaxias (var t:vTipo; v:vGalaxia);
var
	i:integer;
begin
	for i:= 1 to 4 do
	begin
		t[v[i].tipo] := t[v[i].tipo] +1;
	end;
end;

//modulo para imprimir el vector contador 
procedure imprimir (t:vTipo);
var
	i:integer;
begin
	for i:= 1 to 4 do
	begin
		writeln('La cantidad del tipo ',i,' fue: ',t[i]);
	end;
end;




var
	i:integer;	
	contTipo: vTipo;
	gal: galaxia;
	vec: vGalaxia;
begin
	inicializarVCont (contTipo);
	leerVector(vec,gal);
	for i:= 1 to DF do
	begin
		cantGalaxias(contTipo,vec);
		imprimir (contTipo);
	end;
end.
