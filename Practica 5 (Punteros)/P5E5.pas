Program Alocacion_Dinamica;
Type

	TEmpleado = record
		sucursal: char;
		apellido: string[25];
		correoElectronico: string[40];
		sueldo: real;
	end;
	
	Str50 = string[50];
Var
	alguien: TEmpleado;
	PtrEmpleado: ^TEmpleado;
Begin
	{Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
	Readln( alguien.apellido );
	{Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
	New( PtrEmpleado );
	{¿Cuánta memoria disponible hay ahora? (III)} // 400.000
	Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
	Readln( PtrEmpleado^.correoElectronico, PtrEmpleado^.sueldo );
	{¿Cuánta memoria disponible hay ahora? (IV)}
	Dispose( PtrEmpleado );
	{¿Cuánta memoria disponible hay ahora? (V)}
end.
