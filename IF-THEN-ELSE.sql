-- Controle de Fluxo  "IF/THEN/ELSE".

IF condition THEN
  if_statements;
ELSE
  else_stantements;
END IF

-- EXEMPLO PRATICO:

select * from tabela_de_clientes;

select DATA_DE_NASCIMENTO from tabela_de_clientes where CPF = '1471156710';

-- Create Stored Procedures:

DROP procedure IF EXISTS `cliente_novo_velho`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `cliente_novo_velho` (vCPF varchar(20))
BEGIN
	declare vResultado varchar(20);
    declare vDataNascimento date;
    select DATA_DE_NASCIMENTO into vDataNascimento from tabela_de_clientes where CPF = vCPF;
    IF vDataNascimento < '20000101' THEN
		set vResultado = 'Cliente Velho';
    ELSE
		set vResultado = 'Cliente Novo';
	END IF;
		select vResultado;
END$$

DELIMITER ;

call cliente_novo_velho('1471156710'); -- RESULTADO = Cliente Velho

call cliente_novo_velho('19290992743'); -- RESULTADO = Cliente Novo
