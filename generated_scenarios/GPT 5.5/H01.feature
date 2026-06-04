Feature: Exclusão de conta

Scenario: Disponibilizar opção de exclusão de conta
Given o usuário está nas configurações da conta
When o usuário consulta as opções disponíveis
Then o botão "Excluir conta" está disponível

Scenario: Exibir aviso de segurança antes da exclusão
Given o usuário iniciou o processo de exclusão da conta
When a exclusão da conta é solicitada
Then o sistema exibe um aviso de segurança indicando que o processo de exclusão não pode ser desfeito

Scenario: Exibir aviso de proteção de dados antes da exclusão
Given o usuário iniciou o processo de exclusão da conta
When a exclusão da conta é solicitada
Then o sistema exibe um aviso de proteção de dados sobre o uso posterior dos dados pessoais

Scenario: Confirmar exclusão da conta
Given o usuário iniciou o processo de exclusão da conta
And os avisos de segurança e proteção de dados foram apresentados
When o usuário confirma a exclusão
Then a exclusão da conta é confirmada

Scenario: Excluir dados do usuário da loja
Given o usuário confirmou a exclusão da conta
When a loja processa a exclusão
Then todos os dados do usuário são excluídos da loja
And os dados pessoais, pedidos, listas de acompanhamento e endereços do usuário são excluídos

Scenario: Gerar notificação por e-mail após exclusão
Given o usuário confirmou a exclusão da conta
And existe um endereço de e-mail configurável para notificação
When a loja processa a exclusão
Then a loja gera uma notificação por e-mail para o endereço configurável