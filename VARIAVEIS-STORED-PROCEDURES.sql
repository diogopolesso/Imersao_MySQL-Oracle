/*  

Variaveis:

Nome: Cliente. 
Tipo: Caracteres com 10 posições. 
Valor: Lucas
Nome: Idade. 
Tipo: Inteiro. 
Valor: 16
Nome: DataNascimento. 
Tipo: Data. 
Valor: 24/07/2007
Nome: Custo. 
Tipo: Número com casas decimais. 
Valor: 20,23

*/

-- CODIGO:

DELIMITER $$
create procedure variaveis ()
begin
declare Cliente varchar(10) default "Lucas";
declare Idade integer default 16;
declare DataNascimento date default "2007-07-24";
declare Custo decimal(4, 2) default 20.23;
select Cliente, Idade, DataNascimento, Custo;
end $$
DELIMITER ;

call variaveis;
