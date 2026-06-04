Feature: Detalhamento do valor total no carrinho

Scenario: Visualizar os elementos que compõem o valor total
Given que o usuário possui itens no carrinho de compras
When o usuário visualiza o carrinho de compras
Then o valor total é exibido em uma caixa no carrinho de compras
And o total líquido é exibido
And os diferentes componentes de IVA ou imposto são listados separadamente
And o total bruto é exibido

Scenario: Atualizar os preços após alteração no carrinho
Given que o usuário visualiza o detalhamento do valor total no carrinho de compras
When o carrinho de compras é alterado
Then os preços são atualizados