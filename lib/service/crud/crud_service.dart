import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/crud/create_employee.dart';

class CrudService {
  String baseurl = "https://reqres.in/api";

  Future<CreateEmployee> createEmployee(String name, String job) async {
    try {
      var res = await http.post(Uri.parse(baseurl+ "/users"),
          body: {"name": name, "job": job});
      print(res.statusCode);
      if (res.statusCode == 201) {
        Map<String, dynamic> body = jsonDecode(res.body);
        print(body);
        return CreateEmployee.fromJson(body);
      } else {
        return jsonDecode(res.body)['error'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
