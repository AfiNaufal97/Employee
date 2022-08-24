import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../model/auth/login_response.dart';
import '../../model/auth/register_response.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseurl = "https://reqres.in/api";

  Future<RegisterResponse> registerEmployee(
      String email, String passeord) async {
    try {
      var res = await http.post(Uri.parse(baseurl + "/register"),
          body: {"email": email, "password": passeord});
      if (res.statusCode == 200) {
        Map<String, dynamic> authResponse = jsonDecode(res.body);
        addToScureStorage(authResponse['token']);
        return RegisterResponse.fromJson(authResponse);
      } else {
        return jsonDecode(res.body)['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> loginEmployee(String email, String passeord) async {
    try {
      var res = await http.post(Uri.parse(baseurl + "/login"),
          body: {"email": email, "password": passeord});
      if (res.statusCode == 200) {
        Map<String, dynamic> authResponse = jsonDecode(res.body);
        addToScureStorage(authResponse['token']);
        return LoginResponse.fromJson(authResponse);
      } else {
        return jsonDecode(res.body)['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  void addToScureStorage(String token) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
  }

  Future<String?> getToken()async{
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    return token;
  }

  Future<void> deleteAllScureStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }



}
