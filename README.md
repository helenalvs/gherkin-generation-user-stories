# Histórias de Usuário Selecionadas

Este repositório contém os artefatos utilizados no TCC **"Geração automática de cenários BDD a partir de histórias de usuário com IA generativa: uma avaliação baseada em atributos de qualidade"**. Incluindo as histórias de usuário selecionadas, o prompt zero-shot, os cenários BDD/Gherkin gerados, os conjuntos anonimizados e os arquivos de apoio à avaliação humana.

## Origem dos dados

As histórias foram extraídas do dataset público **User stories for eCommerce systems**, disponível no Zenodo sob o DOI **10.5281/zenodo.12754330**. O conjunto original contém histórias de usuário reais relacionadas a sistemas de comércio eletrônico.

## Critério de filtragem

Seguindo a orientação metodológica adotada no trabalho, o único critério desclassificatório aplicado foi a ausência de campos obrigatórios. Assim, histórias com os campos necessários preenchidos foram consideradas elegíveis para o sorteio.

## Critério de seleção final

Após a filtragem, foi composta uma amostra inicial de 10 histórias por sorteio dentro de grupos funcionais. Após a geração dos cenários por duas fontes de IA generativa, foi aplicado um critério operacional de viabilidade: foram mantidas para avaliação humana apenas as histórias cujas duas versões geradas resultaram em até cinco cenários BDD por conjunto.

## Arquivos principais

- `data/selected_user_stories.csv`: histórias selecionadas após filtragem e sorteio por grupos funcionais.
- `data/user_stories_experiment.csv`: histórias preparadas para a geração dos cenários BDD.
- `prompt/prompt_zero_shot_final.md`: prompt utilizado para geração dos cenários.
- `generated_scenarios/`: cenários gerados pelas duas fontes de IA generativa.
- `anonymized_scenarios/`: cenários anonimizados em conjuntos A/B.

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
