program P22E7;

//modulos

procedure digitosSuma (cant,num:integer; var tot, suma:integer); // 123,4
var
	dig:integer;
begin
	while (num <> 0) do
	begin
		
		dig:= num MOD 10; //4
		suma:= suma+dig; // 0+4
		cant:= cant+1;   // cantidad de digitos que posee (4)
		num:= num DIV 10; //123
		tot:= tot + suma; // total de digitos leidos
		
	end;
end;


var
	total,numero,cantidad,sum:integer;
begin
	cantidad:=0;
	total:=0;
	repeat
		sum:=0;
		writeln('Ingrese un numero:');
		readln(numero);
		digitosSuma(numero,cantidad,sum,total);
	until (sum = 10);
	writeln('La cantidad total de digitos leidos es: ', sum);
end.

{1235
* 4
* 11
* 
* 2281
* 4
* 13
* 
* 1234
* 4
* 10
* 
* 12}

