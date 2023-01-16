create table defalt_table (ID integer, NOME varchar(100)); -- Se eu não informar nada para a minha tabela qual mecanismo de armazenamento eu quero operar, ela ira criar automaticamente um Mecanismo de Armazenamento InnoDB por padrão.

alter table defalt_table engine = MyISAM; -- Estou alterando minha tabela para um Mecanismo de Armazenamento MyISAM.

create table defalt_table2 (ID integer, NOME varchar(100)) engine = MEMORY; -- Estou criando uma Tabela e informando na criação que o tipo de Memoria de Armazenamento vai ser MEMORY.

