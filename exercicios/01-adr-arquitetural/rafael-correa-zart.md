# ADR-0001: Stack mobile para catálogo e pedidos de loja de roupas

## Status

`Aceito`

**Data:** 2026-09-22  
**Autor:** Rafael Corrêa Zart

## Contexto

- **Produto:** app de catálogo de roupas, detalhes de produtos, carrinho e criação de pedidos.
- **Público:** clientes de uma loja local, usando Android e iOS.
- **Time:** 3 desenvolvedores com experiência em JavaScript e desenvolvimento web.
- **Restrição:** lançamento inicial em 2 meses, com orçamento limitado.
- **Prioridade:** entregar rapidamente uma experiência consistente, com boa utilização e desempenho em pequena escala; recursos nativos avançados não são essenciais na primeira versão.
- **Escala alvo:** lançamento inicial para uma loja, com arquitetura preparada para futuras lojas e aumento de pedidos.
- **Escopo inicial:** catálogo, detalhes dos produtos, carrinho, pedidos, login e cadastro de clientes.
- **Possibilidade futura:** pagamentos online, caso o prazo permita.

## Decisão

Adotaremos **React Native**, usando uma base de código compartilhada para Android e iOS, porque a equipe já domina JavaScript e precisa entregar o aplicativo em pouco tempo.

## Alternativas consideradas

| Alternativa | Prós | Contras |
|---|---|---|
| **React Native (escolhida)** | Aproveita o conhecimento do time em JavaScript/TypeScript; ecossistema amplo; permite compartilhar a maior parte do código entre Android e iOS | Ainda exige configuração, testes e publicação em duas lojas; alguns recursos podem exigir código nativo | 
| **Flutter** | Uma base de código e widgets consistentes; bom desempenho para interfaces multiplataforma | Exige aprender Dart, consumindo tempo do projeto; a equipe já domina JavaScript | 
| **Kotlin Multiplatform** | Compartilha parte das regras de negócio; permite interfaces nativas | Curva de aprendizado ainda maior e configuração mais complexa para o prazo disponível | 
| **Nativo (Kotlin + Swift)** | Melhor integração com cada plataforma e alto controle de desempenho | Exige duas bases de código e pouco tempo para implementação | 
| **PWA** | Aproveita conhecimentos web e tem distribuição simples | Não atende tão bem à prioridade de desempenho e à experiência de aplicativo mobile definidas para o projeto | 

## Consequências

**Positivas:**

- O time pode reutilizar conhecimentos de JavaScript/TypeScript e padrões de desenvolvimento web.
- A maior parte das telas, regras de negócio e integrações será compartilhada entre Android e iOS.
- O prazo de dois meses fica mais viável do que com duas implementações nativas independentes.
- A aplicação poderá ser publicada nas lojas e evoluir para pagamentos online se houver tempo.

**Negativas:**

- Será necessário manter toolchains e processos de publicação para as duas lojas.
- Dependências nativas e diferenças de plataforma podem exigir ajustes específicos em Android ou iOS.
- A equipe deverá investir em testes nos dois sistemas e revisar a decisão se surgirem requisitos de hardware ou desempenho avançados.
- Será necessário aprender particularidades do React Native durante o desenvolvimento.

## Referências

- META. **React Native — Getting Started**. Documentação oficial. Disponível em: https://reactnative.dev/docs/getting-started. Acesso em: 22 set. 2026.
- CHARLAND, A.; LEROUX, B. *Mobile Application Development: Web vs. Native*. Communications of the ACM, v. 54, n. 5, 2011. Disponível em: https://queue.acm.org/detail.cfm?id=1968203. Acesso em: 22 set. 2026.
