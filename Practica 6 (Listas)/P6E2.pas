program ejercicio2;
type
	lista = ^nodo;
	
	persona = record
		dni: integer;
		nombre: string;
		apellido: string;
	end;
	
	nodo = record
		dato: persona;
		sig: lista;
	end;
	
procedure leerPersona(p: persona); // ERROR 1: p debería pasarse por referencia para poder almacenar los datos correctamente
begin
	writeln('Ingrese el DNI: ');
	read(p.dni);
	if (p.dni <> 0)then
	begin
		writeln('Ingrese el nombre: ');
		read(p.nombre);
		writeln('Ingrese el apellido: ');
		read(p.apellido);
	end;
end;

{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona); // ERROR 2: l debería pasarse por referencia en el caso de que sea el único elemento de la lista
var
	aux: lista;
begin
	aux^.dato:= p;	// ERROR 3: debería hacer un new(aux) para pedir memoria para el nuevo nodo
	aux^.sig:= l;
	l:= aux;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
	p:nodo;	//	ERROR 4: p debería ser de tipo persona
begin
	leerPersona(p);
	while (p.dni <> 0) do
	begin
		agregarAdelante(l,p);
		// 	ERROR 5: debería volver a leer otro registro para continuar iterando correctamente
	end;
end;


procedure imprimirInformacion(var l:lista); // ERROR 6: l debería estar pasado por valor porque no se modifica
begin
	while (l <> nil) do
	begin
		writeln('DNI: ', l^.dato.dni, 'Nombre: ', l^.nombre, 'Apellido: ', l^.apellido); // ERROR 7: para acceder al nombre l^.dato.nombre / ERROR 8: l^.dato.apellido
	end;
end;

{Programa principal}
var
	l:lista; // ERROR 9: falta una variable para el registro persona
begin
	generarLista(l);
	imprimirInformacion(l);
end.

{}
