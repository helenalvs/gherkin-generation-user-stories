Feature: Cadastro e login para acesso a dados de cliente

Scenario: Exibição de opções de autenticação no checkout
Given que um usuário anônimo acessa o site
When o usuário aciona o Checkout
Then a página com opções de login e cadastro é exibida

Scenario: Habilitação da inserção de endereço do checkout
Given que a página de opções de login e cadastro é exibida
When o usuário aciona a ação "Vamos lá"
Then o usuário pode inserir o endereço do checkout

Scenario: Exibição correta da nomenclatura do campo de e-mail
Given que a página com opções de cadastro é exibida
Then o campo correspondente deve exibir "E-mail" corretamente

Scenario: Interceptação de entradas de e-mail incorretas
Given que o usuário interage com o campo de e-mail
When o usuário insere um e-mail com formato incorreto
Then a caixa de texto de e-mail intercepta a entrada por meio de um validador de e-mail

Scenario: Exibição de mensagens de erro genéricas por segurança
Given que o usuário tenta se cadastrar
When uma informação incorreta é detectada
Then uma mensagem de erro com formatação genérica é exibida
And a mensagem de erro não indica exatamente qual campo está incorreto

Scenario: Exibição de campos adicionais ao prosseguir com o cadastro
Given que o usuário preenche as informações iniciais
When o usuário aciona a ação de Cadastrar
Then a máscara de endereço anterior é exibida
And o campo de senha é exibido
And o campo de repetição da senha é exibido

Scenario: Exibição do endereço preenchido após o cadastro
Given que o usuário fornece suas informações de registro
When o cadastro é bem-sucedido
Then uma máscara de endereço é exibida
And a máscara é preenchida com todos os dados anteriores do cliente

Scenario: Salvamento dos dados e viabilização de acesso
Given que o usuário preenche o formulário de cadastro
When o usuário insere os dados
Then os dados são salvos no banco de dados
And o login passa a ser possível com os dados fornecidos

Scenario: Notificação por e-mail para confirmação de titularidade
Given que o usuário preenche o formulário de cadastro
When o usuário insere os dados
Then o cliente recebe um e-mail com textos padrão solicitando a confirmação de que é o destinatário correto
And o cliente é informado de que só poderá continuar com os dados cadastrados após confirmar o e-mail

Scenario: Prazo de manutenção do registro de cadastro
Given que um cadastro é iniciado no sistema
Then o cadastro é mantido por 7 dias

Scenario: Autenticação no carrinho após a confirmação de e-mail
Given que o cliente possui um cadastro pendente de validação
When o cliente confirma o e-mail
Then o cliente é direcionado para a área de login no carrinho
And o cliente deve fazer login
And o cliente continua como usuário autenticado