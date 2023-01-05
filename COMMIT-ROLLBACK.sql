/* Transação no MySQL
como é que eu inicio uma transação? */

start transaction /* Cria um Ponto de estado do Banco de Dados */

/* Como que eu Acabo uma transação: */

commit  /* confirmo no banco de dados tudo aquilo que eu modifiquei depois do START TRANSACTION. */
rollback /*  volto atrás e não consigo ver as modificações, as modificações não são confirmadas no banco. */

/* START TRANSACTION E ROLLBACK: VOU INICIAR UMA TRANSAÇÃO E DEPOIS VOU VOLTAR A TRÁS NAS MINHA ALTERAÇÃO E NÃO VOU CONFIRMAR AS ALTERAÇÕES */

start transaction;

select * from vendedores;

update vendedores set COMISSAO = COMISSAO * 1.15;

rollback;

/* START TRANSATION E COMMIT: VOU INICIAR UMA TRANSAÇÃO E DEPOIS VOU CONFIRMAR AS ALTERAÇÕES */

start transaction;

update vendedores set COMISSAO = COMISSAO * 1.15;

commit;
