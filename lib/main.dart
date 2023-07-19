import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
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
      ),
    ),
  );
}
