# Atividade 3 — Filmes em Flutter

Aluno: Rafael Corrêa Zart.

Catálogo com cinco filmes locais, cards com título, nota e ano, coração para
favoritar, contador no cabeçalho e botão para limpar os favoritos.
Não precisa de API, token ou emulador para executar no navegador.
Os favoritos ficam em memória durante a execução do app.

## Como rodar

Com o Flutter instalado, execute nesta pasta:

```bash
flutter pub get
flutter run -d chrome
```

Para usar o Edge, execute `flutter run -d edge`. Se houver erro na conexão
do depurador, execute `flutter run -d web-server --web-port=8080` e abra
`http://localhost:8080` manualmente no navegador (depuração limitada nesse modo).

## Como validar

```bash
flutter test
flutter analyze
```

Os testes de widgets verificam os cards e a integração entre favoritos, contador
e limpeza. O teste em `test/favorites_test.dart` usa `ProviderContainer` para
verificar o estado inicial, adição, remoção e limpeza de múltiplos favoritos.
Os arquivos `app_test.dart` e `checklist_test.dart` foram preservados.

## Por que usar um provider?

O Riverpod mantém os favoritos em uma única fonte de estado, acessível pelos
cards e pelo cabeçalho sem passar dados e callbacks por cada widget intermediário
(prop drilling). Com `ref.watch`, a interface acompanha as mudanças do provider;
com `ref.read(favoritesProvider.notifier)`, os botões executam as ações de
favoritar e limpar. Assim, novas telas podem consumir o mesmo estado sem mudar
os construtores de toda a árvore, e as regras podem ser testadas isoladamente
com `ProviderContainer`.

## Entrega

As alterações estão em `exercicios/03-flutter-ui-estado/pratica/`.
A entrega é por Pull Request, com o link informado no Canvas.
Não incluir `.dart_tool/`, `build/` ou `pubspec.lock` no commit.
