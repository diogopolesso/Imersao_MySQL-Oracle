/* Se eu fizer isso, eu vou transferir todo o conteúdo 
que eu tenho na tabela de 'produto' para a tabela de 'produto2': */

insert into produtos2
select * from produtos;


/* Alterar tudo, todas as linhas num determinado campo: */

update produtos2 set PRECO_LISTA = 8; 

/* Note que nesse comando aqui update, 
eu não coloquei um WHERE. Isso significa que ele vai fazer essa alteração em toda a tabela. */

/* Apagar a tabela, apagar o conteúdo dela. */

delete from produtos2;

/* tomar cuidado realmente com qualquer delete, mas o delete from sem o WHERE, 
você vai perder tudo que você tem dentro da sua tabela e não tem como recuperar. */

/* Apaga a Tabela: */

drop table notas;
drop table itens_notas;

/* Apaga os Dados da Tabela: */

delete from notas;
delete from itens_notas;
