import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:filmes_flutter/state/favorites.dart';

class FakeCloud implements FavoritesCloud {
  Set<int> saved = {2};
  final changes = StreamController<Set<int>>.broadcast();

  @override
  Stream<Set<int>> watch() async* {
    yield {...saved};
    yield* changes.stream;
  }

  @override
  Future<void> save(Set<int> ids) async {
    saved = {...ids};
    changes.add({...ids});
  }
}

void main() {
  test('carrega, grava, acompanha outra aba e restaura ao remontar', () async {
    final cloud = FakeCloud();
    addTearDown(cloud.changes.close);
    ProviderContainer container() => ProviderContainer(overrides: [
          favoritesCloudProvider.overrideWithValue(cloud),
        ]);
    final first = container();
    addTearDown(first.dispose);
    first.read(favoritesProvider);
    await Future<void>.delayed(Duration.zero);
    expect(first.read(favoritesProvider), {2});

    first.read(favoritesProvider.notifier).toggle(1);
    expect(first.read(favoritesProvider), {1, 2});
    await Future<void>.delayed(Duration.zero);
    expect(cloud.saved, {1, 2});

    final second = container();
    addTearDown(second.dispose);
    second.read(favoritesProvider);
    await Future<void>.delayed(Duration.zero);
    expect(second.read(favoritesProvider), {1, 2});

    await cloud.save({3});
    await Future<void>.delayed(Duration.zero);
    expect(first.read(favoritesProvider), {3});
    expect(second.read(favoritesProvider), {3});

    first.read(favoritesProvider.notifier).clear();
    await Future<void>.delayed(Duration.zero);
    expect(cloud.saved, isEmpty);
    expect(second.read(favoritesProvider), isEmpty);
  });
}
