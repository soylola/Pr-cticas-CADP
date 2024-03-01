{
* 4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
* 
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
* 
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.

Salida de prueba:

* num 1, cantLineas 2, cantMin 51, cantMB 103, cantMin 42, cantMB 50: totalMin $316,2 | totalMB $206,55
* 
* 
* 
* 
* }

program P3E4;

type
	lineas= record
		num:integer;
		cantMin:real;
		cantMB:real;
	end;

	cliente = record
		codigo:integer;
		cantLineas:integer;
	end;
	
//modulos

procedure leerLineas (var l:lineas);
begin
	writeln('[>]Ingrese el telefono del cliente: ');
	readln(l.num);
	writeln('[>]Ingrese la cantidad de minutos consumidos del cliente: ');
	readln(l.cantMin);
	writeln('[>]Ingrese la cantidad de MB consumidos del cliente: ');
	readln(l.cantMB);
end;

procedure facturacion (var l:lineas; var c:cliente; var totalMin:real; var totalMB:real);
var
	i:integer;
begin
	writeln('[>]Ingrese la cantidad de lineas del cliente: ');
	readln(c.cantLineas);
	for i:= 1 to (c.cantLineas) do
	begin
		leerLineas(l);
		totalMin:= totalMin + l.cantMin;
		totalMB:= totalMB + l.cantMB;
	end;
	totalMin:= (totalMin * 3.40);
	totalMB:= (totalMB * 1.35);
	writeln('[>]La cantidad de minutos a facturar son: ',totalMin:1:2);
	writeln('[>]La cantidad de MB a facturar son: ',totalMB:1:2);
end;

// programa principal

var
	totalMinutos, totalMBs:real;
	lin:lineas;
	cli:cliente;
	
begin
	totalMinutos:=0;
	totalMBs:=0;
	facturacion (lin,cli,totalMinutos,totalMBs);
end.















