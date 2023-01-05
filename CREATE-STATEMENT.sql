/* Com o botão direito do mouse sobre a tabela de produtos.
tenho uma série de opções que me ajudam a construir alguns comandos de SQL.
por exemplo: eu escolho a opção: Send to SQL Editor.
E eu vou escolher a opção Create Statement.
Ao fazer isso, ele vai escrever o comando de SQL 
para criar uma tabela igual aquela tabela que já existe: */


CREATE TABLE `produtos` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRITOR` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANHO` varchar(50) DEFAULT NULL,
  `EMBALAGEM` varchar(50) DEFAULT NULL,
  `PRECO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
