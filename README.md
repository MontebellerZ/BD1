# BD1
>Repositório para o trabalho da disciplina de Banco de Dados com o professor ***Marcello Novaes de Amorim***.

### Feito por:
* Bianca Ribeiro Andrade
* Filipe Montebeller Rocha
* Matheus Barros de Andrade Cabral
* Rian Castello Guimarães
* Ozias Filipe Carvalho Peçanha

# Descrição

* ### A Organização
    >A Organização foi fundada com o propósito de resgatar pets pelas ruas, cuidar deles e permitir a adoção pela comunidade.
    Funcionamos em alguns funcionários moderadores que cuidam de tudo que envolve os adotantes, seja na hora de adotar, de atender um contato ou atender o cliente no balcão. Também temos os ajudantes, eles cuidam dos pets enquanto não são adotados e também são eles que vão as ruas resgatá-los.
    As pessoas que sempre tiveram o desejo de adotar um pet podem procurar na nossa organização e adotá-los sem pagar nada além de amor ao pet que vai adotar.
    Desejamos expandir horizontes e passar disponibilizar a adoção online por um site. Para isso, precisamos de um banco de dados que o alimente corretamente e responda ao sistema tudo que ele precisa.


* ### O Sistema
    >O Sistema tem o intuito de proporcionar uma usabilidade flúida e eficaz. 

    **No site o adotante tem acesso a diversas funcionalidades:**
    * Se cadastrar e ter um login e perfil
    * Visualizar e editar as informações de seu próprio perfil
    * Visualizar informações dos pets e suas fotos
    * Requisitar uma adoção e preencher o formulário de adoção
    * Entrar em contato conosco

    **Entretanto, também temos os ajudantes (cuidam dos pets) e os moderadores (cuidam de tudo que envolve os adotantes):**
    * Os ajudantes que resgatam os pets nas ruas, os registram no sistema e também cuidam desses pets até serem adotados.
    * Os moderadores atendem os contatos dos adotantes, avaliam e decidem se aceitam ou recusam uma adoção e cuidam dessa adoção até o momento que o adotante vem buscar o pet na organização.


* ### O Banco

    #### O Adotante, o Moderador e o Ajudante precisam ter as informações:
    ```
        * Nome
        * Sobrenome
        * Email
        * Senha
        * Telefone
        * CPF
        * Data de nascimento
        * CEP
        * Nome da rua
        * Número da moradia
        * Tipo (casa ou apt)
        * Nome da moradia (caso haja)
        * Complemento (caso o tipo seja apt)
    ```
    #### O Adotante precisa ter as informações adicionais:
    ```
        * Renda mensal
    ```
        
    #### O Adotante precisa registrar pedidos de:
    ```
        * Contatos
        * Adoções
    ```
        
    #### O Moderador precisa controlar:
    ```
        * Contatos
        * Adoções
    ```
        
    #### O Ajudante precisa registrar e cuidar de:
    ```
        * Pets
    ```
        
    #### O Contato precisa ter as informações:
    ```
        * O Adotante
        * O Moderador (quando o contato for atendido)
        * Motivo do contato
        * Data e hora do inicio contato
        * Data e hora do fim do contato (ao fim do contato)
        * Relatório (ao fim do contato)
    ```
        
    #### O Pet precisa ter as informações:
    ```
        * Nome
        * Idade
        * Espécie
        * Raça
        * Tamanho em centimetros 
        * Peso em gramas
        * Personalidade
        * Adaptabilidade
        * Disponibilidade (se está apto para adoção, se já está adotado ou se está em recuperação)
    ```
        
    #### As Fotos dos Pets precisam ser registradas separadamente com as informações:
    ```
        * O Pet
        * Link da foto
    ```
        
    #### A Adoção precisa ter as informações:
    ```
        * O Adotante
        * O Pet
        * O Moderador (quando a adoção entrar em avaliação)
        * Data da requisição
        * Data da adoção (caso seja o pet seja adotado)
        * Status da adoção (diferente para cada estágio: requisitada, em avaliação, adotada, negada ou desfeita (pet devolvido))
        * Relatório (ao fim do processo)
    ```
    
* ### Perguntas
    
    #### Perguntas que o banco de dados é capaz de responder:
    ```
        * Quantos animais possui no total na instituição?
        * Quantos pets estão disponíveis para adoção?
        * Quais são os pets disponíveis para adoção?
        * Quantos pets estão em recuperação?
        * Quais pets estão adotados?
        * Quais são os adotantes que já devolveram pets?
        * Quais pets já foram adotados por mais de uma vez?
        * Quais pessoas já adotaram mais de uma vez?
        * Quais moderadores já recusaram adoções?
        * Quais moderadores já negaram adoções para uma certa pessoa?
        * Quais adoções estão com status de adotado?
        * Quais são as raças disponíveis?
        * Quais gatos estão disponíveis para adoção?
        * Quais são os cachorros mais velhos que estão para adoção?
        * Quais animais estão na faixa etária de 0 a 2 anos?
        * Quais filhotes de cachorro estão para adoção (no max 1 ano)?
    ```
    
# Regras de normalização
* #### 1NF:
    Devemos observar e analisar se existe algum atributo que pode ocorrer mais de uma vez. Caso exista, devemos dividir esse atributo em novos atributos separados que sejam univalorados. Isso é necessário porque um atributo não deve ter mais do que um valor dentro de si.
    
* #### 2NF:
    Um atributo deve estar dentro da entidade que ele depende diretamente. Se ele estiver em uma entidade relacionada, deve ser realocado para dentro da que ele depende. Eles devem não podem estar em uma tabela diferente (mesmo que ela seja 1:N com a outra a que o atributo depende) porque ele se repetiria todas as vezes sem necessidade.
    
* #### 3NF:
    Um atributo não pode depender de outros que não sejam o UID). Caso aconteça, você deve remover esse segundo atributo dependente.  Se o atributo não for calculável mas ainda assim for dependente, significa que você precisa de uma nova tabela com esses atributos. Assim, nessa nova tabela ele é um UID real com seus atributos dependentes e está relacionado com a entidade antiga.

# Fim

*Última atualização deste arquivo: 18/06/2020 às 21:24*
