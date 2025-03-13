import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  static const String baseUrl =
      "http://175.106.98.190:1040/auth"; // 실제 API URL로 변경
  final FlutterSecureStorage storage = FlutterSecureStorage();

  // 회원가입 요청 함수
  Future<Map<String, dynamic>> registerUser(
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
      },
      // 주석처리 - Postman 설정(JSON 파일 보낼때 필요없음)
      body: jsonEncode({
        "username": id,
        "password": password,
        "name": name,
        "num": phonenumber
      }),
    );

    if (response.statusCode == 200) {
      return {"success": true}; // 회원가입 성공
    } else if (response.statusCode == 409) {
      // 409 CONFLICT → 서버에서 예외 메시지를 보냄
      String errorMessage = utf8.decode(response.bodyBytes); // 한글 깨짐 방지
      return {
        "success": false,
        "error": errorMessage,
      };
    } else {
      // 기타 오류
      return {
        "success": false,
        "error": "회원가입 중 오류가 발생했습니다. 다시 시도해주세요.",
      };
    }
  }

  // 로그인 요청 함수(JWT 토큰 저장)
  Future<Map<String, dynamic>> loginUser(String id, String password) async {
    final url = Uri.parse("$baseUrl/login"); // 실제 엔드포인트로 변경

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "*/*",
      },
      body: jsonEncode({
        "username": id,
        "password": password,
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      String responseBody = response.body.trim(); // 응답 문자열 정리
      if (responseBody.startsWith("Bearer ")) {
        String token = responseBody.substring(7); // "Bearer " 부분 제거

        // 토큰 저장
        await storage.write(key: "auth_token", value: token);
        return {"success": true, "token": token};
      } else {
        return {"success": false, "error": "토큰 형식이 올바르지 않습니다."};
      }
    } else if (response.statusCode == 409) {
      // 409 CONFLICT → 서버에서 예외 메시지를 보냄

      return {
        "success": false,
        "error": "로그인 실패: 아이디 또는 비밀번호가 올바르지 않습니다.",
      };
    } else {
      // 기타 오류
      return {
        "success": false,
        "error": "로그인 중 오류가 발생했습니다. 다시 시도해주세요.",
      };
    }
  }

  // 저장된 토큰 가져오기
  Future<String?> getToken() async {
    return await storage.read(key: "auth_token");
  }

  // 로그아웃 (토큰 삭제)
  Future<void> logout() async {
    await storage.delete(key: "auth_token");
  }
}
