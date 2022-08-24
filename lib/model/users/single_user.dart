import 'package:contact/model/users/employee.dart';
import 'package:contact/model/users/support.dart';

class SingleUser {
  Employee data;
  Support support;

  SingleUser({required this.data, required this.support});

  factory SingleUser.fromJson(Map<String, dynamic> json) {
    return SingleUser(data: json['data'], support: json['support']);
  }

  Map<String, dynamic> toJson() {
    return {"data": data, "support": support};
  }
}
