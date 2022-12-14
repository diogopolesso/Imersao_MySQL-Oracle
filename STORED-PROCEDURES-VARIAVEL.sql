/* As variáveis, elas são declaradas através do comando "DECLARE", o nome da variável e um "DATATYPE", que é um tipo.
O "DATATYPE", ele é obrigatório ter. Toda variável tem que ter um tipo, mas ela, não necessariamente, precisa ter um valor "DEFAULT".
Se eu não tiver um valor "DEFAULT" para a variável, o valor dela será NULL.
O nome da variável deve ser apenas letras, números, $ e o underscore. E o tamanho máximo do nome da variável é 255 caracteres. */

-- Tipos de Variaveis:

VARCHAR()
INTEGER
DECIMAL(p,s)
DATE
TIMESTAMP

-- EXEMPLO 1;

DROP procedure IF EXISTS `variavel`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `variavel` ()
BEGIN
declare texto char(20) default 'Hello People!';
select texto;
END$$

DELIMITER ;

call variavel; -- RESULTADO: Hello People!

-- EXEMPLO 2 com varios DECLARE:

DROP procedure IF EXISTS `tipos_dados`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `tipos_dados` ()
BEGIN
declare x varchar(5) default 'TEXTO';
declare y integer default 10;
declare z decimal(4,2) default 50.15;
declare w date default '2022-01-10';
select x;
select y;
select z;
select w;
END$$

DELIMITER ;

call tipos_dados; -- RESULTADO: Teremos 4 resultados porque tivemos 4 select

-- EXEMPLO 3:

DROP procedure IF EXISTS `data_hora_local`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `data_hora_local` ()
BEGIN
declare hr datetime default localtimestamp;
select hr;
END$$

DELIMITER ;

call data_hora_local -- RESULTADO: DATA E HORA LOCAL (atual do computador)

-- EXEMPLO 4:

DROP procedure IF EXISTS `mesmo_tipos_dados`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `mesmo_tipos_dados` ()
BEGIN
declare data_1, data_2 date default '2022-01-10';
select data_1, data_2;
END$$

DELIMITER ;

call mesmo_tipos_dados; -- RESULTADO: Valores Iguais! '2022-01-10'

-- OBS: Quando a gente declara duas ou mais variáveis na mesma linha, o que a gente coloca depois como "TIPO" e como "DEFAULT" vale para todo mundo da linha.

-- EXEMPLO 5:

DROP procedure IF EXISTS `atribui_valor`;

DELIMITER $$
USE `vendas_sucos`$$
CREATE PROCEDURE `atribui_valor` ()
BEGIN
declare texto varchar(30) default 'Texto Inicial';
select texto;
set texto = 'Texto Modificado';
select texto;
END$$

DELIMITER ;

call atribui_valor; -- RESULTADO: Inicialmente, o valor de texto era "TEXTO INICIAL" Depois ficou "TEXTO MODIFICADO".

