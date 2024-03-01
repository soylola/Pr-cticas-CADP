program P3E5;

type
	auto=record
		marca:string;
		modelo:string;
		precio:real;
	end;
	
//modulo para leer el registro

procedure leerAuto (var a:auto);
begin
	writeln('[>]Ingrese la marca del auto: ');
	readln(a.marca);
	if (a.marca <> 'ZZZ') then
    begin
        writeln('[>]Ingrese el modelo del auto: ');
        readln(a.modelo);
        writeln('[>]Ingrese el precio del auto: ');
        readln(a.precio);
    end;
end; 

//modulo para devolver el promedio de la marca (inciso a)

procedure promedio (a:auto; act:string; var prom:real; var cant:integer);
begin
	prom:=0;
	cant:=0;
	while (a.marca <> 'ZZZ') do
	begin
		while (a.marca = act) do
		begin
			prom:= prom + a.precio;
			cant:=cant+1;
		end;
	end;
end;

// programa principal

var
	autos:auto;
	promAutos:real;
	cantidad:integer;
	actual:string;
	total:real;
begin
	leerAuto(autos);
	while (autos.marca <> 'ZZZ') do
	begin
		actual:= autos.marca;
		promedio(autos,actual,promAutos,cantidad);
		if (cantidad > 0) then
		begin
			total:=(promAutos/cantidad);
			writeln('El precio promedio de la marca ', actual,' es: ',total:1:2);
			leerAuto(autos);
		end;
	end;
	
end.

{Toyota, 2300, Toyota, 2400, Audi, 3100, 2300+2400/2 = 2350
* Audi, 1100, Ford, 3200, 3100+1100=4200/2 = 2100, Ford= 3200,  ZZZ,}

