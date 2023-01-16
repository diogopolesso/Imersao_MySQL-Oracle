-- Função que obtem um VENDEDOR de forma aleatória.

-- OBS: Normalmente, as instalações MySQL não permitem que você crie funções.
-- para o ambiente MySQL poder criar funções é preciso estipular um parâmetro:

SET GLOBAL LOG_BIN_TRUST_FUNCTION_CREATORS = 1;

-- DEPOIS = CREATE FUNCTION:

CREATE FUNCTION `f_vendedor_aleatorio`() RETURNS varchar(5) BEGIN
  DECLARE vRetorno VARCHAR(5);
  DECLARE num_max_tabela INT;
  DECLARE num_aleatorio INT;
  SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_vendedores;
  SET num_aleatorio = f_numero_aleatorio(1, num_max_tabela);
  SET num_aleatorio = num_aleatorio - 1;
  SELECT MATRICULA INTO vRetorno FROM tabela_de_vendedores
  LIMIT num_aleatorio, 1;
RETURN vRetorno;
END

select f_vendedor_aleatorio(); -- RESULTADO = Cada vez que rodar essa função ela me tras um VENDEDOR ALEATÓRIO.
