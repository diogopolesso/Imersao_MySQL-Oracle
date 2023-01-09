/* Quando a gente cria um campo inteiro do tipo Auto Incremento, 
é como se eu tivesse determinado um padrão para aquele campo, 
caso ele não seja mencionado no Insert.
Podemos definir outros padrões para campos:*/

create table tab_padrão
(ID int auto_increment, 
DESCRITOR varchar(20),
ENDERECO varchar(100) null,
CIDADE varchar(50) default 'Rio de Janeiro',
DATA_CRIACAO timestamp default current_timestamp(),
primary key(ID));


/* Lembrando que timestamp = DATA/HORA/MIN/SEG e Função current_timestamp()= DATA/HORA DO COMPUTADOR*/

