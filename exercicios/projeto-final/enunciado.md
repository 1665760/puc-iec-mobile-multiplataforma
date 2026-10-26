# Projeto Final em Grupo (30 pts)

**Disciplina:** Arquitetura de Aplicações Móveis e Multiplataforma
**Grupo:** 3 a 4 alunos · **Valor:** 30 pts
**Prazo final:** a **próxima aula (Aula 6)** — ver Canvas
**Apresentação:** demonstração técnica ao vivo de **até 20 minutos** (incluindo perguntas), na Aula 6
**Entrega:** a **URL do repositório do grupo** no GitHub, colada no Canvas

---

## O que é

O grupo constrói **um app mobile** em **Flutter, React Native ou KMP Compose Multiplatform** (os que vocês
usaram nas Atividades 2, 3 e 5) com **5 features** e o apresenta ao vivo.

**Feature = uma funcionalidade que o usuário vê e usa.** Exemplos:

| # | Feature | Exemplo (app de filmes) |
|---|---|---|
| 1 | **Lista** de dados reais | tela inicial com os filmes populares vindos de uma API |
| 2 | **Detalhe** | tocar num filme abre sinopse, nota e elenco |
| 3 | **Busca** | campo de busca que filtra a lista |
| 4 | **Filtro / categoria** | chips de gênero que refinam a lista |
| 5 | **Favoritos** que sobrevivem a fechar o app | marcar ★ e ver na aba "Favoritos" |

Além das 5 features, o app trata **carregando, vazio e erro/sem internet** (mensagem clara, nunca tela branca).

## Escolham um dos dois caminhos

**Opção A — um dos 5 temas prontos.** Todos têm **as mesmas 5 features**; muda só a API e o visual.
Cada tema tem **skeleton** de ponto de partida em `skeletons/<tema>/<framework>/pratica/`
(com `README.md` de setup e os `// TODO` das features).

| # | Tema | Filtro natural | Tipo do id |
|---|------|---|---|
| 1 | **PokeAPI** — Pokédex | `type` | `Int` |
| 2 | **Rick and Morty** — personagens | `status` | `Int` |
| 3 | **TheMealDB** — receitas | `c` (categoria) | `String` |
| 4 | **TheCocktailDB** — drinks | `c` (categoria) | `String` |
| 5 | **Studio Ghibli** — filmes | `director` | `String` |

Detalhes de cada API em [`temas/`](./temas/).

**Opção B — a sua própria API / tema.** Qualquer tema (hábitos, clima, estudo, viagem…), desde que:

1. tenha **no mínimo as mesmas 5 features** da tabela acima (adaptadas ao seu tema);
2. use **dados reais** (API pública, JSON público ou serviço gratuito — não vale lista fixa no código);
3. seja **gratuita**: sem cartão, sem cadastro pago; chave grátis é ok, mas **nunca commitem a chave**.

## Não vale pegar o mesmo trabalho — alinhem entre vocês

Cada combinação **tema + framework** (Opção A) é de **um grupo só**, e temas livres (Opção B) devem ser
diferentes entre si. Para reservar, o grupo abre **uma issue** no repo da disciplina:
`Grupo <nomes> — <tema> + <framework>` (Opção B: `<seu tema> + <framework>` com 2 linhas sobre o app).
Vale a **ordem de chegada** (horário da issue). Antes de abrir a sua, **olhem as issues existentes**.

## Para o app ficar bonito (o mínimo)

- **Design tokens**: cores, tipografia e espaçamento definidos **em um lugar só** (tema)
- **Tema claro e escuro**
- **Loading com skeleton**, não só um spinner solto
- **Imagens** com placeholder e fallback
- **Responsivo**: celular e paisagem
- **Acessibilidade básica**: contraste, alvo de toque ≥ 48dp, ícones com descrição
- **Ícone e splash próprios** do app

## Arquitetura, ADR e testes

- **Camadas separadas**: dados (API/storage), estado/lógica e UI — sem fetch dentro do widget/componente
- **`ADR.md`** (~1 página): por que esse framework, por que esse gerenciador de estado, **que alternativa descartaram e por quê**
- **Testes próprios** (pelo menos 3 casos) para a lógica que vocês criaram — vale **o que decidiram testar**, não existe teste "pra passar"
- **`README.md`** do app: o que faz · **como rodar** (com o `cd` da pasta) · **pelo menos 3 screenshots** · link do `ADR.md`

## Como entregar

1. **Um repositório GitHub do grupo** (fork do repo da disciplina ou repo novo). Público — ou privado com o
   professor (`jacksonsmith`) como *collaborator*. Todos os integrantes entram como *collaborators*.
2. **Trabalhem em branches e PRs internos** no repo do grupo — a **Contribuição individual** olha os commits
   e PRs de **cada** integrante. Tudo commitado por uma pessoa só = o grupo perde esses pontos.
3. **O app fica numa pasta** do repo, com `README.md` e `ADR.md`. (Se usarem skeleton, copiem/editem o da Opção A.)
4. **Abram o repo cedo** e deem push com frequência — o professor acompanha e avisa de problema antes do prazo.
5. **Colem a URL do repo no Canvas** até o prazo e **apresentem na Aula 6**.

> **Critério eliminatório:** se o app **não builda**, ele não pode ser demonstrado — Funcionalidade fica
> **zerada**. Rodem o build local antes de entregar
> (`flutter build apk --debug` · `./gradlew :androidApp:assembleDebug` · `npx expo prebuild` + `./gradlew assembleDebug`).

**Não há autograder:** o professor clona o repo, builda, roda o app e avalia pela rubrica.

## Rubrica (30 pts)

| Critério | Pts |
|---|---|
| **UI/UX** — o checklist "app bonito" + demo | 8 |
| **Arquitetura + ADR** — camadas, estado, coerência com o ADR | 7 |
| **Funcionalidade** — as 5 features, estados de erro, build passando | 6 |
| **Apresentação** — demonstração técnica ao vivo + perguntas | 4 |
| **Contribuição individual** — commits e PRs por integrante | 3 |
| **Qualidade** — testes próprios (≥ 3 casos) + README reprodutível | 2 |

A nota é lançada no Canvas depois da apresentação. A nota individual pode diferir da nota do grupo conforme
a Contribuição individual.

Dúvidas: Teams da turma ou jackson.96@gmail.com.
