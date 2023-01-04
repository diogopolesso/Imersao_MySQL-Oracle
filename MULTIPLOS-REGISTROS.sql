/* Incluindo Múltiplos Registros - dentro de uma empresa é muito normal, 
às vezes eu estou criando um banco de dados e eu quero importar estes dados de um outro lugar. 
Aqui no caso eu vou importar de um outro banco mysql. 
Então a gente vai ver como é que a gente faz isso: */

use vendas_sucos;

select * from sucos_vendas.tabela_de_produtos;

select CODIGO_DO_PRODUTO as CODIGO, NOME_DO_PRODUTO as DESCRITOR,
EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA as PRECO_LISTA
from sucos_vendas.tabela_de_produtos;

/* Eu não quero que na seleção já venha produtos que eu já tenha a tabela aqui, então eu posso colocar: */

select CODIGO_DO_PRODUTO as CODIGO, NOME_DO_PRODUTO as DESCRITOR,
EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA as PRECO_LISTA
from sucos_vendas.tabela_de_produtos
where CODIGO_DO_PRODUTO not in (select CODIGO from produtos);

/* INSERT INTO: */

insert into produtos
select CODIGO_DO_PRODUTO as CODIGO, NOME_DO_PRODUTO as DESCRITOR,
SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA as PRECO_LISTA
from sucos_vendas.tabela_de_produtos
where CODIGO_DO_PRODUTO not in (select CODIGO from produtos);

/*OBS: a ordem TEM QUE SER igualzinha a ordem que eu tenho na tabela destino. */

insert into cliente 
select CPF, NOME, ENDERECO_1 as ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, 
DATA_DE_NASCIMENTO as DATA_NASCIMENTO, IDADE, SEXO, LIMITE_DE_CREDITO as LIMITE_CREDITO, 
VOLUME_DE_COMPRA as LIMITE_COMPRA, PRIMEIRA_COMPRA 
from sucos_vendas.tabela_de_clientes 
where CPF not in (select CPF from cliente);

