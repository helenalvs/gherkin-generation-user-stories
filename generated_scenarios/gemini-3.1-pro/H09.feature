Feature: Visualização de detalhes da conferência

Scenario: Visualizar as informações principais da conferência
Given o usuário encontra uma conferência
When o usuário acessa os detalhes da conferência
Then a página de detalhes exibe a capa e a categoria
And a página de detalhes exibe a mídia e a página de impressão ao lado
And a página de detalhes exibe o endereço e o período ou horário
And a página de detalhes omite as pessoas de contato
And a página de detalhes exibe o organizador da conferência
And a página de detalhes omite outras opções de data
And a página de detalhes exibe a descrição
And a página de detalhes exibe o programa
And a página de detalhes exibe a disponibilidade como cinza para disponibilidade desconhecida
And a página de detalhes exibe a reserva de assento

Scenario: Visualizar o painel de preço para conferência com preço reduzido aplicável
Given o usuário encontra uma conferência com preço reduzido aplicável
When o usuário acessa os detalhes da conferência
Then o painel de preço exibe o preço normal
And o painel de preço exibe o preço reduzido

Scenario: Visualizar o painel de preço para conferência sem preço reduzido aplicável
Given o usuário encontra uma conferência sem preço reduzido aplicável
When o usuário acessa os detalhes da conferência
Then o painel de preço exibe apenas o preço normal