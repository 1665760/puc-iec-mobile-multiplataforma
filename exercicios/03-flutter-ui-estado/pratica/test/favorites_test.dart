import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmes_flutter/state/favorites.dart';

void main() {
  test('favoritos: toggle adiciona e remove, clear esvazia todos', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final notifier = container.read(favoritesProvider.notifier);

    expect(container.read(favoritesProvider), isEmpty);
    notifier.toggle(1);
    expect(container.read(favoritesProvider), equals({1}));
    notifier.toggle(2);
    expect(container.read(favoritesProvider), equals({1, 2}));
    notifier.toggle(1);
    expect(container.read(favoritesProvider), equals({2}));
    notifier.toggle(2);
    expect(container.read(favoritesProvider), isEmpty);

    notifier.toggle(1);
    notifier.toggle(2);
    notifier.clear();
    expect(container.read(favoritesProvider), isEmpty);
    notifier.clear();
    expect(container.read(favoritesProvider), isEmpty);
  });
}
