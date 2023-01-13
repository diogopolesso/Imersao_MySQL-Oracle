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
