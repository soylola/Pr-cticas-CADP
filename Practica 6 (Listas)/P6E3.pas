{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:

a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).

b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}

program JugamosConListas;
type
	lista = ^nodo; 
	
	nodo = record
		num : integer;
		sig : lista;
	end;

{inciso a}
	
procedure armarNodo(var L: lista; v: integer);
var
	nuevo, aux : lista;
begin
	new(nuevo);		// pido memoria para un nuevo elemento
	nuevo^.num := v;	// le asigno el valor a num
	nuevo^.sig := nil;	// le asigno como siguiente nil
	if (l = nil) then // si es el primer elemento de la lista
		l:= nuevo;	// le asigno el nuevo elemento a	
	else
	begin
		aux:= L;
		while (aux^.sig <> nil) do
			aux := aux^.sig;
		aux^.sig := nuevo;
	end;
end;



{inciso d}

procedure incrementarLista (L:lista; var n:integer);

begin
	while (L <> nil) do	// mientras no haya llegado al final de la lista o la lista esté vacía
	begin
      	L^.num := (L^.num + n);
		L:= L^.sig;		// pasa al siguiente nodo
	end;
end;

{inciso c}

procedure imprimirLista (L:lista);
begin
 while (L <> nil) do
   begin
      writeln (L^.num);	// imprime el elemento del nodo actual
      L:= L^.sig;		// pasa al siguiente nodo
   end;
end;

{programa principal}

var
	pri : lista;		// primer elemento de la lista
	valor : integer;	// valor para leer y asignar a los nodos futuros
	numero: integer;
begin
	pri := nil;			// creo la lista
	
	writeln('[>] Ingrese un numero: ');
	readln(valor);
	
	while (valor <> 0) do	// mientras el valor no sea 0
	begin
		armarNodo(pri, valor);	// agrega adelante
		writeln('[>] Ingrese un numero:'); // vuelve a leer otro valor para agregar
		readln(valor);
	end;
	
	writeln('Ingrese un numero para incrementar cada elemento de la lista');
	readln(numero);
	incrementarLista (pri, numero);
	
	writeln('Lista incrementada con el valor ', numero,':');
	imprimirLista(pri);
end.
