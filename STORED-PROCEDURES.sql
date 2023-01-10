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

-- Para Chamar uma Stored Procedure, USAMOS:

call hello_people; /* RESULTADO: Hello People!! */

-- Outro exemplo é que Stored Procedures tambem pode me mostrar numeros:

DROP procedure IF EXISTS `calcular`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `calcular` ()
BEGIN
select (2 + 8) - 5;
END$$

DELIMITER ;

call calcular; /* RESULTADO: (2 + 8) - 5 = 5 */

-- OU resultado de calculos com o AS (alias):

DROP procedure IF EXISTS `calculo_alias`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `calculo_alias` ()
BEGIN
select (2 + 8) - 5 as resultado;
END$$

DELIMITER ;

call calcular; /* RESULTADO: 5 */

-- Podemos também CONCATENAR concat()

DROP procedure IF EXISTS `funcoes`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `funcoes` ()
BEGIN
select concat('Hello People!', '......', (2 + 8) - 5) as itens_combinados;
END$$

DELIMITER ;

call funcoes; /* RESULTADO: Hello People!......5 */

-- Comentários na Stored Proceduresd:

DROP procedure IF EXISTS `comentarios`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `comentarios` ()
BEGIN
/* Vamos exibir aqui nosso Comentario
entre textos e numeros */
-- Usando a função CONCAT

select concat('Hello People!', '......', (2 + 8) - 5) as itens_combinados;
END$$

DELIMITER ;

call comentarios; /* RESULTADO: Hello People!......5 */

