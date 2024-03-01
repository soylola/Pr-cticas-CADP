program P22E9;

//lee los alumnos

procedure leerAlu(var num:integer; var ape,nom:string);
begin
	writeln('Ingrese el numero de inscripcion');
	readln(num);
	writeln('Ingrese el apellido');
	readln(ape);
	writeln('Ingrese el n');
	readln(nom);
end;

// devuelve los apellidos de los alumnos con numero de inscripción más chico

procedure apellidos (n:integer; ape:string; var apeMin,apeMin2:string; var nMin,nMin2:integer);
begin
	if (n < nMin) then //2233		// el numero de inscripcion es más chico que el minimo(30.000)?
	begin
		nMin2:=nMin;				// guardo el minimo1 en el minimo2
		nMin:=n;					// guardo el numero de inscripcion en el minimo1
		apeMin2:= apeMin;			// guardo el apellido1 en el apellido2
		apeMin:=ape;				// guardo el apellido actual en el apellido1
	end
	else if (n < nMin2) then		// si el numero de inscripcion es mas chico que el minimo2
	begin
		nMin2:=n;					// guardo el numero de inscripcion en el minimo2
		apeMin2:=ape;				// guardo el apellido actual en el apellido2
	end;	
end;

// devuelve los nombres de los dos alumnos con inscripcion más grande  ||  Marco 9933  Juan 9920

procedure nombres (n:integer; nom:string; var nomMax,nomMax2:string);
var
	nMax,nMax2:integer;
begin
	nMax:=-1;
	nMax2:=-1;
	if (n > nMax)then
	begin
		nMax2:=nMax;
		nMax:=n;
		nomMax2:=nomMax;
		nomMax:=nom;
	end
	else if (n > nMax2)then
	begin
		nMax2:=n;
		nomMax2:=nom;
	end;
end;

// devuelve el porcentaje de alumnos con numero de inscripcion par

procedure porcentaje (n:integer; var porc:real; var p,cant:integer);
begin
	cant:=cant+1;
	if (n mod 2=0) then
		p:=p+1;
	porc:= ((p*100)/cant);
end;

// programa principal

var
	numero, cantidad, inscPares,numeroMin,numeroMin2:integer;
	apellido, nombre, nombreMax1, nombreMax2, apellidoMin1, apellidoMin2:string;
	prc:real;  
begin
	numeroMin:= 30000;
	numeroMin2:= 30000;
	cantidad:=0;
	repeat
		leerAlu(numero,apellido,nombre);
		
		apellidos(numero, apellido, apellidoMin1, apellidoMin2,numeroMin,numeroMin2);
		
		nombres(numero, nombre, nombreMax1, nombreMax2);
		
		porcentaje (numero, prc, inscPares, cantidad);
		
	until (numero = 1200);
	writeln('Los apellidos de los 2 alumnos con numero de inscripcion mas chico son: ',apellidoMin1,' y ',apellidoMin2);
	writeln('Los nombres de los 2 alumnos con numero de inscripcion mas grande son: ',nombreMax1,' y ',nombreMax2);
	writeln('Hay un ',prc:1:1,' porciento de alumnos con inscripcion par');
end.

{123
* 222
* 
* Alvarado
* Marrero
* 
* 666
* 555
* 
* Juan
* Sebastian
* 
* 50 porciento}


{2222
* Lola
* Marrero
* 
* 1233
* Marco
* Alvarado
* 
* 6666
* Juan
* Cejas
* 
* 5555
* Ornella
* Giannotta}





