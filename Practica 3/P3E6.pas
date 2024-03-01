{Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:

● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.


informacion conocida:
* Intel - Xeon - 1 - x - 14
* AMD - Core - 2 - x - 22
* Nvidia - i7 - 4 - x - 32}

program P3E6;

type
	micro = record
		marca:string;
		linea:string;
		cantCores:integer;
		velReloj:integer;
		tamNM:integer;
	end;
	
//modulos

procedure leer(var m:micro);
begin
	writeln('[>]Ingrese la marca del microprocesador:');
	readln(m.marca);
	writeln('[>]Ingrese la linea del microprocesador:');
	readln(m.linea);
	writeln('[>]Ingrese la cantidad de Cores del microprocesador:');
	readln(m.cantCores);
	if (m.cantCores <> 0) then
	begin
		writeln('[>]Ingrese la velocidad del reloj del microprocesador:');
		readln(m.velReloj);
		writeln('[>]Ingrese el tamaño en nanometros del microprocesador:');
		readln(m.tamNM);
	end;
end;

function cumple (m:micro):boolean;
begin
	cumple:= ((m.cantCores > 2)and(m.tamNM <= 22));
end;

//variables

var
	mic:micro;
	marcaAct:string;
	cantNM1:integer;
	nomNM1:string;
	cantNM2:integer;
	nomNM2:string;
	
//programa principal

begin
	cantNM:=0;
	cantNM2:=0;
	max:=-1;
	leer(mic);
	while (mic.cantCores <> 0) do
	begin
		marcaAct:= mic.marca;
		while (mic.marca = marcaAct) do
		begin
			if (cumple(mic))then
				writeln('La marca ',marcaAct,' de linea ',mic.linea,' cumple');
				
			if (mic.tamNM = 14) then
			begin
				cantNM1:= cantNM1 + 1;
				nomNM1:= marcaAct;	
			end;
				
			leer(mic);
		end;
		
	end;
end.























