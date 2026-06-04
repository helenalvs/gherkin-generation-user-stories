Feature: Exclusão de conta

Scenario: Disponibilidade do botão de exclusão
Given o acesso do usuário ao sistema
When as configurações são acessadas
Then o botão de excluir conta está disponível

Scenario: Exibição de avisos e solicitação de confirmação
Given o acesso às configurações
When o botão de excluir conta é acionado
Then o aviso de segurança indicando que o processo não pode ser desfeito é exibido
And o aviso de proteção de dados sobre o uso posterior dos dados pessoais é exibido
And a confirmação da exclusão é solicitada

Scenario: Processamento da exclusão e notificação
Given a solicitação de confirmação de exclusão
When a exclusão da conta é confirmada
Then todos os dados do usuário são excluídos da loja
And a loja gera uma notificação por e-mail para um endereço configurável