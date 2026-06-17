Feature: Compartilhamento de lista de desejos por link

Scenario: Gerar link ao solicitar cópia do link da lista de desejos
Given que o usuário está logado
When o usuário solicita a ação "Copiar link"
Then um link é gerado

Scenario: Copiar link gerado para a área de transferência
Given que o usuário está logado
When o usuário solicita a ação "Copiar link"
Then o link gerado é copiado para a área de transferência

Scenario: Exibir mensagem de confirmação após copiar o link
Given que o usuário está logado
When o usuário solicita a ação "Copiar link"
Then uma mensagem toast com o texto "Link copiado para a área de transferência" é exibida