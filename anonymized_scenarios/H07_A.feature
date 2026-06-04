Feature: Seleção de dados de entrega na visualização mobile

Scenario: Manter e selecionar endereço de entrega
Given que o usuário está na visualização mobile com dados de entrega disponíveis
When o usuário seleciona um endereço de entrega
Then o endereço de entrega selecionado deve ser definido para a entrega

Scenario: Selecionar método de envio
Given que o usuário está na visualização mobile com opções de envio disponíveis
When o usuário seleciona um método de envio
Then o método de envio selecionado deve ser definido para a entrega

Scenario: Prosseguir após selecionar os dados de entrega
Given que o usuário está na visualização mobile com os dados de entrega selecionados
When o usuário realiza a navegação posterior
Then o fluxo deve prosseguir para a próxima etapa do processo de entrega
