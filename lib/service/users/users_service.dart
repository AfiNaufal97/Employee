import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/users/employee.dart';

class UsersService {
  String baseurl = "https://reqres.in/api";

  Future<List<Employee>> getListUser() async {
    try {
      var res = await http.get((Uri.parse(baseurl + "/users?page=2")));
      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body)['data'];
        var data = body.map((e) => Employee(
            email: e['email'],
            id: e['id'],
            avatar: e['avatar'],
            first_name: e['first_name'],
            last_name: e['last_name']));
        List<Employee> employees = data.toList();
        return employees;
      } else {
        return jsonDecode(res.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Employee> getSingleUser(int id) async {
    try {
      var res = await http.get(Uri.parse(baseurl + "/users/$id"));
      if (res.statusCode == 200) {
        Map<String, dynamic> singleUser =
            Map<String, dynamic>.from(jsonDecode(res.body)['data']);
        return Employee(
            email: singleUser['email'],
            id: singleUser['id'],
            avatar: singleUser['avatar'],
            first_name: singleUser['first_name'],
            last_name: singleUser['last_name']);
      } else {
        print('404');
        return jsonDecode(res.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
