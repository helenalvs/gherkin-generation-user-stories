Feature: Visualização de detalhes da conferência

Scenario: Visualizar informações principais da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then a capa da conferência é apresentada
And a categoria da conferência é apresentada
And o organizador da conferência é apresentado

Scenario: Visualizar mídia e página de impressão da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then a mídia da conferência é apresentada, se mantida
And a página de impressão é apresentada ao lado

Scenario: Visualizar detalhes de endereço e período da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then o endereço da conferência é apresentado
And o período e horário da conferência são apresentados

Scenario: Omitir pessoas de contato nos detalhes da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then as pessoas de contato não são apresentadas

Scenario: Omitir outras opções de data nos detalhes da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then outras opções de data não são apresentadas

Scenario: Visualizar descrição da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then a descrição da conferência é apresentada

Scenario: Visualizar programa da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then o programa da conferência é apresentado

Scenario: Visualizar painel de preços da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then o preço normal é apresentado
And o preço reduzido é apresentado quando aplicável

Scenario: Visualizar disponibilidade da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then a disponibilidade é apresentada como "Cinza - disponibilidade desconhecida"

Scenario: Visualizar reserva de assento da conferência
Given que o usuário selecionou uma conferência encontrada
When os detalhes da conferência são exibidos
Then a reserva de assento é apresentada conforme especificado anteriormente
