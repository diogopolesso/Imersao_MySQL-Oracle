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
