/* "ERROR HANDLER" apresenta uma mensagem ao executar o comando ao invez da mensagem padrão do "Output" */

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inclui_novo_parametro`(vCodigo varchar(50),
vNome varchar(50), 
vSabor varchar(50), 
vTamanho varchar(50), 
vEmbalagem varchar(50),
vpreco decimal(10,2))
BEGIN
declare mensagem varchar(30);
declare exit handler for 1062
begin
set mensagem = 'Problema de Chave Primaria!';
select mensagem;
end;
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);
set mensagem = 'Produto Incluido com Sucesso!';
select mensagem;
END$$

DELIMITER ;
;

call inclui_novo_parametro ('4000002', 'Sabor do Pantanal 1 Litro - Melancia', 
'Melancia', '1 Litro', 'PET', 4.67);

-- RESULTADO: Produto Incluido com Sucesso!

-- AO TENTAR INSERIR O MESMO PRODUTO
-- O RESULTADO SERÁ: Problema de Chave Primaria!

