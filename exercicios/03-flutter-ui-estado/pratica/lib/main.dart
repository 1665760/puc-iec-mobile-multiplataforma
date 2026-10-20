// lib/main.dart — ponto de entrada do app.
//
// ProviderScope = a "raiz" do Riverpod (deixa qualquer widget ler providers).
// Você NÃO precisa mexer aqui.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/key_value_store.dart';
import 'firebase_options.dart';
import 'state/movies_provider.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final options = DefaultFirebaseOptions.currentPlatform;
  final configured = options.apiKey.isNotEmpty &&
      options.appId.isNotEmpty && options.projectId.isNotEmpty;
  if (configured) {
    await Firebase.initializeApp(options: options);
    FirebaseFirestore.instance.settings =
        const Settings(persistenceEnabled: true);
  }
  runApp(ProviderScope(
    overrides: [storeProvider.overrideWithValue(SharedPrefsStore(prefs))],
    child: MovieApp(firebaseConfigured: configured),
  ));
}

class MovieApp extends StatelessWidget {
  final bool firebaseConfigured;
  const MovieApp({super.key, this.firebaseConfigured = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF003366),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Column(
          children: [
            if (!firebaseConfigured)
              const SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Firebase não configurado: favoritos apenas nesta sessão.'),
                ),
              ),
            const Expanded(child: HomeScreen()),
          ],
        ),
      ),
    );
  }
}
