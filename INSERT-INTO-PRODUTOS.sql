/* O comando INSERT é aquele que insere dados dentro de uma tabela.
E a gente pode também colocar o INSERT + INTO com o nome da tabela com os campos, 
values e aí vários conjuntos de campos separados por vírgula. */

insert into PRODUTOS (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
values ('1040107', 'Light - 350 ml - Melãncia', 'Melãncia', '350 ml', 'Lata', 4.56);

insert into PRODUTOS (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
values ('1040108', 'Light - 350 ml - Graviola', 'Graviola', '350 ml', 'Lata', 4.00);

/* podemos também omitir esses nomes dos campos, Porem o comando sem a lista de campos 
você só pode usar quando a ordem dos values respeita a ordem dos campos da tabela. */

insert into PRODUTOS 
values ('1040109', 'Light - 350 ml - Açai', 'Açai', '350 ml', 'Lata', 5.60);

insert into PRODUTOS 
values ('1040110', 'Light - 350 ml - Jaca', 'Jaca', '350 ml', 'Lata', 6.00),
('1040111', 'Light - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 3.50);
