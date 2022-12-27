/* 'Relatório sobre vendas válidas e inválidas ao gerente de vendas para que possa ser analisado 
se o parâmetro de volume de compras está sendo considerado durante as negociações com os clientes.' */

SELECT * FROM ITENS_NOTAS_FISCAIS;
SELECT * FROM NOTAS_FISCAIS;

select *from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO;

/* Consulta com Vendas de Clientes por Mês */

select NF.CPF, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO,
sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS from notas_fiscais NF
inner join itens_notas_fiscais INF on NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, date_format(NF.DATA_VENDA, '%Y-%m');





