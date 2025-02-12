import 'package:flutter/material.dart';
import 'screens.dart'; // screens.dart 파일을 임포트합니다.

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          RegisterGroup(), // RegisterGroup 위젯을 호출합니다.
        ]),
      ),
    );
  }
}
