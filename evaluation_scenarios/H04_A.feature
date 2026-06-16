Feature: Pesquisa de títulos por lista de ISBN

Scenario: Inserir lista de ISBNs copiados na busca
Given que o usuário possui uma lista de ISBNs
When o usuário insere a lista de ISBNs através de cópia e cola
Then a busca registra os ISBNs para a pesquisa de títulos

Scenario: Limpar a lista de ISBNs informada
Given que o usuário inseriu uma lista de ISBNs no campo de pesquisa
When o usuário aciona a ação de redefinir
Then o campo de pesquisa é limpo

Scenario: Pesquisar lista de ISBNs com variações de escrita
Given que o usuário fornece uma lista de ISBNs formatados com hífens
When a pesquisa é executada
Then o sistema processa a busca tolerando as variações na escrita dos ISBNs

Scenario: Visualizar ISBNs não encontrados
Given que o usuário executa a pesquisa com uma lista de ISBNs
When alguns ISBNs fornecidos não constam no banco de dados
Then é exibida uma lista com os ISBNs que não foram encontrados