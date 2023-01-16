-- CONSULTAS:

SHOW GLOBAL STATUS LIKE created_tmp_disk_tables; -- Tabelas temporárias em disco
SHOW GLOBAL STATUS LIKE Created_tmp__tables; -- Tabelas temporárias em memória

-- Variavel de Memoria:

SHOW GLOBAL STATUS LIKE 'tmp_table_size'; -- Informa o valor da variavel de memória

SET GLOBAL tmp_table_size = 208003328; -- Aumenta o valor da variavel de memória, aumentei em 100 milhões de bytes.

-- OBS: Todas as conexões passam a olhar esse parâmetro maior, porque essa variável é Global.
