import 'package:flutter/material.dart';
import 'package:flutter_application/login_page.dart';
import 'package:flutter_application/register_page.dart';

void main() => runApp(SobangWabangApp());

class SobangWabangApp extends StatelessWidget {
  const SobangWabangApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //debug 표시 없애는 방법
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/r': (context) => RegisterPage(),
        });
  }
}
