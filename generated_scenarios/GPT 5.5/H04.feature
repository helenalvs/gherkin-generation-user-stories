Feature: Pesquisa de títulos por lista de ISBN

Scenario: Pesquisar títulos utilizando uma lista de ISBN copiada e colada
Given que o usuário possui uma lista de ISBN
When o usuário realiza uma busca utilizando a lista de ISBN
Then os títulos correspondentes são pesquisados sem necessidade de inserção manual individual

Scenario: Limpar a lista de ISBN utilizando a opção de redefinição
Given que existe uma lista de ISBN informada para busca
When o usuário utiliza a opção "Redefinir"
Then o campo de lista de ISBN é limpo

Scenario: Realizar busca com ISBNs contendo hífens
Given que o usuário possui uma lista de ISBN com separação por hífens
When o usuário realiza a busca utilizando a lista de ISBN
Then a busca considera os ISBNs informados independentemente da presença de hífens

Scenario: Exibir ISBNs não encontrados durante a busca
Given que o usuário realiza uma busca utilizando uma lista de ISBN
And que existem ISBNs não encontrados no banco de dados
When a busca é concluída
Then é exibida uma lista dos ISBNs não encontrados no banco de dados durante a busca
