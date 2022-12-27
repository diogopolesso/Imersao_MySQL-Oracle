=>  Relatório sobre vendas válidas e inválidas ao gerente de vendas para que possa ser analisado 
se o parâmetro de volume de compras está sendo considerado durante as negociações com os clientes. <=

SELECT * FROM ITENS_NOTAS_FISCAIS;
SELECT * FROM NOTAS_FISCAIS;

SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');
