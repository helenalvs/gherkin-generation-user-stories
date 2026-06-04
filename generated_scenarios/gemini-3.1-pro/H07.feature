Feature: Seleção de dados de entrega na visualização mobile

Scenario: Manutenção e seleção de endereço de entrega
Given o usuário acessa a etapa de dados de entrega na visualização mobile
When o usuário realiza a manutenção e seleciona o endereço
Then o endereço selecionado é definido para a entrega

Scenario: Seleção do método de envio
Given o usuário acessa a etapa de dados de entrega na visualização mobile
When o usuário seleciona o método de envio
Then o método de envio selecionado é definido para a entrega

Scenario: Navegação para a próxima etapa
Given o usuário concluiu a seleção de endereço e método de envio na visualização mobile
When o usuário prossegue com a navegação posterior
Then o usuário avança no fluxo de entrega