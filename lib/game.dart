import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WordSagaGame extends FlameGame with TapCallbacks {
  late TextComponent statusText;
  late String matchId;
  String? opponentId;
  String playerId = "player_${Random().nextInt(10000)}";
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final supabase = Supabase.instance.client;

  bool isPlaying = false;
  int myPoints = 0;
  int opponentPoints = 0;
  String targetWord = "";
  List<String> currentGuess = [];

  @override
  Future<void> onLoad() async {
    statusText = TextComponent(
      text: 'Loading...',
      textRenderer: TextPaint(
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
    )..position = Vector2(size.x / 2, size.y / 2)
     ..anchor = Anchor.center;

    add(statusText);
  }

  void startGame() {
    statusText.text = 'Searching for opponent...';
    findMatch();
  }

  void findMatch() async {
    final matchesRef = dbRef.child('matches');
    final snapshot = await matchesRef.get();

    bool found = false;
    if (snapshot.exists) {
      final matches = snapshot.value as Map<dynamic, dynamic>;
      for (var entry in matches.entries) {
        if (entry.value['status'] == 'waiting') {
          matchId = entry.key;
          opponentId = entry.value['player1'];
          await matchesRef.child(matchId).update({
            'status': 'playing',
            'player2': playerId,
            'word': 'FLUTTER', // In a real game, fetch from Supabase
          });
          found = true;
          break;
        }
      }
    }

    if (!found) {
      final newMatch = matchesRef.push();
      matchId = newMatch.key!;
      await newMatch.set({
        'status': 'waiting',
        'player1': playerId,
      });
      statusText.text = 'Waiting for opponent...';
    } else {
      setupGame();
    }

    dbRef.child('matches').child(matchId).onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      if (data != null && data['status'] == 'playing' && !isPlaying) {
        targetWord = data['word'];
        setupGame();
      }
      if (data != null && data['winner'] != null) {
          endGame(data['winner'] == playerId);
      }
    });
  }

  void setupGame() {
    isPlaying = true;
    statusText.text = 'Target: $targetWord\nTap to score!';
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (isPlaying) {
      myPoints++;
      dbRef.child('matches').child(matchId).child('points_$playerId').set(myPoints);

      statusText.text = 'Target: $targetWord\nPoints: $myPoints';

      if (myPoints >= targetWord.length * 2) {
         dbRef.child('matches').child(matchId).child('winner').set(playerId);
      }
    }
  }

  void endGame(bool won) {
    isPlaying = false;
    statusText.text = won ? 'You Won!' : 'You Lost!';
    Future.delayed(const Duration(seconds: 3), () {
      overlays.add('Menu');
    });
  }
}
