Grupo de Estudo Mozilla
============

Bem vindo ao Projeto grupo de estudo do [Mozilla Science Lab](https://www.mozillascience.org/) ! A partir daqui, iremos disponibilizar tudo de que você precisa para começar o seu próprio grupo de estudo.

### Pera ai, mas o que é um 'Grupo de Estudo Mozilla'?

Grupos de estudo Mozilla são encontros informais e divertidos com seus amigos e colegas em instituições locais e cidades para compatilhar habilidades, histórias, e ideias sobre o uso de programação em pesquisa. O objetivo é criar um ambiente
amigável e sem pressão onde as pessoas possam compartilhar seus trabalhos, pedir ajuda para resolver problemas de programação, e aprender a trabalhar junto com seus parceiros.

## Para participantes

Bem-vindo ao Grupo de Estudos Mozilla! Algumas coisas que você precisa saber e fazer agora que está aqui:

 - **Acompanhe este repositório:** lá em cima à direita, há um botão que diz "Watch"; clique nele e selecione 'Watching'. Isso fará com que você receba notificações de novas discussões do grupo no seu e-mail; se você não quer receber e-mails com atualizações, mas gostaria de ser alertado no GitHub, altere as configurações em Settings -> Notification Center ('Settings' é a pequena engrenagem na barra lateral à direita). 
 - **Acompanhe nossas discussões:** clique em 'issues' na barra lateral à direita; é neste local onde todas as discussões desse grupo de estudos acontecem. Use esse espaço para fazer perguntas, requisitar eventos, fazer sugestões ou apenas dar um alô.
 - **Leia nosso código de conduta:** este Grupo de Estudos é para todos - nós somos guiados por um [conjunto de regras](https://www.mozillascience.org/code-of-conduct/) que solicita que todos sejam tratados com respeito. Ajude-nos a manter um espaço onde todos sintam-se bem-vindos e assim teremos um ótimo tempo juntos!
 - **Adicione-se a lista de membros:** Se você quiser aparecer na seção 'Quem somos nós' do nosso site, dê uma olhada em `_data/members.yml`; envie-nos um 'pull request' com os seus dados, ou abra um novo 'issue' com o seu pedido e nós faremos isso por você.

## Para Organizadores

### Não está funcionando, eu preciso de ajuda

Se algumas de nossas instruções não funcionam ou não fazem sentido, abra um issue  [issue](https://github.com/mozillascience/studyGroup/issues) ou envie um email para sciencelab@mozillafoundation.org.

### Confira o manual

As intruções abaixo irão ajudar você a organizar as ferramentas online para o seu Grupo de Estudos Mozilla – mas se você estiver procurando por informações sobre estratégias de organização, planajemaneto de eventos e aulas, confira o [Manual do Grupo de Estudo Mozilla](https://mozillascience.github.io/studyGroupHandbook/) (em inglês)! 

## Como criar o site do seu próprio Grupo de Estudo Mozilla?

Aqui você vai encontrar tudo que precisa para criar o seu próprio Website Grupo de Estudo Mozilla e organizar os seus eventos. Siga os próximos passos e seu site estará funcionando em breve. Se você encontrar problemas, [abra um issue](https://github.com/mozillascience/studyGroup/issues), nós podemos te ajudar.

 1. **Crie um conta no GitHub.** O plano gratuito é suficiente.
 2. **Fork esse repositório.** No canto superior direito desta página tem um botão que diz 'Fork'; clique nele! Isso irá fazer uma cópia de todo esse material na sua própria conta do GitHub; Quando a cópia estiver pronta, o GitHub irá automaticamente te redirecionar para lá. 
 3. **Ative o monitoramento de issues.** O monitoramento de issues é um quadro de mensagens que o GitHub cria para cada repositório; você irá usar esse quadro para postar informações sobre seus eventos e conversar com os participantes. Para ativar o monitoramento de issues: 
   - clique em 'Settings' no canto direito da barra lateral do seu repositório. 
   - clique no botão de marcar 'Issues', na aba 'Features'; 
   - retorne ao seu repositório cliquando em `studyGroup` no topo da página. 
 4. **Edite o arquivo `_config.yml`** em seu repositório:
   - clique em `_config.yml`;
   - clique no pequeno lápis perto do canto superior direito;
   - siga as instruções de edição no próprio arquivo 
   - quando você terminar, clique no botão verde 'Commit Changes' no final da página.

É isso, você conseguiu! Você pode ver o seu website em 
`https://yourUserName.github.io/studyGroup/`, substitua `yourUserName` pelo nome de usuário da sua conta do GitHub. Se essa for a primeira vez que você estiver criando uma página no GitHub, esse processo pode demorar 30 minutos para que tudo flua pelos computadores do GitHub – não se preocupe, é assim mesmo. Verifique novamente depois e o seu website estará no ar funcionando normalmente. 

### Opcional: Configurando um Google Calendário para o seu Grupo de Estudos

Se você gostaria de oferecer um calendário de eventos para a sua comunidade para que eles possam importar seus próprios calendários, tente usar o Google Calendar. Para configurá-lo, faça um nova conta no Google, e atualize os campos no arquivo `_config.yml`, na seção 'Setup Google Calendar'.

Você pode adicionar eventos ao seu calendário manualmente, mas se quiser automatizar esse processo, existe um script para fazer isso `scripts/updateCalendar.py`; as instruções de uso estão no topo do arquivo. 

## Como lançar um novo evento

Quando você estiver pronto para apresentar um novo evento para o seu Grupo de Estudos, siga os próximos passos, ou [assista esse vídeo](https://youtu.be/abglQgEIccw) onde nós iremos te mostrar o passo a passo da lista de eventos.

 1. **Crie um novo Issue para descrever o seu evento.** 
   - clique em 'Issues' no canto direito do seu repositório, 
   - clique no botão verde 'New Issue' perto do canto direito superior. 
   - Você irá ver um formulário onde é possível dar um título e uma descrição para o seu evento – preencha esses campos com todas as informações relevantes:
     - Onde irá ocorrer o evento? Inclua o link para um mapa.
     - Quando será? Data e hora.
     - As pessoas precisam se preparar antes do evento? (instalar algum pacote?)
 2. **Vá para a pasta `_posts`**. Esta pasta se encontra em `https://github.com/yourUserName/studyGroup/tree/gh-pages/_posts` - ou você pode clicar em `_posts` no seu repositório.
 3. **Crie um novo arquivo** cliquando no sinal `+` ao lado de `_posts/`. Nomeie o arquivo seguindo esse padrão:
 4. 
    ```
    YYYY-MM-DD-word.markdown
    ```

    onde `YYYY-MM-DD` é a data do seu evento e `word` é qualquer palavra que quiser.
 4. **Copie e cole as seguintes informações no novo arquivo:**
 
    ```
    ---
    title: Encontro do grupo de Estudo
    text: uma frase que descreva o evento
    location: o Local do evento
    link: https://github.com/yourUserName/studyGroup/issues/1234
    date: 2016-01-04
    startTime: '15:00'
    endTime: '16:00'
    ---
    ```

    Modifique todos os campos para descrever o seu evento; certifique-se que o `link` é o endereço do issue que você criou, depois clique em `Commit Changes` no final da página.

É isso! O seu evento é está agora disponível em sua página. Além disso, existe um fórum de discussões para que as pessoas interessadas possam fazer perguntas e discutir os detalhes. Os eventos irão ser removidos automaticamente do cronograma da página uma semana depois da data do evento – mas o issue que foi criado estará sempre disponível como um registro do que você já realizou. 

> **Dicas sobre a lista de eventos**
>  - Você se lembrou de incluir `---` abaixo e acima? O compilador do site precisa disso.
>  - Não consegue encontrar o monitor de issues? Lembre de ativar no menu 'Settings' no canto direito.
>  - Os sete campos precisam estar cada um em uma linha; alguns editores de texto irão incluir quebras de linhas muito longas; remova se necessário.

## Como manter contato com os membros

Agora que vocês já se estabeleceram, o GitHub pode fornecer várias maneiras de se comunicar e manter contato com as outras pessoas envolvidas no Grupo de Estudo.

  - **Peça às pessoas para que Watch o seu repositório.** Assegure-se de que todos os usuários tenham clicado no botão 'Watch' no topo do seu repositório. Desta forma eles serão automaticamente notificados de todos os eventos que você postar no seu rastreador de edições (issue tracker). 
  - **Use o Rastreador de Edições.** O rastreador de edições é o seu quadro de mensagens público para fazer anúncios,  perguntas e iniciar conversas com os membros. O seu está aqui `https://github.com/yourUserName/studyGroup/issues`.
  - **Use o Forum do Mozilla Science** para papear com outros grupos de pesquisas ao redor do mundo. Encontre [o forum aqui](https://forum.mozillascience.org/category/events/study-groups); use-o para compartilhar suas histórias, fazer perguntas para uma comunidade mais ampla, e ver quem está por aí.

## Fale sobre a sua comunidade na Seção 'Quem somos nós'

A sua página deve incluir uma galeria dos participantes do Grupo de Estudo; adicionar pessoas é uma ótima forma de mostrar quem compõe a sua comunidade e destacar seus novos amigos e colegas. Para adcionar alguém à esta lista, edite o arquivo `_data/members.yml` adicionando a seguinte seção para cada pessoa:

```
- nome: o nome real da pessoa
  afiliação: escola, laboratório, departamento, loja....
  github: o endereço dele(a) no GitHub
  interesses:
    - liste de um a três
    - interesses diferentes
```
