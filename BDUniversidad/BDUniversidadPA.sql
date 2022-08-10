--Procedimientos almacenados
--Feren Yabar 
--8/8/2022

--PA para TEscuela
use BDUniversidad
go
if OBJECT_ID('spListarEscuela') is not null
	 drop proc spListarEscuela
go

create proc spListarEscuela
as
begin
	select CodEscuela,Escuela,Facultad from TEscuela
end
go

exec spListarEscuela
go

if OBJECT_ID('spAgregarEscuela')is not null
	drop proc spAgregarEscuela
go

create proc spAgregarEscuela
@CodEscuela char(3),@Escuela varchar(50),@Facultad varchar(50)
as
begin
	--CodEscuela no puede ser duplicado
	if not exists(select CodEscuela  from TEscuela where CodEscuela=@CodEscuela)
		--Escuela no puede ser duplicado
		if not exists (select Escuela from TEscuela where Escuela=@Escuela)
			begin
				insert into TEscuela values(@CodEscuela,@Escuela,@Facultad)
				select CodError=0,Mensaje='Se inserto correctamente escuela'
			end
		else select CodError=1,Mensaje='Error:Escuela duplicado'
	else select CodError=1,Mensaje='Error:CodEscuela duplicado'
end 
go

--Implimentar Eliminar, Actualizar y buscar
--Presentado el dia miercoles 10 de agosto

--eliminar
if OBJECT_ID('spEliminarEscuela')is not null
	drop proc spEliminarEscuela
go
create proc spEliminarEscuela
@CodEscuela char(3)
as
begin
	delete from TEscuela where CodEscuela=@CodEscuela
end
go

exec spEliminarEscuela E03
exec spListarEscuela

--actualizar
if OBJECT_ID('spActualizarEscuela')is not null
	drop proc spActualizarEscuela
go
create proc spActualizarEscuela
@CodEscuela char(3),
@Escuela varchar(50),
@Facultad varchar(50)
as
begin
	update TEscuela set Escuela=@Escuela,
						Facultad=@Facultad
					where CodEscuela=@CodEscuela;
end
go

exec spActualizarEscuela E02,Obstetricia,'Ciencias de la Salud'
exec spListarEscuela

--buscar datos
if OBJECT_ID('spBuscarEscuela')is not null
	drop proc spBuscarEscuela
go
create proc spBuscarEscuela
@CodEscuela char(3)
as
begin
	select * from TEscuela where CodEscuela=@CodEscuela
end
go

exec spBuscarEscuela E01
exec spListarEscuela



--Para el Alumno
--PA para listar alumnos
if OBJECT_ID('spListarAlumno') is not null
	 drop proc spListarAlumno
go

create proc spListarAlumno
as
begin
	select CodAlumno,Apellidos,Nombres,LugarNac,FechaNac,CodEscuela from TAlumno
end
go

exec spListarAlumno
--Agregar Alumno
if OBJECT_ID('spAgregarAlumno') is not null
	 drop proc spAgregarAlumno
go

--Agregar Alumno
create proc spAgregarAlumno
@CodAlumno char(5),@Apellidos varchar(50),@Nombres varchar(50),@LugarNac varchar(50),@FechaNac datetime,@CodEscuela char(3)
as
begin
	--CodAlumno no puede ser duplicado
	if not exists(select CodAlumno  from TAlumno where CodAlumno=@CodAlumno)
		--todos los demas datos si pueden ser repetidos
		begin
			insert into TAlumno values(@CodAlumno,@Apellidos,@Nombres,@LugarNac,@FechaNac,@CodEscuela)
			select CodError=0,Mensaje='Se inserto correctamente alumno'
		end
	else select CodError=1,Mensaje='Error:CodEscuela duplicado'
		
end
go

--Eliminar Alumno
if OBJECT_ID('spEliminarAlumno')is not null
	drop proc spEliminarAlumno
go
create proc spEliminarAlumno
@CodAlumno char(5)
as
begin
	delete from TAlumno where CodAlumno=@CodAlumno
end
go

exec spEliminarAlumno A0002

--Actualizar
if OBJECT_ID('spActualizarAlumno')is not null
	drop proc spActualizarAlumno
go
create proc spActualizarAlumno
@CodAlumno char(5),
@Apellidos varchar(50),
@Nombres varchar(50),
@LugarNac varchar(50),
@FechaNac datetime,
@CodEscuela char(3)
as
begin
	update TAlumno set Apellidos=@Apellidos,
					   Nombres=@Nombres,
					   LugarNac=@LugarNac,
					   FechaNac=@FechaNac,
					   CodEscuela=@CodEscuela
					   where CodAlumno=@CodAlumno;
end
go

exec spActualizarAlumno A0001,'Villalon Castro',Diego,Cusco,'20-12-2001',E01 

--Buscar
if OBJECT_ID('spBuscarAlumno')is not null
	drop proc spBuscarAlumno
go
create proc spBuscarAlumno
@CodAlumno char(5)
as
begin
	select * from TAlumno where CodAlumno=@CodAlumno
end
go

exec spBuscarAlumno A0003
exec spListarAlumno