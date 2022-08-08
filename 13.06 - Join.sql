Use Vendas_Samuel
go

select C.id_pessoas
from CLientes as C
inner join Pessoas as P
on C.id_pessoas = P.id_pessoas
GO

---Tipos de Join's---
---INNER, LEFT, RIGHT, FULL, CROSS---

--SEM INNER JOIN--

select *
from Pessoas P, CLientes C
Where P.id_pessoas = C.id_pessoas
GO

--COM INNER--

Select *
from Pessoas P inner join CLientes C
on P.id_pessoas = C.id_pessoas
GO

--TODOS OS PEDIDOS DOS CLIENTES--

select *
from Pessoas P inner join CLientes C
on p.id_pessoas = c.id_pessoas
inner join Pedidos Pe
on Pe.id_cliente = c.id_pessoas
GO

--LEFT--

select * 
from Pessoas P left join Clientes C
on P.id_pessoas = C.id_pessoas
GO

SELECT * 
from Clientes C left join Pessoas P
on C.id_pessoas = P.id_pessoas
GO

select *
from Produtos Pr inner join Itens_pedidos Ip
on Pr.id_produto = Ip.id_produto
inner join Pedidos Pe on Ip.id_pedido = Pe.id_pedido
GO

--RIGHT JOIN--

SELECT * 
from Clientes C right join Pessoas P
on C.id_pessoas = P.id_pessoas
GO

--OUTER JOIN--

select * 
from Pessoas P full join Clientes C
on P.id_pessoas = C.id_pessoas
GO

--CROSS JOIN--


