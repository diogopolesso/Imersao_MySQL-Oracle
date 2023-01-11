-- Controle de Fluxo  "IF/THEN/ ELSEIF".

IF condition THEN
  if_stantements;
ELSEIF
  elseif_stantements;
ELSEIF
  elseif_stantements;
(....)
ELSE
  else_stantements;
END IF


-- EXEMPLO:

DROP procedure IF EXISTS `achar_status_preco`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `achar_status_preco` (vProduto varchar(50))
BEGIN
declare vPreco float;
declare vMensagem varchar(30);
select PRECO_DE_LISTA into vPreco from tabela_de_produtos where CODIGO_DO_PRODUTO = vProduto;
IF vPreco >= 12 THEN
	set vMensagem = 'Produto Caro!';
ELSEIF vPreco >= 7 and vPreco < 12 THEN
	set vMensagem = 'Produto Em Conta!';
ELSE 
	set vMensagem = 'Produto Barato!';
END IF;
	select vMensagem;
END$$

DELIMITER ;

call call achar_status_preco('1000889'); --RESULTADO = Produto Barato!

call call achar_status_preco('1086543'); --RESULTADO = Produto Em Conta!

call call achar_status_preco('326779'); --RESULTADO = Produto Caro!
