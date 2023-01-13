-- Controle de Fluxo "CASE".

CASE selector
WHEN selector_value_1 THEN then_stantement_1;
WHENselector_value_1 THEN then_stantement_2;
WHEN ....
[ELSE else_stantements]
END CASE;

-- EXEMPLO:

DROP procedure IF EXISTS `acha_tipo_sabor`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `acha_tipo_sabor` (vProduto varchar(50))
BEGIN
	declare vSabor varchar(50);
	select SABOR into vSabor from tabela_de_produtos 
	where CODIGO_DO_PRODUTO = vProduto;
	CASE vSabor
	WHEN 'Lima/Limão' THEN select 'Cítrico';
	WHEN 'Laranja' THEN select 'Cítrico';
	WHEN 'Morango/Limão' THEN select 'Cítrico';
	WHEN 'Uva' THEN select 'Neltro';
	WHEN 'Morango' THEN select 'Neltro';
	ELSE select 'Acidos';
	END CASE;
END$$

DELIMITER ;

call acha_tipo_sabor('1000889'); -- (Uva) RESULTADO = Neltro 

call acha_tipo_sabor('1002334'); -- (Lima/Limão) RESULTADO = Cítrico
