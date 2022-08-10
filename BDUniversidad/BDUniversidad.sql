--Base de datos ejemplo
--Feren Yabar
--8/7/2022
use master
go
if DB_ID('BDUniversidad') is not null
	drop database BDUniversidad
go

create database BDUniversidad
go

use BDUniversidad
go

--crear tablas
if OBJECT_ID('TEscuela') is not null
	drop table TEscuela
go

create table TEscuela
(
	CodEscuela char(3) primary key,
	Escuela varchar(50),
	Facultad varchar(50)
)
go

if OBJECT_ID('TAlumno') is not null
	drop table TAlumno
go

create table TAlumno(
	CodAlumno char(5) primary key,
	Apellidos varchar(50),
	Nombres varchar(50),
	LugarNac varchar(50),
	FechaNac datetime,
	CodEscuela char(3),
	foreign key (CodEscuela) references TEscuela
)
--Insercion de datos
--Escuela
insert into TEscuela values ('E01','Sistemas','Ingenieria')
insert into TEscuela values ('E02','Civil','Ingenieria')
insert into TEscuela values ('E03','Industrial','Ingenieria')
insert into TEscuela values ('E04','Ambiental','Ingenieria')
insert into TEscuela values ('E05','Arquitectura','Ingenieria')
go

select * from TEscuela
go

 --Alumno
insert into TAlumno values ('A0001','Carrillo Estrada','Diego','Arequipa','19-03-2000 15:23:04','E01')
insert into TAlumno values ('A0002','Castro Perez','Leandro','Cusco','30-07-1998 10:40:04','E01')
insert into TAlumno values ('A0003','Moscoso Zarate','Diana','Cusco','01-11-1997 19:23:00','E02')
insert into TAlumno values ('A0004','Cardenas Flores','Martin','Lima','20-08-2001 5:3:30','E04')
insert into TAlumno values ('A0005','Ramos Candia','Daniela','Cusco','20-08-2001 5:3:30','E05')


select * from TAlumno
go