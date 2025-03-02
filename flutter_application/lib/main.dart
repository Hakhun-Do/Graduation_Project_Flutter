import 'package:flutter/material.dart';
import 'loginpage.dart';

void main() {
  // 앱을 실행하는 main 함수
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp 위젯을 반환하여 앱의 테마와 홈 화면을 설정
    return MaterialApp(
      // 다크 테마를 사용하고 배경색을 설정
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        // ListView를 사용하여 스크롤 가능한 목록을 생성
        body: ListView(children: [
          MainGroup(), // MainGroup 위젯을 호출하여 목록에 추가
        ]),
      ),
    );
  }
}
