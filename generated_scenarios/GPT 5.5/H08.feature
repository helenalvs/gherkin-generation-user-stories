Feature: Método de pagamento para retirada na loja

Scenario: Exibir apenas pagamento na loja para retirada na loja
Given que o usuário selecionou a entrega "Retirada na loja"
When os métodos de pagamento disponíveis forem apresentados
Then o único método de pagamento disponível deve ser "Pagamento na loja"
