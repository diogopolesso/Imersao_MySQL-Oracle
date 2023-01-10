/* Stored Procedure deve ter apenas letras ou números, o nome da Stored Procedure não pode passar de 64 caracteres e deve ser unicos.
Podemos usar o caracter "$" ou "_" (underscore) para separar dois nomes ou nomes compostos. */

DROP procedure IF EXISTS `hello_people`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `hello_people` ()
BEGIN
select 'Hello People!!';
END$$

DELIMITER ;

/* Para Chamar uma Stored Procedure, USAMOS: */ 

call hello_people;

