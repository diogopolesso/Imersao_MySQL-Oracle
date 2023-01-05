/* Se eu fizer isso, eu vou transferir todo o conteúdo 
que eu tenho na tabela de 'produto' para a tabela de 'produto2': */

insert into produtos2
select * from produtos;
