/* Incluindo Múltiplos Registros - dentro de uma empresa é muito normal, 
às vezes eu estou criando um banco de dados e eu quero importar estes dados de um outro lugar. 
Aqui no caso eu vou importar de um outro banco mysql. 
Então a gente vai ver como é que a gente faz isso: */

use vendas_sucos;

select * from sucos_vendas.tabela_de_produtos;

select CODIGO_DO_PRODUTO as CODIGO, NOME_DO_PRODUTO as DESCRITOR,
EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA as PRECO_LISTA
from sucos_vendas.tabela_de_produtos;
