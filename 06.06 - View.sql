--VIEWs 

use VendasBD
GO

select idProduto Codigo, descricao Produto, valor Preco, qtd Estoque
from Produtos
GO

CREATE VIEW v_produtos
as
    SELECT idProduto Codigo, descricao Produto, qtd Estoque, valor Preco,
    case status
        when 1 then 'Ativo'
        when 2 then 'Inativo'
        else 'Cancelado'
    end Situação
    FROM Produtos
GO

SELECT * FROM v_produtos

drop VIEW v_prods

CREATE VIEW v_Clientess
as
    SELECT P.idPessoa [Nr Cliente], P.nome Cliente, P.cpf CPF, 
           C.renda Renda, C.credito Credito,
        case P.status
            when 1 then 'Ativo'
            when 2 then 'Inativo'
            else 'Cancelado'
        end Situacao
    from Pessoas P, Clientes C
    where P.idPessoa = C.pessoaId
GO

select * from v_Vendedor 
go

CREATE VIEW v_Vendedor
as
    SELECT P.idPessoa [Nr Pessoa], P.nome Vendedor, P.cpf CPF, 
           V.salario Salario, V.supId supId,
        case P.status
            when 1 then 'Ativo'
            when 2 then 'Inativo'
            else 'Cancelado'
        end Situacao
    from Pessoas P, Funcionarios V
    where P.idPessoa = V.pessoaId
GO

CREATE VIEW v_Pedidoss
as
    SELECT Pe.idPedido Nr, Pe.data Data,
           vC.Cliente Cliente, vC.CPF CPF_Cliente,
           vV.Vendedor Vendedor, vV.CPF CPF,
           Pe.valor Total, 
        case Pe.status
            when 1 then 'Ativo'
            when 2 then 'Entregue'
            when 3 then 'Cancelado'
            else 'Pendente'
        end Situacao
    from Pedidos Pe, v_Clientess vC, v_Vendedor vV 
    where Pe.clienteId = vC.[Nr Cliente]
    and Pe.funcionarioId = vV.[Nr Pessoa]    
GO

select * from v_Pedidoss 
go

CREATE VIEW v_Itenss
as
    SELECT Itp.pedidoId Pedido, vP.Produto Produto,
           Itp.qtd Qtd_Vendida, Itp.valor Preço_unit,
           Itp.qtd * Itp.valor Subtotal  
        
    from ItensPedidos Itp, v_produtos vP
    where Itp.produtoId = vP.Codigo
        
GO

select * from v_Itenss
go
