/* Transação no MySQL
como é que eu inicio uma transação? */

start transaction /* Cria um Ponto de estado do Banco de Dados */

/* Como que eu Acabo uma transação: */

commit  /* confirmo no banco de dados tudo aquilo que eu modifiquei depois do START TRANSACTION. */
rollback /*  volto atrás e não consigo ver as modificações, as modificações não são confirmadas no banco. */

