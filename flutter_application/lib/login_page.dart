import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 아이디와 비밀번호를 입력받기 위한 컨트롤러
    final TextEditingController idController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 32, 47),
      appBar: AppBar(
        title: const Text('소방와방 Login Page'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 212, 223, 228),
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 400, // ✅ 직사각형 크기 설정
              height: 350,
              padding: const EdgeInsets.all(20), // 내부 여백 추가
              decoration: BoxDecoration(
                color: Colors.white, // ✅ 직사각형 배경색
                borderRadius: BorderRadius.circular(12), // ✅ 모서리 둥글게
                border:
                    Border.all(color: Colors.black, width: 2), // ✅ 검은색 테두리 추가
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey, // ✅ 그림자 효과
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // ✅ 내용에 맞게 크기 조절
                children: [
                  // 이미지 추가
                  Image.asset(
                    'assets/login.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),

                  // 아이디 입력
                  TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 비밀번호 입력
                  TextField(
                    controller: passwordController,
                    obscureText: true, // 비밀번호 숨기기
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ✅ 로그인 & 회원가입 버튼을 같은 행(Row)에 배치
                  Row(
                    children: [
                      // 로그인 버튼
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            String id = idController.text;
                            String password = passwordController.text;

                            if (id == 'user' && password == 'password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Login Successful')));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Invalid ID or Password')));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // 버튼 간격

                      // 회원가입 버튼
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/r');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
