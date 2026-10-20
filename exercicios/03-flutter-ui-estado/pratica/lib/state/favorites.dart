import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FavoritesCloud {
  Stream<Set<int>> watch();
  Future<void> save(Set<int> ids);
}

class FirestoreFavorites implements FavoritesCloud {
  final DocumentReference<Map<String, dynamic>> _doc =
      FirebaseFirestore.instance.doc('favorites/meus-favoritos');

  @override
  Stream<Set<int>> watch() => _doc.snapshots().map((snapshot) {
        final ids = snapshot.data()?['ids'] as List<dynamic>? ?? [];
        return ids.map((id) => (id as num).toInt()).toSet();
      });

  @override
  Future<void> save(Set<int> ids) => _doc.set({'ids': ids.toList()});
}

final favoritesCloudProvider = Provider<FavoritesCloud?>((ref) =>
    Firebase.apps.isEmpty ? null : FirestoreFavorites());

class FavoritesNotifier extends Notifier<Set<int>> {
  @override
  Set<int> build() {
    final cloud = ref.watch(favoritesCloudProvider);
    final subscription = cloud?.watch().listen(
      (ids) => state = ids,
      onError: (Object error) => debugPrint('Firestore (ler): $error'),
    );
    ref.onDispose(() => subscription?.cancel());
    return {};
  }

  void toggle(int id) {
    state = state.contains(id) ? ({...state}..remove(id)) : {...state, id};
    unawaited(_persist({...state}));
  }

  void clear() {
    state = {};
    unawaited(_persist({}));
  }

  Future<void> _persist(Set<int> ids) async {
    try {
      await ref.read(favoritesCloudProvider)?.save(ids);
    } catch (error) {
      debugPrint('Firestore (gravar): $error');
    }
  }
}

final favoritesProvider =
    NotifierProvider<FavoritesNotifier, Set<int>>(FavoritesNotifier.new);
