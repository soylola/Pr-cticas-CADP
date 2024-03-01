program casamientos;
{inciso a}
type
	fecha = record
		dia: integer;
		mes:integer;
		anio:integer;
	end;
	
{inciso b}
procedure leerFecha(var f:fecha);
begin
	writeln('Ingresar el anio del casamiento:');
	readln(f.anio);
	if (f.anio <> 2020) then
	begin
		writeln('Ingresar el dia del casamiento:');
		readln(f.dia);
		writeln('Ingresar el mes del casamiento:');
		readln(f.mes);
	end;
end;

{inciso c}
var
	fec:fecha;
	casVer, cas10:integer;
begin
	cas10:=0;
	casVer:=0;
	leerFecha(fec);
	while (fec.anio <> 2020) do
	begin
		if ((fec.mes >= 1) and (fec.mes <=3)) then
		begin
			casVer:=casVer+1;
		end;
		if ((fec.dia >= 1) and (fec.dia <= 10))then
		begin
			cas10:=cas10+1;
		end;
		leerFecha(fec);
	end;
	writeln('Se realizaron ',casVer,' casamientos durante los meses de verano');
	writeln('Se realizaron ',cas10,' casamientos en los primeros 10 dias de cada mes');
end.
