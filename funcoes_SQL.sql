=> LTRIM 'remove os espaços iniciais de uma string.'

SELECT LTRIM('    OLÁ') AS RESULTADO;
SELECT LTRIM('OLÁ     ') AS RESULTADO;
SELECT LTRIM('   OLÁ   ') AS RESULTADO;

=> CONCAT 'adiciona duas ou mais expressões juntas.'

SELECT CONCAT('OLÁ', ' ', 'TUDO BEM', '?') AS RESULTADO;

=> UPPER 'converte uma string em letras maiúsculas.'

SELECT UPPER('ola, tudo bem?') AS RESULTADO;

=> SUBSTRING 'extrai uma substring de uma string (começando em qualquer posição).'

SELECT SUBSTRING('OLÁ, TUDO BEM?', 5) AS RESULTADO;


