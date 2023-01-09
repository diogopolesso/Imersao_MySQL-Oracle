/* TRIGGER É uma regra que é disparada no momento em que uma tabela sofre uma modificação nos seus dados, ou seja, uma inclusão, alteração ou exclusão. 
a regra que eu vou especificar para ser executada pela TRIGGER pode ser um ou mais comandos de SQL. 
E o gatilho eu digo no momento de definir a TRIGGER, eu digo se ela vai ser executada antes ou depois de um INSERT, UPDATE ou DELETE.*/

create table tab_faturamento
(DATA_VENDA date null,
TOTAL_VENDA float);

/* Tabelas Vazias no meu Banco de Dados: */

select * from tab_faturamento;
select * from notas;
select * from itens_notas;

/* INSERT INTO */

insert into notas (NUMERO, DATA_VENDAS, CPF, MATRICULA, IMPOSTO)
values ('0100', '2022-01-09', '1471156710', '235', 0.10);
insert into notas (NUMERO, DATA_VENDAS, CPF, MATRICULA, IMPOSTO)
values ('0101', '2022-01-09', '1471156710', '235', 0.10);

insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0100', '1000889', 100, 10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0100', '1002334', 100, 10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0101', '1000889', 100, 10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0101', '1002334', 100, 10);

/*  */



