{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:

a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
 
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.

c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.}

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


function maxElemento (L:lista):integer;
var
	max:integer;
begin
	max:= -1;
	while (L <> nil) do
	begin
		if (L^.num > max) then
			max:= L^.num;
		L := L^.sig;
	end;
	maxElemento := max;
	writeln('El mayor elemento de la lista es: ',max);
end;


function minElemento (L:lista):integer;
var
	min:integer;
begin
	min:= 10000;
	while (L <> nil) do
	begin
		if (L^.num < min) then
			min:= L^.num;
		L := L^.sig;
	end;
	minElemento:= min;
	writeln('El menor elemento de la lista es: ',min);
end;

function cantMultiplos (L:lista; a:integer):integer;
var
	cant:integer;	
begin
	cant:=0;
	while (L <> nil) do
	begin
		if ((L^.num mod a) = 0) then
			cant:= cant+1;
		L:= L^.sig;
	end;
	cantMultiplos:=cant;
end;
	

{programa principal}

var
	pri : lista;		// primer elemento de la lista
	valor : integer;	// valor para leer y asignar a los nodos futuros
	numero: integer;
	num: integer;
	cantidadM:integer;
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
	
	maxElemento (pri);
	
	writeln(' ');
	
	minElemento (pri);
	
	writeln(' ');
	
	writeln('Ingrese un numero para ver cuantos elementos de la lista son multiplos de ese numero:');
	readln(num);
	cantidadM:= cantMultiplos (pri,num);
	
	writeln(' ');
	writeln('La cantidad de multiplos del numero: ',num,' es: ', cantidadM);
	
end.

