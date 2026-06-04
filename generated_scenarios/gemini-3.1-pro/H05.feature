Feature: Composição do valor total no carrinho de compras

Scenario: Visualizar os elementos que compõem o valor total
Given o usuário possui itens no carrinho de compras
When o carrinho de compras é visualizado
Then o valor total é exibido em uma caixa
And o total líquido é exibido
And os diferentes componentes de IVA e imposto são listados separadamente
And o total bruto é exibido

Scenario: Atualizar os preços após alteração no carrinho
Given o usuário visualiza o carrinho de compras com o valor total exibido
When o carrinho de compras é alterado
Then os preços atualizados são exibidos