{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.


A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:

a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.

b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.

c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.}

program P6E7;

type
	
	sonda = record
		nombre:string;
		duracion:integer;
		costoConst:real;
		costoMant:real;
		rango: integer;
	end;
	
	lista = ^nodo;
	listaCumplen = ^nodo;
	listaNoCumplen = ^nodo;
	
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


// inciso a (Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no)

function cumple (l:lista):boolean;
begin
	if ((l^.dato.costoMant < l^.dato.costoConst) and (l^.dato.rango <> 1)) then
		cumple:= true
	else
		cumple:= false;
end;


// inciso b

procedure agregarAdelanteCumplen (l:lista; var lc:listaCumplen);
var
	nuevo: listaCumplen;
begin
	new (nuevo);
	nuevo^.dato := l^.dato;
	nuevo^.sig:= lc;
	lc:= nuevo;
end;

procedure agregarAdelanteNoCumplen (l:lista; var lnc:listaCumplen);
var
	nuevo: listaNoCumplen;
begin
	new (nuevo);
	nuevo^.dato := l^.dato;
	nuevo^.sig:= lnc;
	lnc:= nuevo;
end;

procedure procesarLista (l:lista; var lc:listaCumplen; var lnc:listaNoCumplen);
begin
	while (l <> nil) do
	begin
		if (cumple(l)) then
			agregarAdelanteCumplen(l, lc)
		else
			agregarAdelanteNoCumplen(l,lnc);
		l:= l^.sig;
	end;
end;

//inciso c

procedure costoNoCumplen (lnc:listaNoCumplen);
var
	cant:integer;
	montoTotal:real;
begin
	cant:= 0;
	montoTotal:=0;
	
	while (lnc <> nil) do
	begin
		cant:= cant+1;
		montoTotal:= (montoTotal + lnc^.dato.costoConst +  lnc^.dato.costoMant);
		lnc:= lnc^.sig
	end;
	
	writeln('[>] La cantidad no financiada es: ',cant,' y su monto total es: ',montoTotal:1:2);
end;



// imprimir
procedure imprimirLista(l: lista);
begin
    while(l <> nil) do
    begin
        write('[');
        write(l^.dato.nombre);
        write(']');
		writeln(' ');
        l := l^.sig;
    end;
end;


procedure imprimirLista2(lc: listaCumplen);
begin
    while(lc <> nil) do
    begin
        write('[');
        write(lc^.dato.nombre);
        write(']');
        writeln(' ');
        lc := lc^.sig;
    end;
end;

procedure imprimirLista3(lnc: listaNoCumplen);
begin
    while(lnc <> nil) do
    begin
        write('[');
        write(lnc^.dato.nombre);
        write(']');
        writeln(' ');
        lnc := lnc^.sig;
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
	pri2:listaCumplen;
	pri3:listaNoCumplen;
begin
	//EJERCICIO 6
	pri:= nil;
	cargarLista (pri);
	imprimirLista(pri);
	cantRangos (pri,vec);
	writeln(' ');
	writeln('[*] RANGOS: ');
	imprimirVectorContador(vec);
	writeln(' ');
	
	//INCISO A
	procesarLista (pri,pri2,pri3);
	
	//INCISO B
	writeln('[!] CUMPLEN:');
	imprimirLista2(pri2);
	writeln('[!] NO CUMPLEN:');
	imprimirLista3(pri3);
	
	//INCISO C
	writeln(' ');
	costoNoCumplen(pri3);
end.
