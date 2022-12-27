/* REFERENCIAS COMPLETAS: https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format */

DATE_FORMAT(date,format) 'Formata o datevalor de acordo com a formatstring.'

SELECT CONCAT('O Dia de Hoje é: ',  DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%c/%Y') ) AS RESULTADO;

SELECT SUBSTRING(CONVERT(23.3, CHAR), 1,1) AS RESULTADO;
