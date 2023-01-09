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

/* o SELECT para a gente saber o faturamento e a data do faturamento: */

insert into tab_faturamento
select A.DATA_VENDAS, sum(B.QUANTIDADE * B.PRECO) as TOTAL_VENDA from 
notas A inner join itens_notas B
on A.NUMERO = B.NUMERO 
group by A.DATA_VENDAS;

select * from tab_faturamento;

/* Lembrando: quando eu incluo uma venda nova eu tenho que apagagar a tabela de Faturamento e atualizar a tabela de faturamento: */

delete from tab_faturamento;
insert into tab_faturamento
select A.DATA_VENDAS, sum(B.QUANTIDADE * B.PRECO) as TOTAL_VENDA from 
notas A inner join itens_notas B
on A.NUMERO = B.NUMERO 
group by A.DATA_VENDAS;

/* A Forma Automática de fazer esses procedimentos quando for inserir dados na minha tabela através de TRIGGER : */

delete from itens_notas;
delete from notas;
delete from tab_faturamento;

delimiter //
create trigger TG_CALCULA_FATURAMENTO_INSERT after insert on itens_notas
for each row begin
	delete from tab_faturamento;
	insert into tab_faturamento
	select A.DATA_VENDAS, sum(B.QUANTIDADE * B.PRECO) as TOTAL_VENDA from 
	notas A inner join itens_notas B
	on A.NUMERO = B.NUMERO 
	group by A.DATA_VENDAS;
end//

/* DELIMITER // A criação de novos objetos é fundamental para personalizar seu banco de dados de modo que o mesmo passe a, 
não só armazenar dados, como a realizar ações próprias, necessárias para seus sistemas.
Objetos como triigers, stored procedures, views, etc tem como função, 
realizar este tipo de personalização dentro do seu SGBD. */

/* Vamos Inseri as notas: */ 

insert into notas (NUMERO, DATA_VENDAS, CPF, MATRICULA, IMPOSTO)
values ('0100', '2022-01-09', '1471156710', '235', 0.10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0100', '1000889', 100, 10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0100', '1002334', 100, 10);

/* Agora eu vou rodar o SELECT na TAB_FATURAMENTO. */ 

select * from tab_faturamento;

/* A TAB_FATURAMENTO passou a ter 2000. 
Quando eu dei o INSERT ele disparou a TRIGGER 
e ao disparar a TRIGGER ele apagou a tabela de faturamento e inseriu o valor TOTAL. */
