import 'package:flutter/material.dart';
import 'Big_Map_Group.dart';
import 'Big_Chat_Group.dart';
import 'Big_My_Group.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _classeWidgets = [
    BigMapGroup(),
    BigChatGroup(
      importantGroup: '중요한 내용 1\n중요한 내용 2',
      frequentGroup: '자주가는 내용 1\n자주가는 내용 2',
      popularGroup: '인기 내용 1\n인기 내용 2',
    ),
    BigMyGroup(
      name: '홍길동',
      phoneNumber: '010-1234-5678',
    ),
  ];

  void _changeClass(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('클래스 변경 예제'),
      ),
      body: Center(
        child: _classeWidgets[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '프로필',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _changeClass,
      ),
    );
  }
}
