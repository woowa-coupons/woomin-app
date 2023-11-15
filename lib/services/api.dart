import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:woomin/models/promotion_model.dart';

class ApiService {
  static const String baseUrl = 'BASE URL';
  static const String signUp = 'app/auth/sign-up';
  static const String login = 'app/auth/sign-in';
  static const String promotion = 'app/promotions';

  static Future<int> postJoinRequest(
    String email,
    String nickname,
    String password,
  ) async {
    var response = await http.post(
      Uri.parse('$baseUrl/$signUp'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": email,
        "nickname": nickname,
        "password": password,
      }),
    );

    if (response.statusCode == 201) {
      Get.toNamed('/login');
    }

    return response.statusCode;
  }

  static Future<int> postLogin(
    String email,
    String password,
  ) async {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/$login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      saveAccessToken(response.body); // saveAccessToken 함수를 호출하고 await 사용
      Get.toNamed('/');
    }
    return response.statusCode;
  }

  static Future<void> saveAccessToken(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'accessToken', value: token);
  }

  static Future<List<PromotionModel>> getPromotionList() async {
    const storage = FlutterSecureStorage();
    final List<PromotionModel> promotionInstances = [];
    final url = Uri.parse('$baseUrl/$promotion');
    final accessToken = await storage.read(key: 'accessToken');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': accessToken.toString(),
        },
      );

      if (response.statusCode == 200) {
        final promotions = jsonDecode(response.body);
        for (var promotion in promotions) {
          promotionInstances.add(PromotionModel.fromJson(promotion));
        }
        return promotionInstances;
      } else {
        // 에러 발생 시 '/error' 페이지로 이동
        Get.toNamed('/error');
        throw Error();
      }
    } catch (e) {
      // 에러 발생 시 '/error' 페이지로 이동
      Get.toNamed('/error');
      throw Error();
    }
  }
}
