create database Vendas_BD_05
go

use Vendas_BD_05
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