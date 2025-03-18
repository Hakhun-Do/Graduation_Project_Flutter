import 'package:flutter/material.dart';
import 'mainpage_map_group.dart';
import 'mainpage_chat_group.dart';
import 'mainpage_profile_group.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _classeWidgets = [
    MapGroup(),
    ChatGroup(
      importantGroup: '중요한 내용 1\n중요한 내용 2',
      frequentGroup: '자주가는 내용 1\n자주가는 내용 2',
      popularGroup: '인기 내용 1\n인기 내용 2',
    ),
    ProfileGroup(
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
