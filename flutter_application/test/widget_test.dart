import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// screens.dart 파일 임포트
// ignore: depend_on_referenced_packages
import 'package:flutter_application/loginpage.dart';

void main() {
  // 위젯 테스트를 정의하는 main 함수
  testWidgets('RegisterGroup displays register text',
      (WidgetTester tester) async {
    // 앱을 빌드하고 프레임을 트리거
    await tester.pumpWidget(MaterialApp(home: MainGroup()));

    // "register" 텍스트가 표시되는지 확인
    expect(find.text('register'), findsOneWidget);
    // "not displayed" 텍스트가 표시되지 않는지 확인
    expect(find.text('not displayed'), findsNothing);
  });
}
