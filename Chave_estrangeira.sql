/* criando Chave Estrangeira - adicionando um novo relacionamento: */

alter table vendas add constraint fk_cliente 
foreign key (CPF) references cliente (CPF);

alter table vendas add constraint fk_vendedores
foreign key (MATRICULA) references vendedores (MATRICULA);

alter table itens_notas add constraint fk_vendas
foreign key (NUMERO) references vendas (NUMERO);

alter table itens_notas add constraint fk_produtos
foreign key (CODIGO) references produtos (CODIGO);
