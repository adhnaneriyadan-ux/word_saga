import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flame/game.dart';

import 'game.dart';
import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'screens/game_screen.dart';
import 'screens/duel_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5D3FD3)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/map': (context) => const MapScreen(),
        '/game': (context) => const GameScreenUI(),
        '/duel': (context) => const DuelScreen(),
        '/duel_match': (context) => const GameWrapper(),
      },
    );
  }
}

class GameWrapper extends StatelessWidget {
  const GameWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.black, // Flame game background
      extendBodyBehindAppBar: true,
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
                      const Text('Word Saga Duel', style: TextStyle(fontSize: 32)),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          game.overlays.remove('Menu');
                          game.startGame();
                        },
                        child: const Text('Start Matchmaking'),
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
