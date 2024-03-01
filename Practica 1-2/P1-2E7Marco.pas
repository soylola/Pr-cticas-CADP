program cod;
procedure descomponerNum(num: integer; var sumaDigitos: integer; var cantDeDigitos: integer);
var
dig: integer;
	begin
		while (num <> 0) do begin
			dig := num mod 10; // ACÁ TENGO EL DIGITO
			sumaDigitos := sumaDigitos + dig; // SUMA DE LOS DIGITOS
			writeln('[+] Numero en cuestion: ', num);
			num := num div 10; // ACA TENGO LA ACTUALIZACION DEL NUMERO
			cantDeDigitos := cantDeDigitos + 1;
		end;
	end;
// MODULO PRINCIPAL
var
	// numero, suma de los digitos, cantidad de digitos
	numero, sd, cd: integer;
begin
	// Modulo principal!
	cd := 0;
	repeat 
		writeln('Ingrese un numero para descomponer: ');
		sd := 0;
		readln(numero);
		descomponerNum(numero, sd, cd);
		writeln('[+] Suma de los digitos: ', sd);
		writeln('[+] Cantidad de digitos: ', cd);
	until(sd = 10);
end.
