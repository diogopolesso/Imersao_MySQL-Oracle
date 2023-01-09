USE `sucos_vendas`;
DROP procedure IF EXISTS `Nao_Faz_Nada`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `Nao_Faz_Nada` ()
BEGIN

END$$

DELIMITER ;


/* OBS: Temos que mudar o delimitador para que não haja uma confusão entre os comandos da SP (Stored Procedure).
   Porque se continuarmos a usar o ponto e vírgula haverá uma confusão entre o ponto e vírgula dos comandos da Stored Procedure e dos comandos para criá-la */
