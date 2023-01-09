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

insert into notas (NUMERO, DATA_VENDAS, CPF, MATRICULA, IMPOSTO)
values ('0100', '2022-01-09', '1471156710', '235', 0.10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0100', '1000889', 100, 10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0100', '1002334', 100, 10);

insert into notas (NUMERO, DATA_VENDAS, CPF, MATRICULA, IMPOSTO)
values ('0101', '2022-01-09', '1471156710', '235', 0.10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0101', '1000889', 100, 10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0101', '1002334', 100, 10);

insert into notas (NUMERO, DATA_VENDAS, CPF, MATRICULA, IMPOSTO)
values ('0103', '2022-01-09', '1471156710', '235', 0.10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0103', '1000889', 100, 10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0103', '1002334', 100, 10);

insert into notas (NUMERO, DATA_VENDAS, CPF, MATRICULA, IMPOSTO)
values ('0104', '2022-01-09', '1471156710', '235', 0.10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0104', '1000889', 100, 10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0104', '1002334', 100, 10);

select * from tab_faturamento;
select * from notas;
select * from itens_notas;

/* Anteriormente só criamos trigger insert, agora vamso criar triggers para o after UPDATE e para o after DELETE: */

delimiter //
create trigger TG_CALCULA_FATURAMENTO_UPDATE after update on itens_notas
for each row begin
	delete from tab_faturamento;
	insert into tab_faturamento
	select A.DATA_VENDAS, sum(B.QUANTIDADE * B.PRECO) as TOTAL_VENDA from 
	notas A inner join itens_notas B
	on A.NUMERO = B.NUMERO 
	group by A.DATA_VENDAS;
end//

delimiter //
create trigger TG_CALCULA_FATURAMENTO_DELETE after delete on itens_notas
for each row begin
	delete from tab_faturamento;
	insert into tab_faturamento
	select A.DATA_VENDAS, sum(B.QUANTIDADE * B.PRECO) as TOTAL_VENDA from 
	notas A inner join itens_notas B
	on A.NUMERO = B.NUMERO 
	group by A.DATA_VENDAS;
end//

/* TRIGGER INSERT, DELETE e UPDATE */

insert into notas (NUMERO, DATA_VENDAS, CPF, MATRICULA, IMPOSTO)
values ('0106', '2022-01-09', '1471156710', '235', 0.10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0106', '1000889', 100, 10);
insert into itens_notas (NUMERO, CODIGO, QUANTIDADE, PRECO) 
values ('0106', '1002334', 100, 10);

select * from tab_faturamento;

delete from itens_notas where NUMERO = '0106' and CODIGO = '1002334';

select * from itens_notas;

update itens_notas set 	QUANTIDADE = 400 where NUMERO = '0100' and CODIGO = '1002334';
