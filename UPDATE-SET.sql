/* Modificando Dados da Tabela com Update, 
O comando UPDATE modifica um dado já existente, 
e basicamente a gente dá update, o nome da tabela, 
o conjunto de campos que serão modificados com os seus novos valores e uma condição de filtro. */

update produtos set PRECO_LISTA = 5 where CODIGO = '1000889';

update produtos set DESCRITOR = 'Sabor da Montanha - 1 Litro - Uva', 
TAMANHO = '1 Litro', EMBALAGEM = 'PET' where CODIGO = '1000889';

/* modificação em lote ao mesmo tempo em vários registros, 
e isso somente depende do tipo de filtro que eu vou usar no where, 
então por exemplo, se eu fizer um select asterisco from produtos where sabor igual a maracujá, 
vamos ver quantos produtos eu tenho sabor maracujá. */

select * from produtos where SABOR = 'Maracujá';

/* "Precisamos aumentar em 10% os preços de lista dos produtos sabor maracujá 
porque a matéria-prima ficou mais cara, 
então foi uma decisão estratégica da empresa".*/

update produtos set PRECO_LISTA = PRECO_LISTA * 1.10 where SABOR = 'Maracujá';

/* Atualize o endereço do cliente com cpf 19290992743 
para R. Jorge Emílio 23 o bairro para Santo Amaro, 
a cidade para São Paulo, o estado para SP e o CEP para 8833223. */

select * from cliente where CPF = '19290992743';

update cliente set ENDERECO = 'R. Jorge Emílio 23', BAIRRO = 'Santo Amaro', 
CIDADE = 'São Paulo', CEP = '8833223' where CPF = '19290992743';
