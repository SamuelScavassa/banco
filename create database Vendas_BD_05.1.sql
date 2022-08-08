create database Vendas_Samuel
go

use Vendas_Samuel
go

create table Pessoas
(
    id_pessoas  int             not null    primary key identity,
    nome        varchar(50)     not null,
    cpf         varchar(14)     not null    unique,
    status      int,
    check       (status in (1, 2, 3, 4))
)
go

create table CLientes
(
    id_pessoas  int             not null    primary key references Pessoas,
    renda       decimal(10,2)   not null,
    credito     decimal(10,2)   not null,
    check       (renda >= 700),
    check       (credito >= 100)
)
go

create table Vendedores
(
    id_pessoas  int             not null    primary key references Pessoas,
    salario     decimal(10,2)   not null,
    check       (salario >= 1000)
)
go

create table Pedidos
(
    id_pedido   INT             NOT NULL primary KEY IDENTITY,
    data        DATETIME        NOT NULL,
    status      int,
    valor       decimal(10,2),
    id_cliente  INT             NOT NULL REFERENCES Clientes,
    id_vendedor INT             NOT NULL REFERENCES Vendedores,
    check       (status between 1 and 4),
    check       (valor > 0)
)
go

create table Produtos
(
    id_produto  INT             NOT NULL PRIMARY KEY IDENTITY,
    descricao   VARCHAR(10)     NOT NULL,
    estoque     INT             NOT NULL,
    valor       decimal(10,2)   NOT NULL,
    status      INT,
    CHECK       (status >= 1 and status <= 4),
    CHECK       (estoque >= 0),
    CHECK       (valor > 0)
)
go

/*deletar a tabela, cuidado e permanente*/
/*drop table Produtos
go
*/

CREATE TABLE Itens_pedidos
(
    id_pedido  int             NOT NULL REFERENCES Pedidos,
    id_produto  INT             NOT NULL REFERENCES Produtos,
    quantidade  INT             NOT NULL,
    valor       DECIMAL(10,2)   NOT NULL,
    CHECK       (quantidade > 0),
    PRIMARY KEY (id_pedido, id_produto) --chave primaria composta
)
go

insert into Pessoas values ('Dom Predro II','1111010', 1)
go

insert into Pessoas (nome, cpf, status) values ('Teresa Cristina', '1234999-66', 1)
go

insert into Pessoas VALUES ('Dom João VI','1115590', 1)  
go

insert into Pessoas VALUES ('Antonio','1879690', 1)
GO

insert into Pessoas VALUES ('Mariana','1876690', 2)
GO

select * from Pessoas
go

select * from Vendedores
go

select * from CLientes
go

select * from Pedidos
go

select * from Produtos
go

select * from Itens_pedidos
go


INSERT into CLientes (id_pessoas, renda, credito) VALUES 
    (2, 5500, 1900),
    (4, 4100, 1650)
go

INSERT into Vendedores (id_pessoas, salario) VALUES 
    (1, 2500),
    (3, 3300),
    (5, 7300)
GO

INSERT into Pessoas VALUES
    ('Samuel Melegatti', '56701566', 1),
    ('Thiago Regis', '56701336', 1)
GO

INSERT into CLientes (id_pessoas, renda, credito) VALUES 
    (6, 55000000, 1000000)
go

INSERT into Vendedores (id_pessoas, salario) VALUES 
    (7, 5000000)
GO

INSERT into Produtos values('lapis',100,1.5,1)
go

INSERT into Produtos(descricao, estoque, valor) VALUES ('Caneta',100,5,2)
go

INSERT into produtos VALUES
    ('Caderno',100,15,1),
    ('Borracha',100,3,1),
    ('Regua',100,5.5,1)
go

INSERT into Produtos values('Apontador',100,2.5,1)
go

INSERT into Pedidos ([data], id_cliente, id_vendedor) VALUES
    (GETDATE(), 2, 1),
    (GETDATE(), 6, 7),
    (GETDATE(), 4, 3)
GO

INSERT into pedidos(data,id_cliente,id_vendedor) VALUES
    (GETDATE(),4,5)
go

INSERT into Itens_pedidos VALUES
    (1,4,3,3),
    (1,5,40,5.5),
    (1,1,10,1.5)
GO

INSERT into pedidos(data,id_cliente,id_vendedor) VALUES
    (GETDATE(),2,3)
go

INSERT into Itens_pedidos VALUES
    (2,3,2,15),
    (2,4,5,3)
GO

Select id_pessoas, nome, cpf, status from Pessoas;
go

select * from Pessoas;
go

select nome, cpf from Pessoas;
go

select nome, status, cpf from Pessoas;

