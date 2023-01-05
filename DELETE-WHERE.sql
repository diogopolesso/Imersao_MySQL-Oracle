INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
     VALUES ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50),
         ('1001000','Sabor dos Alpes 700 ml - Melão','Melão','700 ml','Garrafa',7.50),
         ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50),
         ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50),
         ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50),
         ('1001005','Sabor dos Alpes 700 ml - Açai','Açai','700 ml','Garrafa',7.50),
         ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50),
         ('1001007','Sabor dos Alpes 1 Litro - Melão','Melão','1 Litro','Garrafa',7.50),
         ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50),
         ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50),
         ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50),
         ('1001011','Sabor dos Alpes 1 Litro - Açai','Açai','1 Litro','Garrafa',7.50);
         
select * from produtos where substring(DESCRITOR,1,15) = 'Sabor dos Alpes';

/* Para excluir um produto específico basta colocarmos a condição: */

delete from produtos where CODIGO = '1001000';

/* E para excluir todos os produtos 'Sabor dos Alpes' do tamanho um '1 litro': */

delete from produtos where TAMANHO =  '1 Litro'
and substring(DESCRITOR,1,15) = 'Sabor dos Alpes';

/* Exclusão usando como base o conteúdo de uma outra tabela: */

select CODIGO_DO_PRODUTO from sucos_vendas.tabela_de_produtos;

/* vamos listar uma série de produtos que são os produtos que existem na 
tabela_de_produtos mas não existem na tabela produtos do outro banco: */

select CODIGO from produtos 
where CODIGO not in (select CODIGO_DO_PRODUTO from sucos_vendas.tabela_de_produtos);

delete from produtos 
where CODIGO not in (select CODIGO_DO_PRODUTO from sucos_vendas.tabela_de_produtos);

/* agora as duas tabelas estão sincronizadas, e estão com os valores iguais. */
