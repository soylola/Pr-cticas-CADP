{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar: 
* 
a. Porcentaje de productos con stock actual por debajo de su stock mínimo. ((((LISTO))))
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares. ((((LISTO))))
c. Código de los dos productos más económicos.((((LISTO))))}


program P6E5;

type
	
	producto = record
		cod:integer;
		desc:string;
		stockAct:integer;
		stockMin:integer;
		precio:real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato: producto;
		sig: lista;
	end;
	
{modulos}

procedure leerProducto (var p:producto);
begin
	writeln('[!] Ingrese el codigo del producto: ');
	readln(p.cod);
	if (p.cod <> -1) then
	begin
		writeln('[!] Ingrese la descripcion del producto: ');
		readln(p.desc);
		writeln('[!] Ingrese el stock actual del producto: ');
		readln(p.stockAct);
		writeln('[!] Ingrese el stock minimo del producto: ');
		readln(p.stockMin);
		writeln('[!] Ingrese el precio del producto: ');
		readln(p.precio);
		writeln(' ');
	end;
end;

procedure cargarLista (var l:lista);
var
	p:producto;
	nuevo:lista;
begin
	leerProducto (p);
	while (p.cod <> -1) do
	begin
		new(nuevo);
		nuevo^.dato := p;
		nuevo^.sig:= l;
		l:= nuevo;
		leerProducto(p);
	end;
end;

procedure imprimirLista (l:lista);
begin	
	while (l <> nil) do
	begin
		writeln('[>] Codigo: ',l^.dato.cod);
		writeln('[>] Descripcion: ',l^.dato.desc);
		writeln('[>] Stock actual: ',l^.dato.stockAct);
		writeln('[>] Stock minimo: ',l^.dato.stockMin);
		writeln('[>] Precio: ',l^.dato.precio:1:2);
		writeln(' ');
		l:= l^.sig;
	end;
end;

{inciso a}

procedure porcentajeStock (l:lista);
var
	porcentaje:real;
	prodTotal:real;
	prodStock:real;
begin
	prodTotal:= 0;
	prodStock:= 0;
	
	while (l <> nil) do
	begin
		prodTotal:= prodTotal +1;
		if (l^.dato.stockAct < l^.dato.stockMin) then
		begin
			prodStock :=  prodStock+1;
		end;
		porcentaje:= ((prodStock*100)/prodTotal);
		
		l:= l^.sig;
	end;
	writeln('[!] Porcentaje: ',porcentaje:1:2,'%');
end;

{inciso b}

procedure descripcion (l:lista);
var
	dig,cantPares:integer;
	codigoActual:integer;
begin
	
	while (l <> nil) do
	begin
		cantPares:= 0;
		codigoActual:= l^.dato.cod;
		while (codigoActual <> 0) do
		begin
			dig:= codigoActual mod 10;
			if ((dig mod 2) = 0) then
			begin
				cantPares:= cantPares+1;
			end;
			codigoActual:= codigoActual div 10;
		end;
		
		if (cantPares >= 3) then
		begin
			writeln(' ');
			writeln ('[*] Descripcion: ', l^.dato.desc);
		end;
		
		l:= l^.sig;
	end;
end;

{inciso c}

procedure masEconomicos(l:lista);
var
	codMin1,codMin2: integer;
	precMin1,precMin2:real;
begin
	codMin1:=10000;
	codMin2:=10000;
	precMin1:=10000;
	precMin2:=10000;
	
	while (l<> nil) do
	begin
		if (l^.dato.precio < precMin1) then
		begin
			precMin2:= precMin1;
			precMin1:= l^.dato.precio;
			codMin2:= codMin1;
			codMin1:=l^.dato.cod;
		end
		
		else if (l^.dato.precio < precMin2) then
		begin
			precMin2:= l^.dato.precio;
			codMin2:= l^.dato.cod;
		end;
		l:= l^.sig;
	end;
	writeln('[.] Los codigos de los dos productos mas economicos son: ',codMin1,' y ',codMin2);
end;


{programa principal}

var
	pri:lista;

begin
	pri:=nil;
	cargarLista(pri);
	imprimirLista(pri);
	porcentajeStock(pri);
	descripcion(pri);
	masEconomicos(pri);
end.
