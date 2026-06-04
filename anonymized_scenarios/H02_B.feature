Feature: Cadastro e login no checkout

Scenario: Exibir opções de login e cadastro após iniciar o checkout
Given que o usuário é anônimo
When o usuário acessa o checkout
Then a página com opções de login e cadastro é exibida

Scenario: Permitir inserção do endereço do checkout
Given que a página com opções de login e cadastro está exibida
When o usuário clica em "Vamos lá"
Then o usuário pode inserir o endereço do checkout

Scenario: Exibir formulário de cadastro com campos adicionais
Given que o usuário está no fluxo de cadastro
When o usuário clica em "Cadastrar"
Then a máscara de endereço anterior é exibida
And o campo de senha é exibido
And o campo de repetição da senha é exibido

Scenario: Exibir o rótulo correto do campo de e-mail
Given que o formulário de cadastro está exibido
Then o campo de e-mail exibe o texto "E-mail"

Scenario: Validar entradas incorretas no campo de e-mail
Given que o formulário de cadastro está exibido
When o usuário informa um e-mail inválido
Then a entrada incorreta é interceptada por um validador de e-mail

Scenario: Exibir mensagem de erro segura para cadastro incorreto
Given que existe um cadastro incorreto
When o sistema identifica o erro
Then a mensagem "Cadastro incorreto" é exibida
And a mensagem não indica exatamente qual campo está incorreto

Scenario: Salvar dados cadastrais e permitir login após cadastro
Given que o usuário informou os dados de cadastro
When o cadastro é concluído
Then os dados são salvos no banco de dados
And o login passa a ser possível com esses dados

Scenario: Enviar e-mail de confirmação após cadastro
Given que o cadastro foi concluído
When os dados são processados
Then o cliente recebe um e-mail para confirmar que é o destinatário correto

Scenario: Informar necessidade de confirmação de e-mail
Given que o cadastro foi concluído
Then o cliente é informado de que só poderá continuar com os dados cadastrados após confirmar o e-mail

Scenario: Manter cadastro por sete dias
Given que o cadastro foi concluído
Then o cadastro é mantido por 7 dias

Scenario: Incluir textos padrão na comunicação de confirmação
Given que a comunicação de confirmação é enviada
Then textos padrão são incluídos nessa comunicação

Scenario: Direcionar cliente para login após confirmação de e-mail
Given que o cliente confirmou o e-mail
When a confirmação é concluída
Then o cliente é direcionado para a área de login no carrinho

Scenario: Continuar como usuário autenticado após login
Given que o cliente confirmou o e-mail
And o cliente está na área de login do carrinho
When o cliente realiza o login
Then o cliente continua como usuário autenticado