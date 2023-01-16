--  Incluindo a venda

select f_cliente_aleatorio(); 
select f_produto_aleatorio();
select f_vendedor_aleatorio();

-- CREATE PROCEDURES:

DROP procedure IF EXISTS `p_inserir_venda`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_inserir_venda`(vData DATE, max_itens INT,
max_quantidade INT)
BEGIN
DECLARE vCliente VARCHAR(11);
DECLARE vProduto VARCHAR(10);
DECLARE vVendedor VARCHAR(5);
DECLARE vQuantidade INT;
DECLARE vPreco FLOAT;
DECLARE vItens INT;
DECLARE vNumeroNota INT;
DECLARE vContador INT DEFAULT 1;
DECLARE vNumItensNota INT;
SELECT MAX(numero) + 1 INTO vNumeroNota from notas_fiscais;
SET vCliente = f_cliente_aleatorio();
SET vVendedor = f_vendedor_aleatorio();
INSERT INTO notas_fiscais (CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO)
VALUES (vCliente, vVendedor, vData, vNumeroNota, 0.18);
SET vItens = f_numero_aleatorio(1, max_itens);
WHILE vContador <= vItens
DO
   SET vProduto = f_produto_aleatorio();
   SELECT COUNT(*) INTO vNumItensNota FROM itens_notas_fiscais
   WHERE NUMERO = vNumeroNota AND CODIGO_DO_PRODUTO = vProduto;
   IF vNumItensNota = 0 THEN
      SET vQuantidade = f_numero_aleatorio(10, max_quantidade);
      SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
      WHERE CODIGO_DO_PRODUTO = vProduto;
      INSERT INTO itens_notas_fiscais (NUMERO, CODIGO_DO_PRODUTO,
      QUANTIDADE, PRECO) VALUES (vNumeroNota, vProduto, vQuantidade, vPreco);
   END IF;
   SET vContador = vContador + 1;
END WHILE;

END$$

DELIMITER ;

call p_inserir_venda('2022-01-16', 3, 100); -- RESULTADO: Criou Uma Nova Venda

--CONSULTA:

select A.NUMERO, count(*) as NUMERO_ITENS, sum(B.QUANTIDADE * B.PRECO) as FATURADO
from notas_fiscais A inner join itens_notas_fiscais B
on A.NUMERO = B.NUMERO where A.DATA_VENDA = '20220116'
group by A.NUMERO;
