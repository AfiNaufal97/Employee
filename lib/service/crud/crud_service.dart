import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/crud/create_employee.dart';
import '../../model/crud/update_employee.dart';

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

  Future<UpdateEmployee> updateEmployee(int id, String name, String job) async {
    try {
      var res = await http.put(Uri.parse(baseurl+ "/users/$id"),
          body: {"name": name, "job": job});
        print(res.statusCode);
      if (res.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(res.body);
        print(body);
        return UpdateEmployee.fromJson(body);
      } else {
        return jsonDecode(res.body)['error'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteEmployee(int id) async {
    try {
      await http.delete(Uri.parse(baseurl+'/users/$id'));
    } catch (e) {
      rethrow;
    }
  }
}
