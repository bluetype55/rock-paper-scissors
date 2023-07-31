import 'package:dart_rps_game/game/enum.dart';
import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final bool isDone;

  const UserInput({required this.isDone, super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return const Placeholder();
    }
    return Row(
      children: _getInputs(),
    );
  }

  List<Widget> _getInputs() {
    return InputType.values
        .map(
          (type) => Expanded(
            child: Container(
              child: Image.asset(type.path),
            ),
          ),
        )
        .toList();
  }
}
