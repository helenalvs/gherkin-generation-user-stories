Feature: Pagamento para retirada na loja

Scenario: Disponibilidade exclusiva do pagamento na loja ao retirar na loja
Given que a seleção de método de entrega está em andamento
When a opção de entrega "Retirada na loja" é selecionada
Then a opção "Pagamento na loja" é exibida como método de pagamento
And "Pagamento na loja" é o único método de pagamento disponível