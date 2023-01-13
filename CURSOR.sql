-- Definição de Cursor:

/*
Como já sabemos não consigo associar uma variável quando o resultado do meu select for um vetor, o "SELECT INTO" não funciona nesses casos.
O SELECT INTO somente pode ser aplicado quando a consulta retorna uma linha apenas.
"Existe uma estrutura chamada "CURSOR" que faz isso".

o "CURSOR" é uma estrutura que é implementada no MySQL que permite uma interatividade linha a linha através de uma determinada ordem
pelo comando select que define o "CURSOR".

Fases:

Primeiro declaro o "CURSOR".
Depois, abrimos o "CURSOR".
Percorrer linha a linha na ordem com que o cursor é organizado.
E chego no final do "CURSOR".
*/

-- EXEMPLO PRATICO:

DROP procedure IF EXISTS `sucos_vendas`.`cursor_primeiro_contato`;
;

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_primeiro_contato`()
BEGIN
declare vNome varchar(50);
declare c cursor for select nome from tabela_de_clientes limit 4; 
OPEN c;
fetch c into vNome;
select vNome;
fetch c into vNome;
select vNome;
fetch c into vNome;
select vNome;
fetch c into vNome;
select vNome;
close c;
END$$

DELIMITER ;
;

call cursor_primeiro_contato; -- RESULTADO = Retorna 4 Posições

/* Looping com Cursor
Eu tenho que saber quando que o "CURSOR" vai acabar. Ou mais precisamente, antes de dar um "FETCH", 
eu tenho que saber se o"CURSOR" acabou ou não. Eu posso FORÇAR O erro colocando um quinto "FETCH", 
normalmente, Eu não sei quantas posições o "CURSOR" tem. Como é que a gente faz isso? 
usando o "LOOPING": */

DROP procedure IF EXISTS `cursor_looping`;

USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`cursor_looping`;
;

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursor_looping`()
BEGIN
declare fim_do_cursor int default 0;
declare vNome varchar(50);
declare c cursor for select nome from tabela_de_clientes;
declare continue handler for not found set fim_do_cursor = 1;
open c;
while fim_do_cursor = 0
DO
	fetch c into vNome;
    IF fim_do_cursor = 0 THEN
    select vNome;
    END IF;
END WHILE;
CLOSE c;
END$$

DELIMITER ;
;

call cursor_looping; -- RESULTADO = Retorna Varias Posições, Um resultado para cada cliente da tabela e ele foi até o final do "CURSOR".
 
-- Associando mais de uma variavel:

select * from tabela_de_clientes

/* Eu tenho aqui o nome do cliente, endereço, bairro, cidade, estado e o CEP. 
Vou montar uma saída que seja todos esses campos concatenados: */

DROP procedure IF EXISTS `looping_cursor_multiplas_colunas`;

USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`looping_cursor_multiplas_colunas`;
;

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `looping_cursor_multiplas_colunas`()
BEGIN
declare fim_do_cursor int default 0;
declare vCidade, vEstado, vCep varchar (50);
declare vNome, vEndereco varchar (150);
declare  c cursor for select nome, endereco_1, cidade, estado, cep from tabela_de_clientes;
declare continue handler for not found set fim_do_cursor = 1;
open c;
while fim_do_cursor =0
DO
	fetch c into vNome, vEndereco, vCidade, vEstado, vCep;
    IF fim_do_cursor = 0 THEN select concat(vNome, ', Endereço: ', vEndereco, ', ', vCidade, ' - ', vEstado, ', CEP: ' , + vCep);
END IF;
END WHILE;
CLOSE c;

END$$

DELIMITER ;

call looping_cursor_multiplas_colunas; 

-- RESULTADO = concat(vNome, ', Endereço: ', vEndereco, ', ', vCidade, ' - ', vEstado, ', CEP: ' , + vCep)
--             Fábio Carvalho, Endereço: R. dos Jacarandás da Península, Rio de Janeiro - RJ, CEP: 22002020


