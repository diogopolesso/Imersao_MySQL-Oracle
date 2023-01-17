/* COMANDOS no WORKBENCH: */

SELECT --'SELECIONAR'
* --'o asterisco indica que você deseja mostrar todos os campos'
FROM --'A PARTIR DE'
USE --'USE'
END --'FIM'

AND -- 'E' 'mostra um registro se ambas as condições forem verdadeiras' 'EX.: V COM V = V, V COM F = F, F COM V = F, F COM F = F'

OR --'OU' 'mostra um registro se pelo menos uma das condições for verdadeira' 'EX.: V COM V = V, V COM F = V, F COM V = V, F COM F = F'

NOT -- 'é a negação de uma expressão (inverte seu estado lógico)'. 'EX.: V COM V = F, V COM F = V, F COM V = V, F COM F = V' 'AND, OR e NOT são usados para filtrar registros baseados em mais de uma condição'.

IN --'CONTIDO'
LIKE --'%...' "usado para representar qualquer registro genérico que venha antes ou depois do texto que estamos procurando. % é um caractere curinga em determinado trecho de uma strings, varchar e char, equivalente ao * quando manipulamos arquivos."

CREATE DATABASE --'CRIAR UM BANCO DE DADOS'
DROP DATABASE --'DELETAR UM BANCO DE DADOS'
INSERT INTO ...
UPDATE ... SET
WHERE ... --'serve para informar ao servidor de banco de dados MySQL exatamente quais resultados lhe interessa obter'
DELETE FROM ...
ALTER TABLE ... --'ALTERAR TABELA'
ADD PRIMARY KEY() --'ADICIONA UMA CHAVE PRIMARIA'
ADD COLUMN()
LIMIT --' limita a saída de dados. O número que colocamos depois de LIMITdirá quantas linhas serão exibidas.'

AS ALIASES --'ALIAS'

BETWEEN --'permite selecionar intervalos de dados ao retornar os resultados de uma consulta. (ex.: retornar registros cujos preços estejam entre dois valores distintos, ou registros contidos dentro de um intervalo de datas especificado)'.

DISTINCT --'distinto, diferente. retorna somente linhas com valores diferentes e vamos usá-lo depois do SELECT e antes da exibição dos campos.'

ORDER BY --'Apresenta o resultado da consulta ordenado pelo campo determinado'
DESC --'Altera a ordem do' ORDER BY 'MAIOR PARA O MENOR'
ASC --'Altera a ordem do' ORDER BY 'MENOR PARA O MAIOR'

GROUP BY --'apresenta o resultado agrupando valores numéricos por uma chave de critério'
SUM --'SOMA'
MAX --'MÁXIMO'
MIN --'MÍNIMO'
AVG --'MÉDIA'
COUNT --'CONTA OCORRÊNCIAS'

HAVING --'APLICA O RESULTADO DE UMA AGRAGAÇÃO'

CASE --'serve para se fazer testes em um ou mais campos e, quando determinada condição for atendida, então seguiremos por um caminho, senão continuamos por outro.'  'CASE VEM ACOMPANHADO DOS TERMOS:'
WHEN --'QUANDO'
THEN --'ENTÃO'
ELSE --'SENÃO' 'é executado, funcionando como desvio para um outro valor já estabelecido'

JOIN --'permitem unir duas ou mais tabelas dentro de uma única consulta SQL. Basta que essas tabelas tenham um campo em comum.'

TIPOS DE JOIN:

INNER JOIN --'buscar a intersecção entre as tabelas, Ou seja, resulta em uma tabela que traz os valores que estão em ambas as tabelas iniciais.'

SELECT * FROM tabela_de_vendedores A INNER JOIN notas_fiscais B ON A.MATRICULA = B.MATRICULA;

SELECT A.MATRICULA, A.NOME, COUNT(*) FROM tabela_de_vendedores A INNER JOIN notas_fiscais B
ON A.MATRICULA = B.MATRICULA GROUP BY A.MATRICULA, A.NOME;

SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA)

LEFT JOIN --'Resulta em uma tabela que exibe somente os itens da tabela da esquerda, incluindo os itens em interseção com a tabela direita. Contudo, exclui da relação o resto da tabela da direita.'

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A LEFT JOIN notas_fiscais B ON A.CPF = B.CPF WHERE B.CPF IS NULL;

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A LEFT JOIN notas_fiscais B ON A.CPF = B.CPF 
WHERE B.CPF IS NULL AND YEAR (B.DATA_VENDA) = 2015;

RIGHT JOIN --'mesma lógica do LEFT, só que para a outra tabela. Pega os dados completos da tabela da direita, incluindo os que também estão na tabela da direita.'

SELECT DISTINCT A.CPF, A.NOME, B.CPF FROM tabela_de_clientes A RIGHT JOIN notas_fiscais B ON A.CPF = B.CPF 
WHERE B.CPF IS NULL AND YEAR (B.DATA_VENDA) = 2015;

SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME FROM tabela_de_vendedores right JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

FULL JOIN --'comando para pegar todos os valores das duas tabelas e unir em uma única resultante. É como pegar todos os produtos vendidos nas duas lojas da empresa e juntar todos esses registros para facilitar o controle ou a manipulação geral, por exemplo.'



