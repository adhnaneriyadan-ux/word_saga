import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'game.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Saga',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GameWrapper(),
    );
  }
}

class GameWrapper extends StatelessWidget {
  const GameWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: WordSagaGame(),
        overlayBuilderMap: {
          'Menu': (context, WordSagaGame game) {
            return Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Word Saga', style: TextStyle(fontSize: 32)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          game.overlays.remove('Menu');
                          game.startGame();
                        },
                        child: const Text('Play Duel Mode'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        },
        initialActiveOverlays: const ['Menu'],
      ),
    );
  }
}
