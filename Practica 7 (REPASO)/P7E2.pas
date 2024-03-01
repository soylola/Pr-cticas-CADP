program P7E2;

type
	rangoPoliza = 1..6;
	
	cliente = record
		codigo: integer;
		dni: integer;
		ape: string;
		nom: string;
		poliza: rangoPoliza;
		montoMensual: real;
	end;

	lista = ^nodo;
	
	nodo = record
		dato: cliente;
		sig: lista;
	end;
	
	vector = array [rangoPoliza] of real; // vector "tabla" de monto adicional segun nro de poliza
	
	
// modulos

procedure cargarVector (var vec:vector); // se dispone


{cargo lista}

procedure cargarLista (var l:lista);
var
	c:cliente;
begin
	repeat
		leerRegistro(c);
		agregarAdelante(l,c);
	until (s.codigo = 1122);
end;

procedure leerRegistro (var c: cliente);
begin
	read(c.codigo);
	read(c.dni);
	read(c.ape);
	read(c.nom);
	read(c.poliza);
	read(c.montoMensual);
end;

procedure agregarAdelante (var l: lista, c:cliente);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := c;
	nue^.sig := l;
	l:= nue;
end;

{recorro la lista}

procedure procesarLista (l:lista; v:vector);
var
	total: real;
begin
	
	
	while (l <> nil) do
	begin
		total := l^.dato.montoMensual + v[l^.dato.poliza];
		informar(l,total);
		
		if (cumple (l^.dato.dni))then
			writeln(l^.dato.ape, l^.dato.nom);
			
		
		l := l^.sig;
	end;
end;

procedure informar (l:lista, total:real);
begin
	writeln('DNI: ',l^.dato.dni);
	writeln('Apellido: ',l^.dato.ape);
	writeln('Nombre: ',l^.dato.nom);
	writeln('Monto total: ',total);
end;

function cumple (l^.dato.dni: integer):boolean;
var
	dig, num, cant: integer;
begin
	cant := 0;
	num := l^.dato.dni;
	
	while (num <> 0) do
	begin
		dig := num mod 10;
		
		if (dig = 9) then
			cant:= cant+1;
			
		num := num div 10;
	end;
	
	cumple := (cant >= 2);
end;

{elimino cliente}

procedure eliminarCliente (var l:lista; codigo: integer);
var
	ant, act: lista;
begin
	act: l;
	
	while (act <> nil) and (act^.dato.codigo <> codigo) do
	begin
		ant := act;
		act := act^.sig;
	end;
	
	if (act <> nil) then
	begin
		if (act = l) then
			l := l^.sig;
		else
			ant^.sig := act^.sig;
			
		dispose (act);
	end;
end;

// programa principal

var
	l:lista;
	vec: vector;
begin
	l:= nil;
	cargarVector(vec); // se dispone
	cargarLista(l);
	procesarLista (l,vec);
	read(codigo);
	eliminarCliente (l, codigo);
end.


{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora automotriz.
* De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada (1..6)
* y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 1122,
* el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el cliente
* debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene contratada.
* 
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la estructura.}
