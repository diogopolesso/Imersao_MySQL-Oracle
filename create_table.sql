use vendas_sucos;

create table produtos
(CODIGO varchar(10) not null,
DESCRITOR varchar(100) null,
SABOR varchar(50) null,
TAMANHO varchar(50) null,
EMBALAGEM varchar(50) null,
PRECO_LISTA float null,
primary key (CODIGO));

create table vendedores
(MATRICULA varchar(5) not null,
NOME varchar(100) null,
BAIRRO varchar(50) null,
COMISSAO float null,
DATA_ADMISSAO date null,
FERIAS bit(1) null,
primary key (MATRICULA));

create table vendas
(NUMERO varchar(5) not null,
DATA date null,
CPF varchar(11) null,
MATRICULA varchar(5) null,
IMPOSTO float null,
primary key (NUMERO));


/*  alterar nome de uma coluna numa tabela:*/

alter table vendas rename column DATA to DATA_VENDAS;

/* alterar o nome de uma tabela:*/

alter table vendas rename notas;


create table itens_notas
(NUMERO varchar(5) not null,
CODIGO varchar(10) not null,
QUANTIDADE int(11) null,
PRECO float null,
primary key (NUMERO, CODIGO));
