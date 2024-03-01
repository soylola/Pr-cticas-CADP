program P12E4;
var
	min1,min2,num:integer;
begin
	min1:= 30000;
	min2:= 30000;
	readln(num);
	while (num <> 0) do
	begin
		if (num < min1) then
		begin
			min2:=min1;
			min1:=num;
		end
		else if (num < min2) then
			min2:=num;
		readln(num);
	end;
	writeln (min1,',',min2);
end.
