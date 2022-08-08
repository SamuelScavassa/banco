CREATE DATABASE Vendas_BDINFOMProf
GO

use Vendas_BDINFOMProf
go

create table Pessoas
(
    idPessoa    INT             not null        PRIMARY KEY     IDENTITY,
    nome        VARCHAR(50)     not null,
    cpf         VARCHAR(14)     not null       unique,
    status      INT                 null,
    CHECK       (status in (1,2,3,4))
)
GO

CREATE TABLE Clientes
(
    pessoa_id   INT     not null    PRIMARY KEY     REFERENCES pessoas,
    renda       DECIMAL(10,2)   not null,
    credito     decimal(10,2)   not null,
    CHECK       (renda >= 700),
    check       (credito >= 100)
)
go

-- Comando que consulta o dicionário de dados da tabela
EXECUTE sp_help Clientes
go

CREATE TABLE Vendedores
(
    pessoa_id   INT             not null    PRIMARY KEY     REFERENCES pessoas,
    salario     DECIMAL(10,2)   not null,
    check       (salario >= 1000)
)
go

CREATE TABLE Pedidos
(
    idPedido    INT         not NULL    PRIMARY KEY IDENTITY,
    data        DATETIME    NOT null, 
    status      int,
    valor       DECIMAL(10,2),
    cliente_id  INT         not null    REFERENCES Clientes,
    vendedor_id INT         not NULL    REFERENCES Vendedores,
    CHECK       (status between 1 and 4),
    CHECK       (valor > 0)
)
go

CREATE TABLE Produtos
(
    idProduto   INT             not NULL    PRIMARY key     IDENTITY,
    descricao   VARCHAR(100)    NOT NULL,
    qtd         INT                 null,
    valor       decimal(10,2),
    status      int,
    CHECK       (qtd >= 0),
    CHECK       (valor > 0),
    CHECK       (status >= 1 and status <= 2) -- 1 ativo, 2 inativo
)
go

CREATE TABLE Itens_Pedidos
(
    pedido_id   INT     not null    REFERENCES Pedidos,
    produto_id  INT     not NULL    REFERENCES Produtos,
    qtd         int     not null,
    valor       decimal(10,2)   NOT null,
    CHECK       (qtd > 0),
    CHECK       (valor >0),
    PRIMARY KEY (pedido_id, produto_id)
)
go