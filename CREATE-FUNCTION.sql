-- Entendendo Função:

CREATE FUNCTION  function_name (parameters)
RETURNS datatype;

BEGIN

DECLARE declaration_stantement;
....
executable_stantement;
....
RETURN stantement;
....
END;

-- OBS: Normalmente, as instalações MySQL não permitem que você crie funções.
-- para o ambiente MySQL poder criar funções é preciso estipular um parâmetro:

SET GLOBAL LOG_BIN_TRUST_FUNCTION_CREATORS = 1;

-- DEPOIS = CREATE FUNCTION:

DROP function IF EXISTS `f_acha_tipo_sabor`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_acha_tipo_sabor` (vSabor varchar(50))
RETURNS varchar(20)
BEGIN
	declare vRetorno varchar(20) default '';
    CASE vSabor
	WHEN 'Lima/Limão' THEN set vRetorno = 'Cítrico';
	WHEN 'Laranja' THEN set vRetorno = 'Cítrico';
	WHEN 'Morango/Limão' THEN set vRetorno = 'Cítrico';
	WHEN 'Uva' THEN set vRetorno = 'Neltro';
	WHEN 'Morango' THEN set vRetorno = 'Neltro';
	ELSE set vRetorno = 'Acidos';
	END CASE;
RETURN vRetorno;
END$$

DELIMITER ;

-- PARA CHAMAR UMA FUNÇÃO USAMOS O "SELECT" E NÃO O "CALL":

select f_acha_tipo_sabor("Laranja");

-- OU

select NOME_DO_PRODUTO, SABOR, f_acha_tipo_sabor (SABOR) as TIPO from tabela_de_produtos;

-- OU

select NOME_DO_PRODUTO, SABOR from tabela_de_produtos WHERE f_acha_tipo_sabor (SABOR) = 'Neltro';
