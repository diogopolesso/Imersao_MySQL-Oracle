/* Quando a gente cria um campo inteiro do tipo Auto Incremento, 
é como se eu tivesse determinado um padrão para aquele campo, 
caso ele não seja mencionado no Insert.
Podemos definir outros padrões para campos:*/

create table tab_padrao
(ID int auto_increment, 
DESCRITOR varchar(20),
ENDERECO varchar(100) null,
CIDADE varchar(50) default 'Rio de Janeiro',
DATA_CRIACAO timestamp default current_timestamp(),
primary key(ID));

/* OBS: Lembrando que timestamp = DATA/HORA/MIN/SEG e Função current_timestamp()= DATA/HORA DO COMPUTADOR 
O campo CIDADE, ele tem como Default 'Rio de Janeiro', se eu não falar nada durante o Insert, o valor a ser colocado será 'Rio de Janeiro' */

insert into tab_padrao (DESCRITOR, ENDERECO, CIDADE, DATA_CRIACAO)
values ('Cliente X', 'Rua Projetadas A', 'São Paulo', '2022-01-09');

select * from tab_padrao;

/* Eu não coloquei nada sobre endereço, sobre cidade e sobre data da criação: */

insert into tab_padrao (DESCRITOR) values ('Cliente Y');

/* não sendo mencionado no Insert valores para estes três campos, 
uma SQL vai colocar na tabela os valores padronizados que foram colocados durante a criação da tabela. */
