DROP procedure IF EXISTS `hello_World`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `hello_World` ()
BEGIN
select 'hello World!' as RESULTADO;
END$$

DELIMITER ;

-- ALTER STORED PROCEDURES:

DROP procedure IF EXISTS `hello_World`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `hello_World` ()
BEGIN
select 'hello World!, okay?' as RESULTADO;
END$$

DELIMITER ;

-- DELETE STORED PROCEDURES:
