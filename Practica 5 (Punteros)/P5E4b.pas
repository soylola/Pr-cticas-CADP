program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	new(pc);
	pc^:= 'un nuevo nombre';
	writeln(sizeof(pc^), ' bytes'); // 51 bytes
	writeln(pc^); // 'un nuevo nombre'
	dispose(pc); // libera la direccion
	pc^:= 'otro nuevo nombre'; // ERROR. pc ya no apunta a nada. NO EJECUTAR PORQUE SALTA RUNTIME ERROR
end.
