import 'package:dart_rps_game/game/game_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RPSApp());
}

class RPSApp extends StatelessWidget {
  const RPSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('가위 바위 보!'),
          centerTitle: true,
        ),
        body: const GameBody(),
      ),
    );
  }
}