CROSS JOIN --'executa uma operação mais complexa, em que todos os itens de uma tabela estarão associados a cada item da outra. '

SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME FROM tabela_de_vendedores, tabela_de_clientes;

UNION --'Faz a união de uma ou mais tabelas.'
UNION ALL --'Não se aplica o DISTINCT sobre o resultado final de uma consulta.'

SELECT DISTINCT BAIRRO FROM tabela_de_clientes UNION SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' AS TIPO FROM tabela_de_clientes UNION SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO FROM tabela_de_vendedores;

SELECT DISTINCT BAIRRO, NOME, 'CLIENTE' AS TIPO_CLINTE, CPF FROM tabela_de_clientes UNION
SELECT DISTINCT BAIRRO, NOME, 'VENDEDOR' AS TIPO_VENDEDOR, MATRICULA FROM tabela_de_vendedores;

SELECT tabela_de_vendedores.BAIRRO, 
tabela_de_vendedores.NOME, DE_FERIAS, 
tabela_de_clientes.BAIRRO, 
tabela_de_clientes.NOME FROM tabela_de_vendedores LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO,
tabela_de_vendedores.NOME, DE_FERIAS,
tabela_de_clientes.BAIRRO,
tabela_de_clientes.NOME FROM tabela_de_vendedores RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;


-- SUBCONSULTAS:

SELECT CPF, COUNT(*) FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF
HAVING COUNT(*) > 2000

-- SUBCONSULTA EQUIVALENTE:
  
SELECT X.CPF, X.CONTADOR FROM 
 (SELECT CPF, COUNT(*) AS CONTADOR FROM notas_fiscais
 WHERE YEAR(DATA_VENDA) = 2016
 GROUP BY CPF) X WHERE X.CONTADOR > 2000
 
 VIEWS -- VISÃO 'é uma tabela lógica, resultado de uma consulta. úteis quando precisamos disponibilizar parte do nosso banco de dados para uma pessoa externa,  pois criamos uma tabela lógica com limites que garantam a segurança das informações e concedemos acesso somente a essa visão.'
 
SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO 
FROM tabela_de_produtos A INNER JOIN vw_maiores_ambalagens X ON A.EMBALAGEM = X.EMBALAGEM;

-- TRANCAR E LIBERAR UM BANCO DE DADOS PARA BACKUP:

lock instance for backup; -- Tranca o Banco
unlock instance; -- Destranca o Banco

/* Comando explain, me dá o plano de execução da consulta, é como se fosse um pré-planejamento do que o MySQL vai fazer para resolver aquela consulta, 
independente do plano de execução que eu vou estar seguindo, eu posso tomar algumas atitudes em termos de performance do eu banco, 
para que as minhas consultas fiquem de uma certa maneira, um pouco mais rápidas. */

explain select A.NOME_DO_PRODUTO from tabela_de_produtos A; 
-- RESULTADO = 	PLANO DE EXECUÇÃOE EM FORMATO DE TABELA	

-- OR

explain format=json select A.NOME_DO_PRODUTO from tabela_de_produtos A; 
-- RESULTADO = PLANO DE EXECUÇÃOE EM FORMATO JSON
{
   "query_block": {
     "select_id": 1,
     "cost_info": {
       "query_cost": "3.85"
     },
     "table": {
       "table_name": "A",
       "access_type": "ALL",
       "rows_examined_per_scan": 36,
       "rows_produced_per_join": 36,
       "filtered": "1..."
       
****

-- PLANO DE EXECUÇÃO NO WORKBENCH:

-- Quando vemos um retângulo em verde no plano de execução, significa que aquele Table Scan está usando um índice.

-- CRIANDO USUARIO POR LINHA DE COMANDO NO WORCKBENCH COM TODOS OS PRIVILEGIOS DBA:

--           USUARIO:   LOCAL:                  SENHA:
create user 'admin01'@'localhost' identified by 'admin01';
grant all privileges on *.* to'admin01'@'localhost' with grant option;

-- DELETAR USUARIO:

drop user 'admin01'@'localhost'

-- CRIANDO USUARIO POR LINHA DE COMANDO NO WORCKBENCH COM PRIVILEGIOS DE MANUTENÇÃO COMUM:

--           USUARIO:   LOCAL:                  SENHA:
create user 'user01'@'localhost' identified by 'user01';
grant select, insert, update, delete, create temporary tables, lock tables, execute on *.* to'user01'@'localhost';

-- CRIANDO USUARIO POR LINHA DE COMANDO NO WORCKBENCH COM PRIVILEGIOS DE APENAS LEITURA:

--           USUARIO:   LOCAL:                  SENHA:
create user 'user02'@'localhost' identified by 'user02';
grant select, execute on *.* to'user02'@'localhost';

-- CRIANDO USUARIO POR LINHA DE COMANDO NO WORCKBENCH COM PRIVILEGIOS APENAS PARA BACKUP:

--           USUARIO:   LOCAL:                  SENHA:
create user 'user03'@'localhost' identified by 'user03';
grant select, reload, lock tables, replication client on *.* to'user03'@'localhost';
