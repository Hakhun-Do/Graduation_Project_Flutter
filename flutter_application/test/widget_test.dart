import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application/login_page.dart'; // LoginPage 가져오기

void main() {
  // 위젯 테스트를 정의하는 main 함수
  testWidgets('LoginPage 화면에 Register 버튼이 표시되는지 테스트',
      (WidgetTester tester) async {
    // ✅ 앱을 빌드하고 프레임을 트리거
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(),
      ),
    );

    // ✅ "Register" 버튼이 화면에 존재하는지 확인 (대소문자 구별 필요)
    expect(find.text('Register'), findsOneWidget);

    // ✅ "not displayed" 텍스트는 없어야 함
    expect(find.text('not displayed'), findsNothing);
  });
}
