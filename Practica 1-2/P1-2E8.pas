program P12E8;
uses Windows;
var
	i, ventasDia,maxCantVentas: integer;
	montoTotal, monto: real;
	
begin	
	setConsoleOutputCP(CP_UTF8);
	
	montoTotal:=0;
	maxCantVentas:=-1;
	
	for i:= 1 to 2 do
	begin
		ventasDia:=-1;
		repeat
			writeln('Ingrese el monto de la venta realizada: ');
			readln(monto);
			ventasDia:= ventasDia + 1;
			montoTotal:= montoTotal + monto;
		until (monto = 0);
		if (ventasDia > maxCantVentas) then
		begin
			maxCantVentas:= i;
		end;
		writeln('La cantidad de ventas del día ',i,' fue: ',ventasDia);
	end;
	
	writeln('El monto total acumulado en ventas de todo el mes es: ',montoTotal:1:2);
	writeln('El día en el que se realizó la mayor cantidad de ventas fue el día: ',maxCantVentas);
end.
