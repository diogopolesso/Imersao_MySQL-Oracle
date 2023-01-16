# **Usando o Workbench para backup**

Quando a gente tira o backup, pode ser que durante o processo de cópia, o banco de dados esteja sofrendo alguma atualização, seja por um sistema, por um processo e path ou qualquer outro meio. Tem gente acessando o banco, incluindo, alterando ou excluindo registros.

Então é interessante que eu faça alguma coisa para que o banco fique congelado, antes de eu fazer o meu backup e depois liberar ele de novo para uso. Eu tenho um comando para congelar o banco e outro comando para liberar o banco novamente.

Eu vou aqui no meu Workbench, eu tenho o banco então sucos_vendas selecionado e aí, eu tenho esse comando aqui, “Lock Intance For BackuP”, ao executar esse comando, o meu banco está fora, eu não consigo mais fazer coisa nele, eu deixei a minha instância trancada, inclusive lock significa trancar.

E aí, eu posso fazer o meu backup nesse momento, seja pelo Mysqldump, seja pelo Workbench e para destrancar o banco, eu executo, “Unlock Intance”. Aí, eu destranco o banco. Mas vamos mostrar agora para vocês, como é que eu tiro o backup lógico, agora usando o Workbench.

Claro que pelo Workbench, eu consigo executar coisas sem precisar digitar comandos, a vantagem do Mysqldump é que eu posso construir um arquivo (.bet) de comandos, para poder ser executado a noite, eu posso usar o próprio (scadole) para que aquele comando rode, por exemplo, todo o dia a 1h da manhã ou outro horário qualquer.

E aí, eu posso criar uma rotina de backup automática. Tirar o backup pelo Workbench é uma coisa mais pontual, é até mais fácil, porque é tudo visual, mas é uma coisa que eu não consigo depois (esquedular) isso para rodar num determinado momento, mas aí, vamos ver como é que eu faço usando o Workbench.

Eu vou trancar aqui o banco, então o banco está trancado, está lock e aí, eu vou aqui nessa aba aqui, administração. Clicando nessa aba, eu tenho aqui uma opção que é Data Export, eu vou clicar nela.

E aí, eu tenho aqui a caixa de diálogo de exportação de dados, por causa da minha resolução da tela, porque para gravar os vídeos, eu preciso ter uma resolução baixa, para que a qualidade do vídeo fique boa, eu quase que não consigo ver a caixa de diálogos toda, porque esse botão de iniciar a exportação fica praticamente escondido.

Mas se eu conseguir minimizar bem essa janela aqui de baixo, que é a janela de output, se eu puxar ela bem para baixo, eu consigo aqui ainda mexer no comando. Talvez no caso de vocês, vocês não precisem fazer isso.

Então, eu tenho do lado esquerdo, todos os bancos de dados e eu vou escolher o banco que eu quero gerar o meu backup, então eu vou gerar aqui do sucos_vendas e aqui embaixo, eu vou escolher essa opção aqui, Export do Self-Contained File.

E aí, eu posso dizer se eu quero incluir a criação do esquema, se eu quero inserir novos comandos, por enquanto eu vou manter isso aqui desabilitado e aqui eu vou botar o diretório C:\mysqladmin\sucos_vendas_full_ work, para dizer que eu estou gerando pelo Workbench, “.sql”.

E vou clicar aqui o botão Start Export e aí, ele me gera a exportação do arquivo, se eu olhar aqui, não é aqui... Não, está aqui no C, mysqladmin, eu tenho o arquivo sucos_vendas_full_work.sql, se eu abrir com o editor de texto, eu vou ver o conteúdo praticamente semelhante ao que é gerado quando eu uso o mysqladmin... Desculpe, o mysqldump, o mysqladmin é o nome do diretório que eu criei, mysqldump.

Então, eu tenho um arquivo semelhando ao gerado quando eu uso a linha de comando mysqldump. Só que ele também, o Workbench permite um outro tipo de backup, em que eu crio uma pasta e dentro dessa pasta, eu tenho vários arquivos para cada objeto do banco de dados.

Então vamos fazer isso, eu vou de novo clicar em Data Export, vou selecionar o sucos_vendas, mas agora eu vou escolher essa opção: Export to Dump Project Folder e eu vou aqui no C:\mysqladmin\ e aí, aqui eu não vou colocar o nome de um arquivo, eu vou colocar o nome de um folder, eu vou botar aqui bkp_sucos_vendas.

Clico em Start Export. Note que ele, na verdade, executou um processo para cada tabela, se a gente olhar aqui no diretório, eu agora tenho um subdiretório chamado bkp_sucos_vendas e aqui dentro, eu tenho como se fosse os scripts para estar criando cada tabela separadamente.

Se eu abrir esse daqui, eu tenho aqui o script de criação, drop create da também insert dos dados, se eu abrir aqui o tab_faturamento, tem também ela, ou seja, eu tenho um sql para cada tabela, é como se eu tivesse rodado o Mysqldump, quando a gente coloca aquele parâmetro –tables.

E aí, eu crio como se estivesse rodando um para cada tabela, essa opção do Workbench já cria uma pasta com todos os pontos sqls criados lá dentro. Claro que finalmente, depois que a gente termina de gerar o backup, eu destranco a instância.

Vou rodar aqui. Rodou com sucesso aqui em baixo. Então, pronto, o meu banco já está pronto para ser consultado novamente, o meu backup está salvo. Então é isso aí, eu quis mostrar para vocês, além do uso do Mysqldump, como eu posso tirar o backup lógico através do Workbench.

Para fazer o backup por arquivos, efetue os seguintes passos:

Pare o serviço do MySQL.
Criei o diretório de Backup no computador.
Copie todo o diretório Data para o novo diretório criado anteriormente.
Copie o arquivo de configuração my.ini e substitua quando o mesmo for recuperado.
Suba o serviço do MySQL.
