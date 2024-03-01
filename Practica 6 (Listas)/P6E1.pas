program JugamosConListas;
type
	lista = ^nodo; 
	
	nodo = record
		num : integer;
		sig : lista;
	end;

	
procedure armarNodo(var L: lista; v: integer);
var
	aux : lista;
begin
	new(aux);		// pido memoria para un nuevo elemento
	aux^.num := v;	// le asigno el valor a num
	aux^.sig := L;	// le asigno como siguiente al primer elemento
	L := aux;		// ahora el primer elemento de mi lista es aux
end;



{inciso d}

procedure incrementarLista (L:lista; n:integer);

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

{a. agrega un nodo adelante de la lista
b. 48 13 21 10
c. listo 
d. }
