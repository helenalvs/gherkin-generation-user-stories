Feature: Exibição da composição do valor total no carrinho

Scenario: Exibir o valor total em uma caixa no carrinho de compras
Given que o usuário possui um carrinho de compras
When o carrinho é visualizado
Then o valor total é exibido em uma caixa no carrinho de compras

Scenario: Exibir o total líquido no carrinho
Given que o usuário possui um carrinho de compras
When o carrinho é visualizado
Then o total líquido é exibido

Scenario: Exibir os componentes de IVA ou imposto separadamente
Given que o usuário possui um carrinho de compras
When o carrinho é visualizado
Then os diferentes componentes de IVA ou imposto são listados separadamente

Scenario: Exibir o total bruto no carrinho
Given que o usuário possui um carrinho de compras
When o carrinho é visualizado
Then o total bruto é exibido

Scenario: Atualizar os preços após alteração do carrinho
Given que o usuário possui um carrinho de compras
When o carrinho é alterado
Then os preços são atualizados
