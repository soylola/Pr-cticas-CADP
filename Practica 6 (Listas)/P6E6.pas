{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:

a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento). (LISTOOO)

b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.(LISTOOO)

c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.(LISTOOO)

d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.

Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible.

* La sonda espacial es un dispositivo que se envía al espacio con el fin de estudiar cuerpos de nuestro
Sistema Solar, tales como planetas, satélites, asteroides o cometas.}

program P6E6;

type
	
	sonda = record
		nombre:string;
		duracion:integer;
		costoConst:real;
		costoMant:real;
		rango: integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: sonda;
		sig: lista;
	end;
	
	vRango = array [1..7] of integer;
	
{modulos}

// cargar lista

procedure leerRegistro (var s:sonda);
begin
		writeln('[>] Ingrese el nombre de la sonda: ');
		readln(s.nombre);
		writeln('[>] Ingrese la duracion de la mision (cantidad de meses): ');
		readln(s.duracion);
		writeln('[>] Ingrese el costo de construccion de la sonda: ');
		readln(s.costoConst);
		writeln('[>] Ingrese el costo de mantenimiento mensual de la sonda: ');
		readln(s.costoMant);
		writeln('[>] Ingrese el rango del espectro (1 a 7): ');
		readln(s.rango);
		writeln(' ');
end;

procedure cargarLista (var l:lista);
var
	s:sonda;
	nuevo:lista;
begin
	repeat
		leerRegistro(s);
		new(nuevo);
		nuevo^.dato := s;
		nuevo^.sig:= l;
		l:=nuevo;
	until (s.nombre = 'GAIA');
end;

// inciso a (El nombre de la sonda más costosa considerando su costo de construcción y de mantenimiento)


procedure masCostosa (l:lista);
var
	maxNom:string;
	costoMax:real;
	costoMayor:real;
begin
	costoMayor:= -1;
	while (l <> nil) do
	begin
		costoMax:= (l^.dato.costoConst + l^.dato.costoMant); // 200 + 300
		if (costoMax > costoMayor) then // 500 > -1
		begin
			costoMayor:=costoMax; // costoMayor := 500
			maxNom:= l^.dato.nombre; 
		end;
		l:= l^.sig;
	end;
	writeln('El nombre de la sonda mas costosa es: ',maxNom);
end;

//inciso b (La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.)

procedure inicializarVector (var v:vRango);
var
	i:integer;
begin
	for i:= 1 to 7 do
	begin
		v[i]:= 0;
	end;
end;

procedure cantRangos (l:lista; var v:vRango);
begin
	inicializarVector (v);
	while (l <> nil) do
	begin
		v[l^.dato.rango]:= v[l^.dato.rango]+1;
		l:=l^.sig;
	end;
end;

// inciso c (La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas)

function totalDuracion (l:lista):Extended;
var
	duracionTotal: integer;
	cantSondas:integer;
	total:Extended;
begin
	duracionTotal:=0;
	cantSondas:= 0;
	
	while (l <> nil) do
	begin
		duracionTotal:= (duracionTotal + l^.dato.duracion);
		cantSondas:= cantSondas +1;
		l:= l^.sig;
	end;
	if (cantSondas > 0) then
		 total := (duracionTotal/cantSondas);
	totalDuracion:= total;
end;

procedure cantDuracion (l:lista);
var
	cant:integer;
	total:Extended;
begin
	cant:= 0;
	total:= totalDuracion(l);
	while (l <> nil) do
	begin
		if (l^.dato.duracion > total) then
			cant:=cant+1;
		l:= l^.sig;
	end;
	writeln('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas son: ',cant);
end;

// inciso d (El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.)

function totalCosto (l:lista):Extended;
var
	costoTotal: real;
	cantSondas:integer;
	total:Extended;
begin
	costoTotal:=0;
	cantSondas:= 0;
	
	while (l <> nil) do
	begin
		costoTotal:= (costoTotal + l^.dato.costoConst);
		cantSondas:= cantSondas +1;
		l:= l^.sig;
	end;
	if (cantSondas > 0) then
		 total := (costoTotal/cantSondas);
	totalCosto:= total;
end;

procedure costoSuperior (l:lista);
var
	total:Extended;
begin
	total:= totalCosto(l);
	while (l <> nil) do
	begin
		if (l^.dato.costoConst> total) then
			writeln('La sonda : ',l^.dato.nombre,' supera el promedio.');
		l:= l^.sig;
	end;
end;

// imprimir
procedure imprimirLista(l: lista);
begin
    while(l <> nil) do
    begin
        write('[');
        write(l^.dato.nombre);
        write('] -> ');
        l := l^.sig;
    end;
end;

procedure imprimirVectorContador (v:vRango);
var
	i:integer;
begin
	for i:= 1 to 7 do
	begin
		writeln(' ');
		writeln ('Rango ',i, ':', v[i]);
	end;
end;

{programa principal}
var
	pri:lista;
	vec:vRango;
begin
	pri:= nil;
	cargarLista (pri);
	
	masCostosa (pri);
	imprimirLista(pri);
	cantRangos (pri,vec);
	imprimirVectorContador(vec);
	cantDuracion (pri);
	costoSuperior (pri);
end.
	
