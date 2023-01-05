/* Vamos pegar o campo DE_FERIAS da tabela de vendedores e colocar esses valores, 
alterar os valores do campo FERIAS da tabela de vendedores com aqueles valores da base fonte. */

select * from vendedores;

select * from sucos_vendas.tabela_de_vendedores;

select * from vendedores A 
inner join sucos_vendas.tabela_de_vendedores B 
on A.MATRICULA = substring(B.MATRICULA,3,3);

update vendedores A inner join sucos_vendas.tabela_de_vendedores B 
on A.MATRICULA = substring(B.MATRICULA,3,3)
set A.FERIAS = B.DE_FERIAS;
