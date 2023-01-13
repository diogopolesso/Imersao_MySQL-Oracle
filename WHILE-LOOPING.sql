-- Controle de Fluxo "WHILE-DO-END":

WHILE condition
DO stantements;
END WHILE;

-- EXEMPLO;

-- vou criar aqui uma tabela chamada "TAB_LOOPING", que vai ter só um campo "ID" que vai ser do tipo inteiro:

create table tab_looping (id int);

/*
minha rotina com 2 Parâmetros:
um número inicial e um número final. 
Vou fazer um contador onde vou contar a partir do número inicial, 
com intervalos de 1 a 1, até o número final.
Cada interação eu incluo o valor da sequência dentro dessa tabela.
*/

DROP procedure IF EXISTS `looping_while`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `looping_while` (vNumeroInicial int, vNumeroFinal int)
BEGIN
	declare vContador int;
    delete from tab_looping;
    set vContador = vNumeroInicial;
    while vContador <= vNumeroFinal
    DO
		insert into tab_looping (id) values (vContador);
        set vContador = vContador + 1;
	END WHILE;
    select * from tab_looping;
END$$

DELIMITER ;

call looping_while (1, 10); -- RESULTADO = Gera uma tabela que vai de um até 10

call looping_while (1, 100); -- RESULTADO = Gera uma tabela que vai de um até cem

call looping_while (1, 1000); -- RESULTADO = Gera uma tabela que vai de um até mil
