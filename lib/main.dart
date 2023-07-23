import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock, Paper, Scissors',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('가위 바위 보'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
          ),
        ),
      ),
    );
  }
}
