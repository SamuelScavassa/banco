use Vendas_Samuel
GO

create procedure sp_cad_clie (@nome varchar(50), @cpf varchar(14), @status int, @renda decimal(10,2), @credito decimal(10,2))
AS	
begin
	insert into Pessoas (nome, cpf, status)
	values (@nome, @cpf, @status)	

	insert into CLientes (id_pessoas, renda, credito)
	values (@@IDENTITY, @renda, @credito)
end
go

exec sp_cad_clie 'Samuel', '15555555555', 1, 5000, 2000
go

select * from Produtos
select * from Itens_pedidos
go

create procedure sp_cad_produ (@desc varchar(10), @estoque int, @valor decimal (10,2), @status int)
AS
BEGIN
	insert into Produtos (descricao, estoque, valor, status)
	values (@desc, @estoque, @valor, @status)
END
GO

exec sp_cad_produ 'Notebook', 50, 30000, 1
GO

drop procedure sp_cad_itemPed
go

create procedure sp_cad_itemPed (@idped int, @idprod int, @quant int)
AS
begin 
	declare @valoritem money
	select @valoritem =P.valor
	from Produtos P
	where P.id_produto = @idped

	insert into Itens_pedidos(id_pedido, id_produto, quantidade, valor)
	values (@idped, @idprod, @quant, @valoritem * @quant)

	update Produtos
	set estoque = estoque - @quant
	where id_produto = @idprod and @quant > 0	
end
go

exec sp_cad_itemPed 2,1,10

create view v_prod
as
	select P.descricao NOME, P.estoque ESTOQUE, P.valor VALOR, P.valor*P.estoque MONTANTE,	
	case P.status
		when 1 then 'Ativo'
		when 2 then 'Inativo'
		else 'Cancelado'
	end Situacao
	from Produtos P
GO

select * from v_prod
go

create view v_clientes
as
	select P.nome NOME, P.cpf CPF, C.renda SALÁRIO, C.credito CRÉDITO,
	case P.status
		when 1 then 'ATIVO'
		when 2 then 'INATIVO'
		else 'CANCELADO'
		end SITUAÇÃO
	from Pessoas P, CLientes C
	where P.id_pessoas = C.id_pessoas
GO

select * from v_clientes
go

create view v_comic
as
	
	select P.nome NOME, P.cpf CPF, V.salario SALÁRIO,
	case P.status
		when 1 then 'ATIVO'
		when 2 then 'INATIVO'
		else 'CANCELADO'
	end SITUAÇÃO, Pe.valor * 0.1 as COMIÇÃO
	from Pessoas P, Vendedores V, Pedidos Pe
	where P.id_pessoas = V.id_pessoas 
	and Pe.id_vendedor = V.id_pessoas
	and Pe.valor > 0
	
GO

select * from v_comic order by NOME
go

create procedure sp_cad_vend (@nome varchar(50), @cpf varchar(14), @status int, @salario decimal(10,2))
as
begin
	insert into Pessoas (nome, cpf, status)
	values (@nome, @cpf, @status)

	insert into Vendedores(id_pessoas, salario)
	values(@@IDENTITY, @salario)
end
GO

exec sp_cad_vend 'Pedro Antônio', '141414141414', 2, 6000
go

select * from v_vend
go

select P.nome CLIENTES
from Pessoas P inner join CLientes C
on P.id_pessoas = C.id_pessoas
GO

select P.nome NOMES, V.salario 'SALÁRIO VENDEDOR'
from Pessoas P left join Vendedores V
on p.id_pessoas = v.id_pessoas
go

select P.nome NOMES, C.renda RENDA
from CLientes C right join Pessoas P
on P.id_pessoas = C.id_pessoas and P.nome like 'S%'
GO

select P.nome NOMES, C.renda RENDA
from CLientes C inner join Pessoas P
on P.id_pessoas = C.id_pessoas and C.renda is not null order by P.nome 
GO

exec sp_cad_vend 'Pedro F', '141414141418', 2, 6000
go
exec sp_cad_clie 'Pedro G', '141414141416',2 ,6000, 2000
go

select * from CLientes
GO

Select P.nome from Pessoas P group by P.nome having P.nome like 'A%'
GO

select max(salario) AS salario from Vendedores 
go