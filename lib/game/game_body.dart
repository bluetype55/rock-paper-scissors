import 'dart:math';

import 'package:dart_rps_game/game/enum.dart';
import 'package:dart_rps_game/game/widget/cpu_input.dart';
import 'package:dart_rps_game/game/widget/game_result.dart';
import 'package:dart_rps_game/game/widget/user_input.dart';
import 'package:flutter/material.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  late InputType? _userInput;
  late InputType _cpuInput;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDone = false;
    final InputType cpuInput;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: isDone, cpuInput: _cpuInput)),
        Expanded(child: GameResult(isDone: isDone)),
        Expanded(child: UserInput(isDone: isDone, callback: setUsetInput)),
      ],
    );
  }

  void setUsetInput(InputType userInput) {
    setState(() {
      isDone = true;
      _userInput = userInput;
    });
  }

  void setCpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }
}
