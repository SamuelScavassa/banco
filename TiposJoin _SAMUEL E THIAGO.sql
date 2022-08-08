-----------------------------------------------
-- Nome Aluno 1: Samuel Melegatti Scavassa
-- Nome Aluno 2: Thiago de Carvalho Regis
-- Curso: ADS - FATEC 2022-1
-- Per�odo: 3º SEMESTRE
-- Disciplina: BANCO DE DADOS
-----------------------------------------------

-----------------------------------------------
-- TIPOS DE JOINS
-----------------------------------------------

-----------------------------------------------
-- criar um data base: novo banco de dados
-----------------------------------------------
create database TiposJoins
go

-----------------------------------------------
-- usar o Banco de Dados
-----------------------------------------------
use tiposJoins
go

-----------------------------------------------
-- criar uma tabela departamento
-----------------------------------------------
create table Departamentos
(
	idDepto		int	not null primary key identity,
	nome		varchar(50) not null
)

-----------------------------------------------
-- inserir os departamentos na tabela
-----------------------------------------------
insert into Departamentos
values		('RH'),
		('MKT'),
		('Vendas'),
		('Compras'),
		('Contas a Pagar'),
		('Contas a Receber')
go

select * from Departamentos
go

-----------------------------------------------
-- criar uma tabela funcion�rios e relacionar 
-- com a tabela departamentos 
-----------------------------------------------
create table Funcionarios
(
	idFunc		int		not null 	primary key identity,
	nome		varchar(50)	not null,
	depId		int		references Departamentos -- FK
)
go

-----------------------------------------------
-- inserir funcion�rios e relacion�-los com os 
-- departamentos
-----------------------------------------------
insert into funcionarios
values		('Valeria', 3),
		('Ricardo', null),
		('Maria Antonia', 1),
		('Cleonice', 2),
		('Miguel', 1),
		('Walter', 6)
go


insert into funcionarios
values		('Andre', Null)
go

select * from funcionarios
go

-----------------------------------------------
-----------------------------------------------
-- INNER JOIN, LEFT JOIN, RIGTH JOIN, FULL JOIN
-----------------------------------------------
-----------------------------------------------

-----------------------------------------------
-- 1) Selecionar os dados dos Funcion�rios
-- e Departamentos que os funion�rios 
-- pertencem sem usar join
-----------------------------------------------

select *
from Funcionarios F, Departamentos D
where F.depId = D.idDepto
GO


-----------------------------------------------
-- 2) Selecionar os dados dos Funcion�rios
-- e Departamentos que os funion�rios 
-- pertencem usando join
-----------------------------------------------

select *
from Funcionarios F inner join Departamentos D
on F.depId = D.idDepto
GO


-----------------------------------------------
-- 3) Consultar todos os departamentos e 
-- trazer os funcion�rio que est�o 
-- relacionados com os departamentos e os 
-- epartamentos sem funcion�rios relacionados
-----------------------------------------------

SELECT * 
from Departamentos D LEFT JOIN Funcionarios F
on  F.depId= D.idDepto
GO

-----------------------------------------------
-- 4) Consultar todos os funcion�rios e trazer 
-- os departamentos que est�o relacionados com 
-- os funcion�rios e os funcion�rios sem
-- departamentos relacionados
-----------------------------------------------

"""SELECT *
from Funcionarios F inner join Departamentos D
on F.depId = D.idDepto
INNER JOIN Funcionarios Fe
on Fe.depId is null
GO"""

SELECT *
from Funcionarios F left join Departamentos D
on F.depId = D.idDepto
GO


-------------------------------------------
-- 5) Consultar os funcion�rios que percentem 
-- a um departamento e os departamentos sem 
-- fucion�rios
-----------------------------------------------

SELECT *
from Funcionarios F right join Departamentos D
on F.depId = D.idDepto
GO


-----------------------------------------------
-- 6) Consultar os departamentos com funcion�rios 
-- e os funcion�rios sem departamento
-----------------------------------------------

SELECT *
from Departamentos D right join Funcionarios F
on F.depId = D.idDepto
GO

-----------------------------------------------
-- cross join
-----------------------------------------------
select *
from funcionarios
cross join departamentos
