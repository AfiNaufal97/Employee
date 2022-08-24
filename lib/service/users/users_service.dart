import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/users/employee.dart';
import '../../model/users/single_user.dart';

class UsersService {
  String baseurl = "https://reqres.in/api";

  Future<List<Employee>> getListUser() async {
    try {
      var res = await http.get((Uri.parse(baseurl + "/users?page=2")));
      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body)['data'];
        var data = body.map((e) =>
            Employee(
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


  Future<SingleUser> getSingleUser(int id)async{
    try{
        var res = await http.get(Uri.parse(baseurl+"/users/$id"));
        if(res.statusCode == 200){
          SingleUser singleUser = jsonDecode(res.body);
          return singleUser;
        }else{
          print('404');
          return jsonDecode(res.body);
        }
    }catch(e){
      rethrow;
    }
  }
}
