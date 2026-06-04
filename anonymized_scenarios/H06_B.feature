Feature: Visualização da disponibilidade dos itens

Scenario: Exibir indicador de disponibilidade abaixo das informações de preço
Given que o usuário visualiza um item
When a disponibilidade do item é apresentada
Then uma das 3 cores de semáforo de disponibilidade é exibida abaixo das informações de preço

Scenario: Exibir texto de disponibilidade ao lado do indicador visual
Given que o usuário visualiza a disponibilidade de um item
When a disponibilidade do item é apresentada
Then o texto de disponibilidade é exibido à direita da cor do semáforo

Scenario: Exibir informações adicionais de disponibilidade em segunda linha
Given que existem informações adicionais de disponibilidade para um item
When a disponibilidade do item é apresentada
Then as informações adicionais são exibidas em uma segunda linha
And a segunda linha pode conter a data de disponibilidade
And a segunda linha pode apresentar quebra de linha quando necessário
