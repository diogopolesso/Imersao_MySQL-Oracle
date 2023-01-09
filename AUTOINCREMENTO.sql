/* Auto Incremento?
É um número sequencial que será incluído dentro dessa coluna de forma automática,
na medida em que eu vou dando INSERTS */

create table tab_identity (ID int auto_increment, DESCRITOR varchar(20), primary key(ID));

/* OBS: Só podemos ter apenas um campo AutoIncrement dentro de uma tabela, 
e nós podemos forçar o valor do AutoIncrement quando, então sim, mencionamos ele no Insert.
o campo auto incremento sempre deve fazer parte da chave primária da tabela */


/*  */

insert into tab_identity (DESCRITOR) values('cliente');
insert into tab_identity (DESCRITOR) values('cliente2');
insert into tab_identity (DESCRITOR) values('cliente3');

/* ou, EU posso mencionar o ID, e posso colocar aqui um Null que vai dar o mesmo reultado:  */

insert into tab_identity (ID, DESCRITOR) values(null, 'cliente4');
insert into tab_identity (ID, DESCRITOR) values(null, 'cliente5');


select * from tab_identity;

/* Deletando um cliente com ID = 5 (que seria o cliente5) e incluindo um cliente6 */

delete from tab_identity where ID = 5;
insert into tab_identity (ID, DESCRITOR) values(null, 'cliente6');

/* a estrutura Auto Incremento é uma estrutura do banco de dados chamada Sequência, 
então quando eu inseri o cliente cinco, ele internamente tem essa sequência salva, 
do um até o cinco, ele sabe que o próximo valor é o seis.
Eu apaguei da tabela o cinco, mas não importa, na hora que eu incluir, 
o campo é auto incremento, ele vai lá na estrutura sequência; quem é o próximo? É o seis. */

