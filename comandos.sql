//COMANDOS no WORKBENCH:

SELECT 'SELECIONAR'
* 'o asterisco indica que você deseja mostrar todos os campos'
FROM 'A PARTIR DE'
USE 'USE'

AND 'E' 'mostra um registro se ambas as condições forem verdadeiras'
'EX.: V COM V = V, V COM F = F, F COM V = F, F COM F = F'

OR 'OU' 'mostra um registro se pelo menos uma das condições for verdadeira'
'EX.: V COM V = V, V COM F = V, F COM V = V, F COM F = F'

NOT 'é a negação de uma expressão (inverte seu estado lógico)'.
'EX.: V COM V = F, V COM F = V, F COM V = V, F COM F = V'

'AND, OR e NOT são usados para filtrar registros baseados em mais de uma condição'.

IN 'CONTIDO'

CREATE DATABASE 'CRIAR UM BANCO DE DADOS'
DROP DATABASE 'DELETAR UM BANCO DE DADOS'
INSERT INTO ...
UPDATE ... SET
WHERE ... 'serve para informar ao servidor de banco de dados MySQL exatamente quais resultados lhe interessa obter'
DELETE FROM ...
ALTER TABLE ... 'ALTERAR TABELA'
ADD PRIMARY KEY() 'ADICIONA UMA CHAVE PRIMARIA'
ADD COLUMN()
LIMIT
AS ALIASES 'ALIAS'

BETWEEN 'permite selecionar intervalos de dados ao retornar os resultados de uma consulta.
(ex.: retornar registros cujos preços estejam entre dois valores distintos, ou registros contidos dentro de um intervalo de datas especificado)'.


