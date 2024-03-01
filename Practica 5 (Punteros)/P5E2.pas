program punteros;

type
	cadena = string[9]; // 9+1
	
	producto = record
		codigo: integer; // 2
		descripcion: cadena; // 10
		precio: real; // 4
	end;
	
	puntero_producto = ^producto; // 4 bytes
var
	p: puntero_producto;
	prod: producto;
begin
	writeln(sizeof(p), ' bytes'); // 4 bytes
	writeln(sizeof(prod), ' bytes'); // 16 bytes 
	new(p);
	writeln(sizeof(p), ' bytes'); // 4 bytes
	p^.codigo := 1;
	p^.descripcion := 'nuevo'; 
	writeln(sizeof(p^), ' bytes'); // 16 bytes
	p^.precio := 200;
	writeln(sizeof(p^), ' bytes'); // 16 bytes
	prod.codigo := 2;
	prod.descripcion := 'otro';
	writeln(sizeof(prod), ' bytes'); // 16 bytes
end.
