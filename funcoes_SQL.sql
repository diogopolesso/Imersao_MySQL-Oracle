REFERENCIAS COMPLETAS: https://www.w3schools.com/sql/sql_ref_mysql.asp

=> LTRIM() 'remove os espaços iniciais de uma string.'

SELECT LTRIM('    OLÁ') AS RESULTADO;
SELECT LTRIM('OLÁ     ') AS RESULTADO;
SELECT LTRIM('   OLÁ   ') AS RESULTADO;

=> CONCAT() 'adiciona duas ou mais expressões juntas.'

SELECT CONCAT('OLÁ', ' ', 'TUDO BEM', '?') AS RESULTADO;
SELECT CONCAT(NOME, ' (', CPF, ') ') AS RESULTADO FROM tabela_de_clientes;
SELECT NOME, CONCAT(ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO) AS COMPLETO FROM tabela_de_clientes;

=> UPPER() 'converte uma string em letras maiúsculas.'

SELECT UPPER('ola, tudo bem?') AS RESULTADO;

=> SUBSTRING() 'extrai uma substring de uma string (começando em qualquer posição).'

SELECT SUBSTRING('OLÁ, TUDO BEM?', 5) AS RESULTADO;
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6, 4) AS RESULTADO;

FUNÇÕES DE DATA:

=>ADDDATE() 'adiciona um intervalo de data/hora a uma data e, em seguida, retorna a data.'

=> CURDATE() 'retorna a data atual'

SELECT CURDATE();

=> CURRENT_TIME() 'retorna a hora atuaL.'

SELECT CURRENT_TIME();

=> CURRENT_TIMESTAMP() 'retorna a data e hora atuais.'

SELECT CURRENT_TIMESTAMP();

VARIAÇÕES:

SELECT YEAR(current_timestamp());
SELECT DAY(current_timestamp());
SELECT MONTH(current_timestamp());

SELECT MONTHNAME(current_timestamp());

SELECT DATEDIFF(current_timestamp(), '2022-12-27') AS RESULTADO;
SELECT DATEDIFF(current_timestamp(), '1983-09-29') AS RESULTADO;

SELECT DISTINCT DATA_VENDA, DAYNAME(DATA_VENDA) AS DIA, MONTHNAME(DATA_VENDA) AS MES, YEAR(DATA_VENDA) AS ANO FROM NOTAS_FISCAIS;

SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS IDADE FROM  tabela_de_clientes;

FUNÇÕES MATEMATICAS;

=> ABS() 'retorna o valor absoluto (positivo) de um número.'

SELECT (23+((25-2)/2)*45) AS RESULTADO;

=> CEILING() 'retorna o menor valor inteiro maior ou igual a um número.'

SELECT CEILING(12.3333335554452) AS RESULTADO;

=> ROUND() 'arredonda um número para um número especificado de casas decimais.'

SELECT ROUND(12.3333335554452) AS RESULTADO;

=> FLOOR() 'retorna o maior valor inteiro menor ou igual a um número.'

SELECT FLOOR(12.3333335554452) AS RESULTADO;

=> RAND() 'retorna um número aleatório entre 0 (inclusivo) e 1 (exclusivo).'

SELECT RAND() AS RESULTADO;



