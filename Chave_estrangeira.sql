/* criando Chave Estrangeira - adicionando um novo relacionamento: */

alter table vendas add constraint fk_cliente 
foreign key (CPF) references cliente (CPF);

alter table vendas add constraint fk_vendedores
foreign key (MATRICULA) references vendedores (MATRICULA);
