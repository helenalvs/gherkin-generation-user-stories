Feature: Solicitação de preço para títulos sem preço

Scenario: Opções exibidas para usuário logado em título sem preço
Given que um usuário está logado
When o usuário acessa um título sem preço
Then o botão Solicitar preço é disponibilizado
And o botão do carrinho de compras permanece oculto

Scenario: Acesso ao formulário de solicitação de preço
Given que um usuário logado acessa um título sem preço
When o usuário aciona o botão Solicitar preço
Then o formulário é exibido como uma sobreposição
And o texto do formulário é apresentado pré-preenchido

Scenario: Envio da solicitação de preço
Given que um usuário logado visualiza o formulário de solicitação de preço
When o usuário envia o formulário
Then um e-mail com as informações necessárias é enviado para o destinatário configurado
And um feedback sobre o envio é exibido ao usuário

Scenario: Opções exibidas para usuário não logado em título sem preço
Given que um usuário não está logado
When o usuário acessa um título sem preço
Then uma mensagem com possível link para cadastro é exibida
And o botão do carrinho de compras permanece oculto