DROP procedure IF EXISTS `inclui_novo_parametro`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_parametro` (vCodigo varchar(50),
vNome varchar(50), 
vSabor varchar(50), 
vTamanho varchar(50), 
vEmbalagem varchar(50),
vpreco decimal(10,2))
BEGIN
INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);
END$$

DELIMITER ;

call inclui_novo_parametro ('4000001', 'Sabor do Pantanal 1 Litro - Melancia', 
'Melancia', '1 Litro', 'PET', 4.67);

select * from tabela_de_produtos where CODIGO_DO_PRODUTO = '4000001'
