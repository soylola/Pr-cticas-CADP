{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:

a) La cantidad de galaxias de cada tipo. ((((((((LISTO))))))))
b) La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias. ((((((((LISTO))))))))
c) La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.((((((((LISTO))))))))

d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program P4E12;
const
	DF = 5;
	
// tipos de datos
type
	vTipo = array [1..4] of integer;
	
	galaxia = record
		nom:string;
		tipo: integer;
		masa: real;
		distanciaPc: real;
	end;
	
	vGalaxia = array [1..DF] of galaxia;

// modulo para cargar el registro galaxia
procedure leerGalaxia (var g:galaxia);
begin
	writeln('[>] Ingresa el nombre de la galaxia: ');
	readln(g.nom);
	writeln('[>] Ingresa el tipo de la galaxia: ');
	readln(g.tipo);
	writeln('[>] Ingresa la masa de la galaxia: ');
	readln(g.masa);
	writeln('[>] Ingresa la distancia en pc de la galaxia: ');
	readln(g.distanciaPc);
	writeln(' ');
end;

// modulo para cargar el vector de galaxias
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
procedure cantGalaxias (var t:vTipo; var v:vGalaxia);
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
		writeln(i,' = ',t[i]);
	end;
end;

// inciso b (La masa total acumulada de las 3 galaxias principales)
procedure masaTotal3Galaxias (v:vGalaxia; var mTotal3:real; var mTotal:real);
var
	i:integer;
begin
	for i:= 1 to DF do
	begin
		if (((v[i].nom) = 'via lactea') or ((v[i].nom) = 'andromeda') or ((v[i].nom) = 'triangulo')) then
		begin
			mTotal3:= (mTotal3 + (v[i].masa));
		end;
		mTotal:= (mTotal + (v[i].masa));
	end;
end;

// inciso b parte 2 (el porcentaje que esto representa respecto a la masa de todas las galaxias)
function porcentaje (mTotal3:real; mTotal:real):real;
begin
	porcentaje:= ((mTotal3 * 100) / mTotal);
end;

//inciso c (La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.)
function galaxiasNoIrreg (v:vGalaxia): integer;
var
	cant,i:integer;
begin
	cant:=0;
	for i:= 1 to DF do
	begin
		if ((v[i].tipo <> 4) and (v[i].distanciaPc < 1000)) then
			cant:= cant+1;
	end;
	galaxiasNoIrreg:= cant;
end;

// inciso d (El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa)
procedure mayorMasa (v:vGalaxia; var maxMasa1, maxMasa2:real; var maxNom1,maxNom2:string);
var
	i:integer;
begin
	for i:= 1 to DF do
	begin
		if (v[i].masa > maxMasa1) then
		begin
			maxMasa2:= maxMasa1;
			maxMasa1:= v[i].masa;
			maxNom2:= maxNom1;
			maxNom1:= v[i].nom;
		end
		
		else if (v[i].masa > maxMasa2) then
		begin
			maxMasa2:= v[i].masa;
			maxNom2:= v[i].nom;
		end;
	end;
end;

//inciso d parte 2
// inciso d (El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa)
procedure menorMasa (v:vGalaxia; var minMasa1, minMasa2:real; var minNom1,minNom2:string);
var
	i:integer;
begin
	for i:= 1 to DF do
	begin
		if (v[i].masa < minMasa1) then
		begin
			minMasa2:= minMasa1;
			minMasa1:= v[i].masa;
			minNom2:= minNom1;
			minNom1:= v[i].nom;
		end
		
		else if (v[i].masa < minMasa2) then
		begin
			minMasa2:= v[i].masa;
			minNom2:= v[i].nom;
		end;
	end;
end;



// programa principal
var
	contTipo: vTipo;
	gal: galaxia;
	vec: vGalaxia;
	masaTotal3: real;	// variable para la masa de las 3 galaxias principales
	masaTotal: real;	// variable para la masa de todas las galaxias
	porcMasa3: real;	// variable para guardar el porcentaje
	cant: integer;		// variable para guardar la cantidad de galaxias no irregulares con menos de 1000pc
	maxMasa1, maxMasa2: real;
	minMasa1, minMasa2: real;
	
	maxNombre1, maxNombre2: string;
	minNombre1, minNombre2: string;
begin
	{inicializacion de variables contadoras}
	masaTotal3:=0;
	
	maxMasa1:= -1;
	maxMasa2:= -1;
	
	minMasa1:= 10000;
	minMasa2:= 10000;
	
	maxNombre1:= 'x';
	maxNombre2:= 'y';
	
	minNombre1:= 'x';
	minNombre2:= 'y';
	
	inicializarVCont (contTipo);	// INCIALIZO EL VECTOR CONTADOR EN 0
	leerVector(vec,gal);			// CARGO EL VECTOR 
	cantGalaxias(contTipo,vec);		// SUMO LOS TIPOS DE GALAXIAS EN MI VECTOR CONTADOR
	imprimir (contTipo);			// IMPRIMO LOS TIPOS DE GALAXIAS
	writeln(' ');
	
	
	masaTotal3Galaxias(vec,masaTotal3,masaTotal);	// CALCULO LA MASA DE LAS 3 GALAXIAS PRINCIPALES Y LA MASA TOTAL
	writeln('[!] La masa total de las 3 galaxias principales es: ',masaTotal3:1:2);
	writeln('[!] La masa total de todas las galaxias es: ',masaTotal:1:2);
	writeln(' ');
	
	
	porcMasa3:= porcentaje (masaTotal3,masaTotal);	// CALCULO EL PORCENTAJE DE LA MASA DE LAS 3 GALAXIAS PRINCIPALES CON RESPECTO A LAS DEMÁS
	writeln('[*] El porcentaje de masa de las 3 galaxias principales es: ',porcMasa3:1:2,'%');
	writeln(' ');
	
	
	cant:= galaxiasNoIrreg (vec);
	writeln('[+] La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc son: ',cant);
	writeln(' ');
	
	
	mayorMasa(vec, maxMasa1, maxMasa2, maxNombre1, maxNombre2);
	writeln('[#] Los nombres de las dos galaxias con mayor masa son: ',maxNombre1,' y ',maxNombre2);
	writeln(' ');
	
	menorMasa(vec,minMasa1, minMasa2, minNombre1, minNombre2);
	writeln('[#] Los nombres de las dos galaxias con menor masa son: ',minNombre1,' y ',minNombre2);
	writeln(' ');
end.
