Feature: Exclusão de conta

Scenario: Disponibilizar opção de exclusão de conta nas configurações
Given que o usuário está nas configurações da conta
When o usuário acessa as opções disponíveis
Then o botão "Excluir conta" está disponível

Scenario: Exibir aviso de segurança antes da exclusão da conta
Given que o usuário iniciou o processo de exclusão da conta
When o sistema apresenta as informações da exclusão
Then é exibido um aviso de segurança informando que o processo de exclusão não pode ser desfeito

Scenario: Exibir aviso de proteção de dados antes da exclusão da conta
Given que o usuário iniciou o processo de exclusão da conta
When o sistema apresenta as informações da exclusão
Then é exibido um aviso de proteção de dados sobre o uso posterior dos dados pessoais

Scenario: Confirmar a exclusão da conta
Given que o usuário iniciou o processo de exclusão da conta
When o usuário confirma a exclusão
Then a exclusão da conta é confirmada

Scenario: Excluir todos os dados do usuário após a exclusão da conta
Given que a exclusão da conta foi confirmada
When o processo de exclusão é concluído
Then todos os dados do usuário são excluídos da loja
And os dados pessoais são excluídos
And os pedidos são excluídos
And as listas de acompanhamento são excluídas
And os endereços são excluídos

Scenario: Gerar notificação por e-mail após a exclusão da conta
Given que a exclusão da conta foi confirmada
When o processo de exclusão é concluído
Then a loja gera uma notificação por e-mail para um endereço configurável
