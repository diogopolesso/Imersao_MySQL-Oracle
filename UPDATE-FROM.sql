/* Vamos pegar o campo DE_FERIAS da tabela de vendedores e colocar esses valores, 
alterar os valores do campo FERIAS da tabela de vendedores com aqueles valores da base fonte. */

select * from vendedores;

select * from sucos_vendas.tabela_de_vendedores;

/* Na tabela VENDEDORES eu tenho o campo matrícula com 3 digitos 
e na TABELA_DE_VENDEDORES do outro banco eu tenho o campo matrícula com dois zeros + 3 digitos. 
Esses dois zeros na TABELA_DE_VENDEDORES tem que ser tirado na hora que eu for fazer o join, 
e aí a função que eu uso é a função substring. */

select * from vendedores A 
inner join sucos_vendas.tabela_de_vendedores B 
on A.MATRICULA = substring(B.MATRICULA,3,3);

/* Eu pego update, o nome da tabela que eu quero modificar, VENDEDORES, que é a tabela A, aplico o inner join,
inner join com outra a tabela ou campo e aí eu coloco meu set, e depois o campo que vai ser modificados, no caso B.DE_FERIAS. */

update vendedores A inner join sucos_vendas.tabela_de_vendedores B 
on A.MATRICULA = substring(B.MATRICULA,3,3)
set A.FERIAS = B.DE_FERIAS;
