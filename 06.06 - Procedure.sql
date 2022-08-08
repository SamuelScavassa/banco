-- STORED PROCEDURE
--------------------

--Criar procedure para cadastrar produtos novos no BD
--------------------
use VendasBD
GO


CREATE PROCEDURE sp_cad_prod (@desc VARCHAR(50), @qtd int, @valor money, @status int)
AS
BEGIN
    INSERT into Produtos (descricao, qtd, valor, status)
    VALUES (@desc, @qtd, @valor, @status)
END
GO

exec sp_cad_prod 'Chocolate', 100, 10.20,1
GO

SELECT * from Pessoas
GO

SELECT * from Funcionarios
GO

CREATE PROCEDURE sp_cad_cli (@nome VARCHAR(50), @cpf VARCHAR(14), @status int, @renda money)
AS
BEGIN
    INSERT into Pessoas (nome, cpf, status)
    VALUES (@nome, @cpf, @status)

    INSERT into Clientes (pessoaId, renda, credito)
    VALUES (@@IDENTITY, @renda, @renda * 0.25) -- @@identity pega o último id gerado
END
GO

exec sp_cad_cli 'Samuel', '12345671237', 1, 2000
go

CREATE PROCEDURE sp_cad_funci (@nome VARCHAR(50), @cpf VARCHAR(14), @status int, @salario money)
AS
BEGIN
    INSERT into Pessoas (nome, cpf, status)
    VALUES (@nome, @cpf, @status)

    INSERT into Funcionarios (pessoaId, salario)
    VALUES (@@IDENTITY, @salario) -- @@identity pega o último id gerado
END
GO

exec sp_cad_funci 'Cleiton', '123461555', 1, 7000
go

CREATE PROCEDURE sp_cad_pedido (@status int, @idCli int, @idVend int)
AS
BEGIN
    INSERT into Pedidos (data, status, clienteId, funcionarioId)
    VALUES (getdate(), @status, @idCli, @idVend)
END
GO

EXEC sp_cad_pedido 1, 2, 7
GO

select * FROM Clientes

select * FROM Funcionarios

select * FROM Pedidos

CREATE PROCEDURE sp_cad_itemPedido (@idPed int, @idProd int, @qtde int)
AS
BEGIN
    -- Declavar uma var p/receber o valor do produto, sera consultado no BD
    DECLARE @valorItem money
    SELECT @valorItem = P.valor
    from Produtos P
    WHERE P.idProduto = @idProd

    INSERT into ItensPedidos (pedidoId, produtoId, valor, qtd)
    VALUES (@idPed, @idProd, @valorItem, @qtde)
END
GO

select * FROM Produtos

select * FROM Pedidos

select * FROM ItensPedidos


EXEC sp_cad_itemPedido 1008, 7, 20
GO

EXEC sp_cad_itemPedido 1008, 1009, 300
GO

CREATE PROCEDURE sp_baixarEstoque (@idPed int, @qtde int)
AS
BEGIN
    -- Declavar uma var p/receber o valor do produto, sera consultado no BD
    update Produtos set qtd = qtd - @qtde
    WHERE idProduto = @idPed and qtd >= @qtde
    RETURN @@rowcount -- Retorna o nº de linhas afetadas 
END
GO

EXEC sp_baixarEstoque 1, 300
GO

SELECT * From Produtos

CREATE PROCEDURE sp_atuEstoque (@idPro int, @qtdCompra int)
AS
BEGIN
    if @qtdCompra > 0
        UPDATE Produtos set qtd = qtd + @qtdCompra
        WHERE idProduto = @idPro
END
GO

EXEC sp_atuEstoque 2, 150
GO