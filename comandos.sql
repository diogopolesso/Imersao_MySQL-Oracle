//COMANDOS no WORKBENCH:

SELECT 'SELECIONAR'
* 'o asterisco indica que você deseja mostrar todos os campos'
FROM 'A PARTIR DE'
USE 'USE'
END 'FIM'

AND 'E' 'mostra um registro se ambas as condições forem verdadeiras'
'EX.: V COM V = V, V COM F = F, F COM V = F, F COM F = F'

OR 'OU' 'mostra um registro se pelo menos uma das condições for verdadeira'
'EX.: V COM V = V, V COM F = V, F COM V = V, F COM F = F'

NOT 'é a negação de uma expressão (inverte seu estado lógico)'.
'EX.: V COM V = F, V COM F = V, F COM V = V, F COM F = V'

'AND, OR e NOT são usados para filtrar registros baseados em mais de uma condição'.

IN 'CONTIDO'
LIKE '%...' "usado para representar qualquer registro genérico que venha antes ou depois do texto que estamos procurando.
% é um caractere curinga em determinado trecho de uma strings, varchar e char, equivalente ao * quando manipulamos arquivos."

CREATE DATABASE 'CRIAR UM BANCO DE DADOS'
DROP DATABASE 'DELETAR UM BANCO DE DADOS'
INSERT INTO ...
UPDATE ... SET
WHERE ... 'serve para informar ao servidor de banco de dados MySQL exatamente quais resultados lhe interessa obter'
DELETE FROM ...
ALTER TABLE ... 'ALTERAR TABELA'
ADD PRIMARY KEY() 'ADICIONA UMA CHAVE PRIMARIA'
ADD COLUMN()
LIMIT ' limita a saída de dados.
O número que colocamos depois de LIMITdirá quantas linhas serão exibidas.'

AS ALIASES 'ALIAS'

BETWEEN 'permite selecionar intervalos de dados ao retornar os resultados de uma consulta.
(ex.: retornar registros cujos preços estejam entre dois valores distintos, ou registros contidos dentro de um intervalo de datas especificado)'.

DISTINCT 'distinto, diferente. retorna somente linhas com valores diferentes e vamos usá-lo depois do SELECT e antes da exibição dos campos.'

ORDER BY 'Apresenta o resultado da consulta ordenado pelo campo determinado'
DESC 'Altera a ordem do' ORDER BY 'MAIOR PARA O MENOR'
ASC 'Altera a ordem do' ORDER BY 'MENOR PARA O MAIOR'

GROUP BY 'apresenta o resultado agrupando valores numéricos por uma chave de critério'
SUM 'SOMA'
MAX 'MÁXIMO'
MIN 'MÍNIMO'
AVG 'MÉDIA'
COUNT 'CONTA OCORRÊNCIAS'

HAVING 'APLICA O RESULTADO DE UMA AGRAGAÇÃO'

CASE 'serve para se fazer testes em um ou mais campos e,
quando determinada condição for atendida, então seguiremos por um caminho,
senão continuamos por outro.' 
'CASE VEM ACOMPANHADO DOS TERMOS:'
WHEN 'QUANDO'
THEN 'ENTÃO'
ELSE 'SENÃO' 'é executado, funcionando como desvio para um outro valor já estabelecido'
