program P12E7;
uses Windows;
const
	ultimo= 100;
var
	nombre, piloto1, piloto2, ultpiloto, ultpiloto2: string;
	tiempo, tiempomin, tiempomin2, tiempomax, tiempomax2: real;
	i: integer;
begin
	setConsoleOutputCP(CP_UTF8);
	tiempomin:= 10000;
	tiempomin2:=10000;
	tiempomax:= -1;
	tiempomax2:= -1;
	piloto2:= ('.');
	piloto1:= ('.');
	ultpiloto:= ('.');
	ultpiloto2:= ('.');
	for i:= 1 to ultimo do
	begin
		writeln('Ingrese el nombre: ');
		readln(nombre);
		writeln('Ingrese el tiempo en finalizar la carrera: ');
		readln(tiempo);
		
		//primeros puestos
		
		if (tiempo < tiempomin) then
		begin
			tiempomin2:= tiempomin;
			tiempomin:= tiempo;
			piloto2:= piloto1;
			piloto1:= nombre;
		end
		else if (tiempo < tiempomin2) then
		begin
			tiempomin2:= tiempo;
			piloto2:= nombre;
		end;
		
		// ultimos puestos
		
		if (tiempo > tiempomax) then
		begin
			tiempomax2:= tiempomax;
			tiempomax:= tiempo;
			ultpiloto2:= ultpiloto;
			ultpiloto:= nombre;
		end
		else if (tiempo > tiempomax2) then
		begin
			tiempomax2:= tiempo;
			ultpiloto2:= nombre;
		end;
		
	end;
	writeln('El puesto número 1: ',piloto1,' y el puesto número 2: ',piloto2);
	writeln('El último puesto: ',ultpiloto,' y el anteúltimo puesto: ',ultpiloto2);
end.
	
