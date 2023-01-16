-- Função que pega o cliente de forma aleatória.

DROP function IF EXISTS `f_cliente_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_cliente_aleatorio` ()
RETURNS INTEGER
BEGIN
	declare vRetorno varchar(11);
	declare num_max_tabela int;
	declare num_aleatorio int;
	select count(*) into num_max_tabela from tabela_de_clientes;
	set num_aleatorio = f_numero_aleatorio(1, num_max_tabela);
	set num_aleatorio = num_aleatorio - 1;
	select CPF into vRetorno from tabela_de_clientes
	limit num_aleatorio, 1;
RETURN vRetorno;
END$$

DELIMITER ;


