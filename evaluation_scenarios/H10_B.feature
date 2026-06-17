Feature: Compartilhamento de lista de desejos

Scenario: Geração e cópia de link de compartilhamento
Given que um usuário logado deseja compartilhar uma lista de desejos
When o usuário aciona a opção "Copiar link"
Then um link é gerado
And o link gerado é copiado para a área de transferência
And uma mensagem toast com "Link copiado para a área de transferência" é exibida