# Geração de Cenários BDD a partir de Histórias de Usuário com IA Generativa

Este repositório contém os artefatos utilizados no TCC **"Geração automática de cenários BDD a partir de histórias de usuário com IA generativa: uma avaliação baseada em atributos de qualidade"**.

O estudo tem como objetivo avaliar a qualidade de cenários BDD em formato Gherkin gerados por IA generativa a partir de histórias de usuário e critérios de aceitação.

## Origem dos dados

As histórias de usuário foram extraídas do dataset público *User stories for eCommerce systems*, disponível no Zenodo sob o DOI `10.5281/zenodo.12754330`. O conjunto original contém 307 histórias de usuário relacionadas a sistemas de comércio eletrônico.

## Processo de seleção

O processo de seleção foi realizado em etapas:

1. **Base original:** 307 histórias de usuário disponíveis no dataset.
2. **Histórias aptas:** 201 histórias após filtragem por presença dos campos necessários, incluindo história de usuário e critérios de aceitação.
3. **Amostra inicial de geração:** 10 histórias selecionadas por sorteio dentro de grupos funcionais, buscando diversidade entre funcionalidades.
4. **Amostra final de avaliação humana:** 6 histórias elegíveis após aplicação do critério operacional de viabilidade.

Após a geração dos cenários pelas duas fontes de IA generativa, foram mantidas para avaliação humana apenas as histórias cujas duas versões geradas resultaram em, no máximo, cinco cenários BDD por conjunto. Esse critério foi adotado para reduzir a carga de avaliação dos participantes e evitar fadiga durante o preenchimento do formulário.

## Estrutura do repositório

* `data/selected_user_stories.csv`: histórias selecionadas na amostra inicial.
* `data/user_stories_experiment.csv`: histórias preparadas para a geração dos cenários.
* `data/eligible_user_stories_evaluation.csv`: 6 histórias elegíveis para avaliação humana.
* `prompt/prompt_zero_shot_final.md`: prompt utilizado na geração dos cenários.
* `generated_scenarios/`: cenários gerados pelas fontes de IA generativa.
* `evaluation_scenarios/`: conjuntos anonimizados utilizados na avaliação humana.

## Observação sobre anonimização

Os conjuntos avaliados foram identificados como A e B para reduzir possíveis vieses relacionados à percepção prévia dos avaliadores sobre as ferramentas utilizadas. A atribuição dos identificadores A e B foi alternada entre as histórias, de modo que eles não correspondem fixamente a uma mesma fonte de geração.

O mapeamento entre os conjuntos anonimizados e as fontes de geração foi mantido como arquivo de controle da pesquisa.
