{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado).}

program JugamosConListas;
type
	lista = ^nodo; 
	
	nodo = record
		elem : integer;
		sig : lista;
	end;


// INSERTAR ORDENADO

procedure armarNodo (var l: lista; num: integer);
var
	nuevo,anterior,actual:lista;
begin
	new (nuevo);
	nuevo^.elem := num;
	actual := l;
	anterior := l;
	
	while ((actual <> nil) and (actual^.elem < nuevo^.elem)) do	
	begin
		anterior := actual;
		actual := actual^.sig;
	end;
	
	if (actual = anterior) then	
		l := nuevo

	else
		anterior^.sig := nuevo;
		
	nuevo^.sig :=actual;
end;

{IMPRIMIR}

procedure imprimirLista (L:lista);
begin
 while (L <> nil) do
   begin
      writeln (L^.elem);	// imprime el elemento del nodo actual
      L:= L^.sig;		// pasa al siguiente nodo
   end;
end;

{programa principal}

var
	pri : lista;		// primer elemento de la lista
	valor : integer;	// valor para leer y asignar a los nodos futuros
begin
	pri := nil;			// creo la lista
	
	writeln('[>] Ingrese un numero: ');
	readln(valor);
	
	while (valor <> 0) do	// mientras el valor no sea 0
	begin
		
		armarNodo(pri, valor);	// inserta ordenado
		
		writeln('[>] Ingrese un numero:'); // vuelve a leer otro valor para agregar
		readln(valor);

	end;
	imprimirLista(pri);
end.