select * from Produtos where valor > 5; /* A partir da tabela produtos, traga os quais o valor é maior que 5 */
go

select * from Produtos where status = 2 or valor >= 5;
go

select * from Produtos where status = 2 and valor >= 5;
go

select * from Produtos where descricao = 'Caderno';
go

select * from Produtos where descricao like '%a%';
go

select * from Produtos where descricao like 'C%';
go

select * from Produtos where descricao like '_a_e%';
go

select * from Produtos where descricao like '%a';
go

select * from Produtos where descricao like '%s';
go

select * from Produtos;
go

select * from Produtos where valor between 3 and 10;
go

select * from Produtos where valor >=3 and valor <= 10;
go

insert into Produtos values ('Post-it', 100, 2, 2);
go

select descricao Produto, estoque 'Estoque dispinível' from Produtos;
go
/* Irá retornar uma tabela virtual substituindo o nome descricao por Produto e estoque por Estoque Disponível */

select descricao Produto, estoque [Estoque dispinível] from Produtos; /*Igual ao anterior*/
go

/* É possível fazer cálcuos com select */
select 58976.645 / 8326.65 * PI() resultado;

select SQRT(16)R;

select UPPER(descricao) Produto from Produtos;
go

select p.*, p.estoque * p.valor Faturamento from Produtos p;
go

update Produtos set status = 2 where id_produto = 2; /* DICA DO SÁBIO DA MAÇÃ */
go

select COUNT(*) [Nº produtos] from Produtos; /* Mostra o nº de produtos cadastrados */
go

select 
	AVG(valor) Média_Preço, 
	MAX(valor) Maior_Valor, 
	MIN(valor) Menor_valor, 
	COUNT(*) Quantidade_Produtos, 
	SUM(estoque) Soma_Estoque,
	SUM(estoque * valor) Total
from Produtos;
go

select * from Produtos where id_produto in (1,3,5);
go

select * from Produtos where id_produto = 1 or id_produto = 3 or id_produto = 5;
go

select sum(quantidade * valor) [Total pedido 1] from Itens_pedidos where id_pedido = 1;
go

select sum(quantidade * valor) 'Total pedido 2' from Itens_pedidos where id_pedido = 2;
go

select * from Itens_pedidos;
go

select Pessoas.nome, CLientes.id_pessoas, Pedidos.id_pedido, Pedidos.data 
from Pessoas, CLientes, Pedidos 
where Pessoas.id_pessoas = CLientes.id_pessoas
and CLientes.id_pessoas = Pedidos.id_cliente
go

select Pessoas.nome, Vendedores.id_pessoas, Pedidos.id_pedido, Pedidos.data 
from Pessoas, Vendedores, Pedidos 
where Pessoas.id_pessoas = Vendedores.id_pessoas
and Vendedores.id_pessoas = Pedidos.id_vendedor
go

select P.nome, C.id_pessoas, Pd.id_pedido, Pd.data
from Pessoas P, CLientes C, Pedidos Pd
where P.id_pessoas = C.id_pessoas
and C.id_pessoas = Pd.id_cliente
go

select P.nome, V.id_pessoas, Pd.id_pedido, Pd.data 
from Pessoas P, Vendedores V, Pedidos Pd
where P.id_pessoas = V.id_pessoas
and V.id_pessoas = Pd.id_vendedor
go

---Update---

update Produtos
set valor = 5.50
where Produtos.descricao = 'Caneta'
go

select * from Produtos
go

update Produtos
set estoque = 95, status = 2
where id_produto = 2
go

update Produtos
set estoque = estoque - 3
where id_produto = 2
go

update Produtos
set estoque = estoque - 40
where id_produto = 5

update Produtos
set estoque = estoque - 2
where id_produto = 3

update Produtos
set estoque = estoque - 10
where id_produto = 1

update Produtos
set estoque = estoque - 5
where id_produto = 4


select * from Itens_pedidos
go

update Pedidos
set status = 2, valor = 244
where id_pedido = 1
go

update Pedidos
set status = 2, valor = 45
where id_pedido = 2
go

select * from Pedidos
go

select sum(quantidade * valor)
from Itens_pedidos
where id_pedido = 1
go


update Pedidos set status = null, valor = null
go



update Pedidos	
set status = 2, 
	valor = 
	(
		select sum(quantidade * valor)
		from Itens_pedidos
		where id_pedido = 1
	)
where id_pedido = 1
go

update Pedidos	
set status = 2, 
	valor = 
	(
		select sum(quantidade * valor)
		from Itens_pedidos
		where id_pedido = 2
	)
where id_pedido = 2
go

insert into Produtos values ('Apagador', 10, 23, 1)
go

select * from Produtos
go

delete from Produtos where id_produto = 14
go

