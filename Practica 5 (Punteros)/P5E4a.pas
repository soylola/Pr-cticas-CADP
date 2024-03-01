program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
	
var
	pc: puntero_cadena;
begin
	pc^:= 'un nuevo texto';
	new(pc);
	writeln(pc^); // ERROR
end.

{debería primero hacer el new de pc para pedir memoria y ahí llenar
* esa dirección con "un nuevo texto". si cambiamos new(pc) arriba, 
* imprimiria 'un nuevo texto'.
