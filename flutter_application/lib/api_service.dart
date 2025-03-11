import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl =
      "https://175.106.98.190:3306/auth"; // 실제 API URL로 변경

  // 회원가입 요청 함수
  Future<bool> registerUser(
      String id, String password, String name, String phonenumber) async {
    final url = Uri.parse("$baseUrl/register"); // 실제 엔드포인트로 변경

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        //"Cache-Control": "no-cache",
        //"Postman-Token": "<calculated when request is sent>",
        //"Content-Length": "<calculated when request is sent>",
        //"Host": "<calculated when request is sent>",
        //"User-Agent": "PostmanRuntime/7.43.0",
        "Accept": "*/*",
        //"Accept-Encoding": "gzip, deflate, br",
        //"Connection": "keep-alive",
        // 주석처리 - Postman 설정(JSON 파일 보낼때 필요없음)
      },
      body: jsonEncode({
        "username": id,
        "password": password,
        "name": name,
        "num": phonenumber
      }),
    );

    if (response.statusCode == 200) {
      return true; // 회원가입 성공
    } else {
      return false; // 회원가입 실패
    }
  }
}
// 로그인이나, 회원정보와 같은 요청 함수도 여기에 같이 구현할 예정
