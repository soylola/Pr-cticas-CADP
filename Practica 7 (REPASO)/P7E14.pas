{La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar información
de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información de los préstamos
realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado,
nro. de socio al que se prestó el libro, día del préstamo (1..31).
La información de los préstamos se lee de manera ordenada por ISBN y finaliza
cuando se ingresa el ISBN -1 (que no debe procesarse).

Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par.}

program P7E14;

type
	rangoDia = 1..31;
	
	prestamo = record
		numero: integer;
		ISBN: integer;		//codigo de barras
		nroSocio: integer;	//numero de socio;
		dia: rangoDia;
	end;
	
	
	lista = ^nodo;
	
	nodo = record
		dato: prestamo;
		sig: lista;
	end;
	
	info = record
		ISBN: integer;
		cantPrestado: integer;
	end;
	
	listaISBN = ^nodo2;
	
	nodo2 = record
		dato: info;
		sig: listaISBN;
	end;
	
	vectorMeses = array [rangoDia] of integer; // vector que guarda cant de veces que se prestó un libro
	
// programa principal

var
	l:lista;
	l2: listaISBN;
	vecMeses: vectorMeses;

begin
	
end;

