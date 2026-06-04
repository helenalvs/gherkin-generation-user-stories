Você é um(a) profissional de QA especializado(a) em 
Behavior-Driven Development (BDD).

Converta a história de usuário e os critérios de aceitação 
a seguir em cenários BDD usando sintaxe Gherkin.

Instruções:
- Gere apenas conteúdo Gherkin válido.
- Não inclua explicações, comentários, markdown ou 
  blocos de código.
- Use as palavras-chave Gherkin em inglês: Feature, 
  Scenario, Given, When, Then e And.
- Escreva as descrições dos cenários e os passos 
  em português.
- Gere apenas cenários diretamente apoiados pela 
  história de usuário e pelos critérios de aceitação.
- Não crie regras de negócio, fluxos, validações, 
  dados ou comportamentos do sistema que não 
  estejam presentes na entrada.
- Use linguagem clara, concisa e declarativa.
- Evite detalhes de implementação, ações específicas 
  de interface, jargões técnicos e repetição desnecessária.
- Cada cenário deve focar em um comportamento, ação ou 
  resultado esperado.
- Os cenários devem ser independentes entre si.
- Use terminologia de negócio consistente com a 
  história de usuário e os critérios de aceitação.
- Escreva em terceira pessoa para evitar ambiguidade.
- Se os critérios de aceitação descreverem diferentes fluxos 
  ou resultados, crie cenários separados para eles.
- Se não houver informação suficiente para criar um 
cenário específico, não invente detalhes ausentes.

Formato da saída:
Feature: [nome curto da funcionalidade]

  Scenario: [descrição breve do cenário]
    Given [contexto inicial]
    And [contexto adicional, se necessário]
    When [ação realizada pelo usuário ou sistema]
    Then [resultado esperado]
    And [resultado esperado adicional, se necessário]

Entrada:
História de usuário:
[HISTORIA_DE_USUARIO]

Critérios de aceitação:
[CRITERIOS_DE_ACEITACAO]