/* Modificando Dados da Tabela com Update, 
O comando UPDATE modifica um dado já existente, 
e basicamente a gente dá update, o nome da tabela, 
o conjunto de campos que serão modificados com os seus novos valores e uma condição de filtro. */

update produtos set PRECO_LISTA = 5 where CODIGO = '1000889';

update produtos set DESCRITOR = 'Sabor da Montanha - 1 Litro - Uva', 
TAMANHO = '1 Litro', EMBALAGEM = 'PET' where CODIGO = '1000889';
