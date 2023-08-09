import 'package:dart_rps_game/game/enum.dart';
import 'package:flutter/material.dart';

class GameResult extends StatelessWidget {
  final bool isDone;
  final Result? result;
  final VoidCallback callback;

  const GameResult(
      {required this.isDone, required this.callback, this.result, super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result!.displayString,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            onPressed: () => callback.call(),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '다시하기',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return const Center(
      child: Text(
        '가위 바위 보 중 하나를 선택 해 주세요.',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
