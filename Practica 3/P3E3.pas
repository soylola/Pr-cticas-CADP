{
* 3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:

1) Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
2) CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
* 
}
// Salida de prueba:

// Esc1: 1/23435 = 0.00004367
// Esc2: 1/20000 = 0.00005

// [Si tengo mas alumnos, el numero se achica:]
// Esc3: 1/30000 = 0.00003333

// [Si tengo menos alumnos, el numero se agranda:]
// Esc4: 1/16000 = 0.00006250

// Esc5: 1/32000 = 0.00003125 (localidad berisso: no la cuenta)

program relacionEscuelas;

// REGISTRO "ESCUELA" QUE CONTIENE LA INFORMACIÓN DE LA ESCUELA

type 
	Escuela = record 
		CUE: integer;
		nombre: string;
		cantDocentes: integer;
		cantAlumnos: integer;
		localidad: string;
	end;

// FUNCION QUE CALCULA LA PROPORCION ENTRE DOCENTES Y ALUMNOS

function calcularRelacion(cantDocentes: integer; cantAlumnos: integer): real;
begin
	calcularRelacion := cantDocentes / cantAlumnos;
end;

// PROCEDIMIENTO QUE LEE EL REGISTRO

procedure leerEsc(var e: Escuela; var relacionObjetivo: real);
begin
	writeln('[>] Ingrese el Codigo Unico de Establecimiento: ');
	readln(e.CUE);
	writeln('[>] Ingrese el nombre del establecimiento: ');
	readln(e.nombre);
	writeln('[>] Ingrese cantidad de docentes:');
	readln(e.cantDocentes);
	writeln('[>] Ingrese cantidad de alumnos:');
	readln(e.cantAlumnos);
	writeln('[>] Ingrese la localidad:');
	readln(e.localidad);
	writeln('ESTABLECIMIENTO CARGADO!');
end;

// PROGRAMA PRINCIPAL

var
	relacionObjetivo: real;		// ES LA PROPORCION ESTABLECIDA (1/23435)
	relacionReal: real;			// ES LA QUE VAMOS A CALCULAR A LO LARGO DEL PROGRAMA ITERANDO SOBRE LOS REGISTROS
	esc: Escuela;
	
	mejorEsc1: real;
	mejorEsc2: real;
	mejorCue1: integer;
	mejorNombre1 : String;
	mejorCue2: integer;
	mejorNombre2 : String;
	
	escuelasConProporcionMayor: integer;
	i:integer;
	
begin
	// INICIALIZACIÓN DE VARIABLES
	relacionObjetivo := (1/23435);
	mejorEsc1 := -1;
	mejorEsc2 := -1;
	mejorCue1 := 0;
	mejorCue2 := 0;
	mejorNombre1 := 'x';
	mejorNombre2 := 'x';
	escuelasConProporcionMayor := 0;
	
	writeln('>>> Relacion objetivo establecida por la UNESCO: ', relacionObjetivo:0:8);
	for i:= 1 to 2400 do begin
		leerEsc(esc, relacionReal);
		relacionReal := calcularRelacion(esc.cantDocentes, esc.cantAlumnos);	//CALCULO LA RELACIÓN ACTUAL DOCENTE-ALUMNOS
		writeln('>>> Relacion entre docentes y alumnos de este establecimiento: ', relacionReal:0:8);	//LA INFORMO
		if ((relacionReal < relacionObjetivo) and (esc.localidad = 'la plata')) then // PUNTO 1
		begin 
			escuelasConProporcionMayor := escuelasConProporcionMayor + 1;
		end;
		if (relacionReal >= mejorEsc1) then	//PUNTO 2
		begin
			mejorEsc2 := mejorEsc1;
			mejorEsc1 := relacionReal;
			// GUARDO LOS DATOS DE LAS 2 ESCUELAS CON MEJOR RELACION DOCENTES/ALUMNOS
			mejorCue2:= mejorCue1;
			mejorNombre2:= mejorNombre1;
			mejorCue1 := esc.CUE;
			mejorNombre1 := esc.nombre;
		end
		else if (relacionReal >= mejorEsc2)then
		begin
			mejorEsc2 := relacionReal;
			// GUARDO LA ESCUELA CON LA SEGUNDA MEJOR RELACION ENTRE DOCENTES Y ALUMNOS
			mejorCue2 := esc.CUE;
			mejorNombre2 := esc.nombre;
		end;
	end;
	writeln('[+] Cantidad de escuelas en La Plata que superan la relacion de alumnos por docentes establecida por la UNESCO: ', escuelasConProporcionMayor);
	writeln('[+] La escuela con mejor relacion entre docentes y alumnos: >CUE: ',mejorCue1, ' >Nombre: ',mejorNombre1,' >con relacion: ', mejorEsc1:0:8);
	writeln('[+] La segunda escuela con mejor relacion entre docentes y alumnos: >CUE: ', mejorCue2, ' >Nombre: ', mejorNombre2,' >con relacion: ', mejorEsc2:0:8);
end.
