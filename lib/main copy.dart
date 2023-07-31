import 'package:flutter/material.dart';

void main() {
  runApp(
    const RockPaperScissorsApp(),
  );
}

class RockPaperScissorsApp extends StatelessWidget {
  const RockPaperScissorsApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rock, Paper, Scissors',
      home: RockPaperScissorsPage(),
      //const RockPaperScissorsPage(),
    );
  }
}

class RockPaperScissorsPage extends StatefulWidget {
  const RockPaperScissorsPage({
    super.key,
  });

  @override
  State<RockPaperScissorsPage> createState() => _RockPaperScissorsPageState();
}

class _RockPaperScissorsPageState extends State<RockPaperScissorsPage> {
  String? userChoice = '가위';
  // 기본값은 가위로 설정
  String? cpuChoice = '바위';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가위 바위 보'),
        centerTitle: true,
      ),
      body: RockPaperScissorsField(
        userChoice: '가위',
        cpuChoice: '바위',
        onUserChoiceChanged: (choice) {
          setState(
            () {
              userChoice = choice;
            },
          );
        },
      ),
    );
  }
}

class RockPaperScissorsField extends StatefulWidget {
  final String? userChoice;
  final String? cpuChoice;
  final ValueChanged<String>? onUserChoiceChanged;

  const RockPaperScissorsField({
    super.key,
    this.userChoice,
    this.cpuChoice,
    this.onUserChoiceChanged,
  });

  @override
  State<RockPaperScissorsField> createState() => _RockPaperScissorsFieldState();
}

class _RockPaperScissorsFieldState extends State<RockPaperScissorsField> {
  @override
  Widget build(BuildContext context) {
    String rpsResult(userChoice, cpuChoice) {
      if (userChoice == cpuChoice) {
        return '비겼습니다.';
      } else if ((userChoice == '가위' && cpuChoice == '보') ||
          (userChoice == '바위' && cpuChoice == '가위') ||
          (userChoice == '보' && cpuChoice == '바위')) {
        return '이겼습니다.';
      } else {
        return '졌습니다.';
      }
    }

    String lastResult = rpsResult(widget.userChoice, widget.cpuChoice);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RpsState(rpsState: '가위', onTap: widget.onUserChoiceChanged),
                RpsState(rpsState: '바위', onTap: widget.onUserChoiceChanged),
                RpsState(rpsState: '보', onTap: widget.onUserChoiceChanged),
              ],
            ),
            const SizedBox(height: 30),
            const Text('user'),
            RpsChoices(
              newVariable: widget.userChoice,
            ),
            const SizedBox(height: 10),
            const Text('cpu'),
            RpsChoices(
              newVariable: widget.cpuChoice,
            ),
            const SizedBox(height: 30),
            const Text('결과'),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Text(lastResult),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RpsState extends StatelessWidget {
  final String? rpsState;
  final ValueChanged<String>? onTap;

  const RpsState({
    super.key,
    this.rpsState,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(rpsState!);
        }
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('$rpsState'),
        ),
      ),
    );
  }
}

class RpsChoices extends StatelessWidget {
  final String? newVariable;

  Icon iconInvertor(newVariable) {
    if (newVariable == '보') {
      return const Icon(Icons.back_hand);
    } else if (newVariable == '가위') {
      return const Icon(Icons.cut);
    } else {
      return const Icon(Icons.sports_mma);
    }
  }

  const RpsChoices({
    super.key,
    this.newVariable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: iconInvertor(newVariable),
      ),
    );
  }
}
