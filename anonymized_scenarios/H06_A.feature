Feature: Visualizar disponibilidade de itens

Scenario: Exibir indicadores básicos de disponibilidade do item
Given que o usuário visualiza as informações de um item
When os detalhes do item são apresentados
Then uma das três cores de semáforo para disponibilidade é exibida abaixo das informações de preço
And a disponibilidade é exibida em texto à direita da cor do semáforo

Scenario: Exibir informações adicionais de disponibilidade do item
Given que um item possui informações adicionais
When os detalhes do item são apresentados
Then as informações adicionais de disponibilidade são exibidas em uma segunda linha