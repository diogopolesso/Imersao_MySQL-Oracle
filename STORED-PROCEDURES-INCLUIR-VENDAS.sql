--  Incluindo a venda

select f_cliente_aleatorio(); 
f_produto_aleatorio();
f_vendedor_aleatorio();

-- CREATE PROCEDURES:

DROP procedure IF EXISTS `p_inserir_venda`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `p_inserir_venda` (vData date, max_itens int, max_quantidade int)
BEGIN
	declare vCliente varchar(11);
    declare vProduto varchar(10);
    declare vVendedor varchar(5);
    declare vQuantidade int;
    declare vPreco float;
    declare vItens int;
    declare vNumeroNota int;
    select max(numero) + 1 into vNumeroNota from notas_fiscais;
    set vCliente = f_cliente_aleatorio();
    set vVendedor = f_vendedor_aleatorio();
    insert into notas_fiscais (CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO)
    values (vCliente, vVendedor, vData, vNumeroNota, 0.18);
    set vItens = f_numero_aleatorio(10, max_itens);
    while vContador <= vItens
    DO
		SET vProduto = f_produto_aleatorio();
        SET vQuantidade = f_numero_aleatorio(10, max_quantidade);
        select PRECO_DE_LISTA into vPreco from tabela_de_produtos
        where CODIGO_DO_PRODUTO = '1000889';
        insert into itens_notas_fiscais (NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO)
        values (vNumeroNota, vProduto, vQuantidade, vPreco);
        select vContador = vContador + 1;
END WHILE;

END$$

DELIMITER ;

call p_inserir_venda('20220116', 3, 100); -- RESULTADO = 
