Feature: Solicitação de preço para títulos sem preço

Scenario: Exibir botão de solicitação de preço para usuário logado
Given um usuário está logado
And o título não possui preço
When o usuário visualizar o título
Then o botão "Solicitar preço" é exibido

Scenario: Exibir formulário de solicitação de preço em sobreposição
Given um usuário está logado
And o título não possui preço
When o usuário solicitar o preço do título
Then o formulário é exibido como uma sobreposição

Scenario: Exibir texto pré-preenchido no formulário de solicitação
Given um usuário está logado
And o formulário de solicitação de preço está aberto
When o usuário visualizar o formulário
Then o texto do formulário é exibido pré-preenchido

Scenario: Enviar solicitação de preço por e-mail
Given um usuário está logado
And o formulário de solicitação de preço está preenchido
When o usuário enviar a solicitação
Then um e-mail é enviado para o destinatário configurado
And o e-mail contém todas as informações necessárias

Scenario: Exibir feedback após envio da solicitação
Given um usuário está logado
And o formulário de solicitação de preço está preenchido
When o usuário enviar a solicitação
Then um feedback é exibido ao usuário

Scenario: Exibir mensagem para usuário não logado
Given um usuário não está logado
And o título não possui preço
When o usuário visualizar o título
Then uma mensagem é exibida ao usuário

Scenario: Ocultar botão do carrinho de compras
Given um usuário visualiza um título sem preço
When o título é exibido
Then o botão do carrinho de compras permanece oculto

Scenario: Exibir formulário de forma responsiva
Given um usuário está logado
And o formulário de solicitação de preço está aberto
When o formulário for exibido em diferentes tamanhos de tela
Then o formulário é apresentado de forma responsiva
