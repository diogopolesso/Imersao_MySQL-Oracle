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

-- ACESSANDO O MySQL DE QUALQUER SERVIDOR:

*/ Na criação de um usuario se manter % (percent) na caixa de diálogo, significa que o administrador ou user que for criado, 
vai poder acessar de qualquer lugar o MySL */

--         USUARIO:   LOCAL:            SENHA:
create user 'admin01'@'%' identified by 'admin01';
grant all privileges on *.* to'admin01'@'%' with grant option;

/*
OBS:
Existem várias formas de usar esse caractere percent, exemplos:

Se no lugar de percent, eu colocar 192.168.1.%, tudo daqui para trás é genérico, 
então qualquer IP deste... se o cara tiver no IP 192.168.1.0, até 192.168.1.255, 
que é o máximo que ele pode ir, ele vai conseguir acessar na base. 
Se eu substituir o percent por underscore, o underscore vai substituir qualquer número que esteja aqui ou letra.

No caso, se eu usar 192.168.1.1., dois underscore, eu posso ir do 00 ao 255, é o range de IP que eu posso estar usando e por exemplo, 
se eu colocar não um IP, mas um endereço URL, por exemplo: client.mycompany.com, eu posso usar client dentro do lugar do underscore, 
pode ser qualquer letra ou número “.mycompany.com”, porque as vezes eu posso ter sites diferentes, mas usando sempre o mesmo sufixo.

Aí, eu posso, se eu tiver o domínio, por exemplo, mycompany.com, eu posso acessar o MySQL de qualquer máquina, domínio, por exemplo. 
Então, no lugar onde eu botei o percent, eu posso botar esses endereços dessa forma, que aí, 
eu vou estar dando privilégios de conexão através de outras máquinas, sem ser o localhost.
*/

-- SCHEMA PRIVILEGES:

-- CRIANDO USUARIO POR LINHA DE COMANDO NO WORCKBENCH COM SCHEMA PRIVILEGES:

--     USUARIO:   LOCAL:               SENHA:
create user 'user04'@'%' identified by 'user04';
grant select, insert, update, delete, create temporary tables, lock tables, execute on SUCOS_VENDAS.* to'user04'@'%';

-- CRIANDO USUARIO POR LINHA DE COMANDO NO WORCKBENCH COM SCHEMA PRIVILEGES E LIMITAÇÃO DE TABELA:

--     USUARIO:   LOCAL:               SENHA:
create user 'user05'@'%' identified by 'user05';
grant select, insert, update, delete on SUCOS_VENDAS.tabela_de_clientes to'user05'@'%';

grant select on SUCOS_VENDAS.tabela_de_produtos to'user05'@'%'; -- POSSO AINDA DAR UM GRANT DIFERENTE PARA OUTRA TABELA.

-- REVOGANDO PRIVILEGIOS:

select * from mysql.user; -- PARA VER TODOS OS USUARIOS E SUAS INFORMAÇÕES 

