/* 'Relatório sobre vendas válidas e inválidas ao gerente de vendas para que possa ser analisado 
se o parâmetro de volume de compras está sendo considerado durante as negociações com os clientes.' */

SELECT * FROM ITENS_NOTAS_FISCAIS;
SELECT * FROM NOTAS_FISCAIS;

select *from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO;

/* Consulta com Vendas de Clientes por Mês: */

select NF.CPF, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO,
sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS from notas_fiscais NF
inner join itens_notas_fiscais INF on NF.NUMERO = INF.NUMERO
GROUP BY NF.CPF, date_format(NF.DATA_VENDA, '%Y-%m');

/* Limite de Compra por Cliente: */

select * from tabela_de_clientes TC;
select TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA as QUANTIDADE_LIMITE
from tabela_de_clientes TC;

select X.CPF, X.NOME, X.MES_ANO, X.QUANTIDADE_VENDAS, X.QUANTIDADE_LIMITE, 
CASE WHEN(X.QUANTIDADE_LIMITE - X.QUANTIDADE_VENDAS) < 0 THEN 'INVÁLIDA' 
ELSE 'VÁLIDA' end as STATUS_VENDA 
from(
select NF.CPF, TC. NOME, date_format(NF.DATA_VENDA, '%Y-%m') as MES_ANO,
sum(INF.QUANTIDADE) as QUANTIDADE_VENDAS, 
max(TC.VOLUME_DE_COMPRA) as QUANTIDADE_LIMITE from notas_fiscais NF
inner join itens_notas_fiscais INF
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes TC 
on TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, date_format(NF.DATA_VENDA, '%Y-%m')) X;

/* RELATÓRIO DE VENDAS POR SABOR: */

/* Quantidade Vendida por Sabor Ano 2016 */
select TP.SABOR, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from TABELA_DE_PRODUTOS TP 
inner join ITENS_NOTAS_FISCAIS INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join NOTAS_FISCAIS NF on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)
order by sum(INF.QUANTIDADE) desc;

/* Quantidade Total de 2016*/
select YEAR(NF.DATA_VENDA) as ANO, SUM(INF.QUANTIDADE) as QUANTIDADE from 
TABELA_DE_PRODUTOS TP 
inner join ITENS_NOTAS_FISCAIS INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join NOTAS_FISCAIS NF on NF.NUMERO = INF.NUMERO
where YEAR(NF.DATA_VENDA) = 2016
group by YEAR(NF.DATA_VENDA)


/* Quantidade Total com Participação */
select VENDA_SABOR.SABOR, VENDA_SABOR.ANO, VENDA_SABOR.QUANTIDADE, 
round((VENDA_SABOR.QUANTIDADE/VENDA_TOTAL.ANO) * 100, 2) as PARTICIPAÇÃO 
from
(select TP.SABOR, year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from TABELA_DE_PRODUTOS TP 
inner join ITENS_NOTAS_FISCAIS INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join NOTAS_FISCAIS NF on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by TP.SABOR, year(NF.DATA_VENDA)) as VENDA_SABOR
inner join
(select year(NF.DATA_VENDA) as ANO, sum(INF.QUANTIDADE) as QUANTIDADE 
from TABELA_DE_PRODUTOS TP 
inner join ITENS_NOTAS_FISCAIS INF on TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
inner join NOTAS_FISCAIS NF on NF.NUMERO = INF.NUMERO
where year(NF.DATA_VENDA) = 2016
group by year(NF.DATA_VENDA)) as VENDA_TOTAL
on VENDA_SABOR.ANO = VENDA_TOTAL.ANO
order by VENDA_SABOR.QUANTIDADE desc;


