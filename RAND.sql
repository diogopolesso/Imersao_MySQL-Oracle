/* Função Interna "RAND":
quando executamos a função "RAND", ela te mostra um número aleatório entre 0 e 1. */

select rand();

select floor(rand() * (300-15+1) + 15);

 -- EXEMPLO PRATICO:
 
-- OBS: Normalmente, as instalações MySQL não permitem que você crie funções.
-- para o ambiente MySQL poder criar funções é preciso estipular um parâmetro:

SET GLOBAL LOG_BIN_TRUST_FUNCTION_CREATORS = 1;

-- DEPOIS = CREATE FUNCTION:

 DROP function IF EXISTS `f_numero_aleatorio`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_numero_aleatorio` (min int, max int)
RETURNS INTEGER
BEGIN
declare vRetorno int;
select floor(rand() * (max-min+1) + min) into vRetorno;
RETURN vRetorno;
END$$

select f_numero_aleatorio (1,10); -- RESULTADO = busca um número aleatório entre 1 e 10
select f_numero_aleatorio (1,15); -- RESULTADO = busca um número aleatório entre 1 e 15
select f_numero_aleatorio (15 ,300); -- RESULTADO = busca um número aleatório entre 15 e 300
