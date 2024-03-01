program uno;

procedure dobleDeNum (numA, numB:integer; var ok:boolean);
begin
	if (numB = numA*2) then
		ok:= true
	else ok:= false;
end;

var
	num1, num2: integer;
	doble: boolean;
begin
	readln(num1);
	readln(num2);
	dobleDeNum(num1, num2, doble);
	writeln(doble);
end.
