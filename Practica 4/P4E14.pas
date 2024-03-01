{14. El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:


Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:



a) El monto total invertido en desarrolladores con residencia en Argentina. ((((LISTO))))
b) La cantidad total de horas trabajadas por Administradores de bases de datos. ((((LISTO))))
* 
c) El código del proyecto con menor monto invertido.
* 
d) La cantidad de Arquitectos de software de cada proyecto.

}

program P4E14;
const
	DF = 10;
type
	vCodigo = array [1..DF] of integer;
	
	vMonto =  array [1..5] of real;

	part = record
		pais:string;
		codProyecto:integer;
		nomProyecto:string;
		rol:integer;
		cantHoras:integer;
	end;

// modulos

procedure leerParticipante (var p:part);
begin
	writeln('>  >  >  >  >  >  >  >  >  >  >');
	writeln(' ');
	
	writeln('[>] Ingrese el codigo del proyecto del participante: ');
	readln(p.codProyecto);
	writeln(' ');
	
	if (p.codProyecto <> -1) then
	begin
		writeln('[>] Ingrese el pais del participante: ');
		readln(p.pais);
		writeln(' ');
		
		writeln('[>] Ingrese el codigo del proyecto del participante: ');
		readln(p.codProyecto);
		writeln(' ');
		
		writeln('[>] Ingrese el nombre del proyecto del participante: ');
		readln(p.nomProyecto);
		writeln(' ');
		
		writeln('[>] Ingrese el rol (1 a 5) del participante: ');
		readln(p.rol);
		writeln(' ');
		
		writeln('[>] Ingrese la cantidad de horas trabajadas del participante: ');
		readln(p.cantHoras);
		writeln(' ');
		
	end;
end;

// inciso a
{inicializo vector de paga por hora}
procedure inicializarVMonto (var m:vMonto);
begin
	begin
		m[1]:= 35.20;
		m[2]:= 27.45;
		m[3]:= 31.03;
		m[4]:= 44.28;
		m[5]:= 39.87;
	end;
end;

{El monto total invertido en desarrolladores con residencia en Argentina}
procedure montoTotalInvertido (p:part; m:vMonto; var mTotalInv:real);
begin
	if (p.pais = 'argentina') then
	begin
		mTotalInv:= mTotalInv + (m[p.rol] * p.cantHoras);
	end;
end;

// inciso b (La cantidad total de horas trabajadas por Administradores de bases de datos)
procedure cantHorasTrabABD (p:part; var cant: integer);
begin
	if (p.rol = 3) then
		cant:= cant + (p.cantHoras);
end;

// inciso c (El código del proyecto con menor monto invertido)
procedure menorMontInv (p:part; m:vMonto; var minTotalInv:real);
var
	i:integer;
	total:real;
begin
	total := (p.cantHoras * m[p.rol]);
	for i:1 to DF do
	begin
		if (total < ) then
		begin
		end;
	end;
end;


// programa principal

var
	par:part;
	mont:vMonto;
	montoTotalInv:real;
	cantHorasTABD: integer;
begin
	montoTotalInv:= 0;
	cantHorasTABD:= 0;
	inicializarVMonto(mont); {inicializa vMont con la paga x hora de cada rol}
	
	leerParticipante(par);
	while (par.codProyecto <> -1) do
	begin
		montoTotalInvertido (par,mont,montoTotalInv);
		cantHorasTrabABD (par,cantHorasTABD);
		leerParticipante(par);
		
	end;
	writeln('[!] El monto total invertido en desarrolladores Argentinos es: ',montoTotalInv:1:2);
	writeln('[!] La cantidad total de horas trabajadas por Administradores de bases de datos es : ',cantHorasTABD);
end.































