import 'package:flutter/material.dart';

class ProfileGroup extends StatelessWidget {
  final String name;
  final String phoneNumber;

  const ProfileGroup(
      {super.key, required this.name, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
          ),
          SizedBox(height: 10),
          Text(
            '소방공무원',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('이름: $name'),
          Text('전화번호: $phoneNumber'),
          SizedBox(height: 20),
          Text('계정', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('아이디'),
          Text('비밀번호 변경'),
          Text('이메일 변경'),
          SizedBox(height: 20),
          Text('설정', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('모드'),
          Text('알림설정'),
          SizedBox(height: 20),
          Text('기타 등등', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
