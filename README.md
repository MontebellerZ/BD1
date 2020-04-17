# BD1
Repositório para o trabalho da disciplina de Banco de Dados com o professor Marcello Novaes de Amorim.

Feito por:
  - Bianca Ribeiro Andrade
  - Filipe Montebeller Rocha
  - Matheus Barros de Andrade Cabral
  - Rian Castello Guimarães
  - Ozias Filipe Carvalho Peçanha
  

## Regras de normalização
* #### 1NF:
    Devemos observar e analisar se existe algum atributo que pode ocorrer mais de uma vez. Caso exista, devemos dividir esse atributo em novos atributos separados que sejam univalorados. Isso é necessário porque um atributo não deve ter mais do que um valor dentro de si.
    
* #### 2NF:
    Um atributo deve estar dentro da entidade que ele depende diretamente. Se ele estiver em uma entidade relacionada, deve ser realocado para dentro da que ele depende. Eles devem não podem estar em uma tabela diferente (mesmo que ela seja 1:N com a outra a que o atributo depende) porque ele se repetiria todas as vezes sem necessidade.
    
* #### 3NF:
    Um atributo não pode depender de outros que não sejam o UID). Caso aconteça, você deve remover esse segundo atributo dependente.  Se o atributo não for calculável mas ainda assim for dependente, significa que você precisa de uma nova tabela com esses atributos. Assim, nessa nova tabela ele é um UID real com seus atributos dependentes e está relacionado com a entidade antiga.



## Professor, a gente ta terminando de reformular o readme esses dias, na próxima vez que você acessar aqui, vai ta bonito o texto abaixo

Preciso de um banco de dados que possa alimentar minha aplicação com tudo que o meu sistema quer disponibilizar. A aplicação é uma espécie de site de adoção onde as pessoas podem acessar, ter seu login, seus dados principais e suas preferências salvas. Quando elas acessam, elas têm disposta uma lista que é dividida em partições que mostram apenas a categoria selecionada, se o usuário clicar em cachorros, mostram apenas cachorros, se clicar em gatos, mostra apenas gatos, se clicar em todos, mostra todos os pets. Cada categoria da lista mostra todos os pets desta que estão disponíveis para a adoção e, enquanto na lista, mostra apenas um pouco de informação como a foto principal, o nome e a idade do pet. Quando clicar em cima de algum pet, o usuário é transferido para a página do perfil do animal e lá mostram todas as suas informações dele, como nome, fotos, idade, personalidade, características, peso, tamanho, raça e por aí vai. Além da lista e do perfil do pet, quero um pequeno perfil para o usuário onde as informações dele também podem ser mostradas e editadas por ele mesmo. Por fim tenho uma página de formulário para a adoção, que está relacionada tanto a pessoa que deseja adotar quanto ao pet, mas cada adoção é única e tem suas características pois as informações mudam sempre e então o formulário deve ser preenchido novamente toda vez que for adotar um pet novo. Quando um pet for efetivamente adotado, não quero que ele desapareça do sistema, quero apenas que ele fique indisponível e que eu possa saber que o adotou por tempo indefinido para que eu sempre possa contatar o adotante e que eu possa reinserir o pet caso ele e o novo dono não se adaptem juntos e ele tenha que voltar pra organização. Gostaria também que tanto o pet quanto os usuários do site tivessem um histórico de adoções, para que mesmo que eles desfaçam a adoção, eu possa saber quem o usuário já adotou e por quem o pet já foi adotado.
