# Histórias de Usuário Selecionadas

Este diretório contém o conjunto final de histórias de usuário selecionado para o experimento do TCC **"Geração automática de cenários BDD a partir de histórias de usuário com IA generativa: uma avaliação baseada em atributos de qualidade"**.

## Origem dos dados

As histórias foram extraídas do dataset público **User stories for eCommerce systems**, disponível no Zenodo sob o DOI **10.5281/zenodo.12754330**. O conjunto original contém histórias de usuário reais relacionadas a sistemas de comércio eletrônico.

## Critério de filtragem

Seguindo a orientação metodológica adotada no trabalho, o único critério desclassificatório aplicado foi a ausência de campos obrigatórios. Assim, histórias com os campos necessários preenchidos foram consideradas elegíveis para o sorteio.

## Critério de seleção final

Após a filtragem, as histórias elegíveis foram agrupadas por tipo de funcionalidade. Em seguida, foi realizado sorteio dentro dos grupos funcionais, com o objetivo de compor uma amostra final com diversidade de funcionalidades do domínio de comércio eletrônico.

A amostra final contém **10 histórias de usuário**, contemplando diferentes tipos de funcionalidade, como autenticação/conta, busca/navegação, carrinho, catálogo/produto, pagamento, endereço/entrega, pedido/compra, wishlist/favoritos, administração/gestão e B2B/eProcurement.

## Arquivos

- `user_stories_final.csv`: conjunto final de histórias de usuário selecionadas para o experimento.

## Estrutura do CSV

| Campo | Descrição |
|---|---|
| `id` | Identificador da história no dataset utilizado. |
| `project` | Projeto de origem da história de usuário. |
| `functionality` | Tipo de funcionalidade atribuído durante a classificação. |
| `user_story` | História de usuário no formato textual original. |
| `acceptance_criteria` | Critérios de aceitação associados à história. |

## Observação metodológica

A seleção final deve ser interpretada como uma **seleção aleatória com controle de diversidade funcional**, pois combina sorteio entre histórias elegíveis com a preocupação de evitar concentração excessiva em um único tipo de funcionalidade. Essa estratégia foi adotada para apoiar a avaliação de cenários BDD gerados por modelos de linguagem em diferentes comportamentos esperados de sistemas de e-commerce.
