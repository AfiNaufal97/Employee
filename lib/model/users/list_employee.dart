import 'package:contact/model/users/support.dart';

import 'employee.dart';


class Employees {
  int page;
  int per_page;
  int total;
  int total_pages;
  List<Employee> data;
  Support support;

  Employees({required this.total,
    required this.data,
    required this.per_page,
    required this.page,
    required this.total_pages,
    required this.support});

  factory Employees.fromJson(Map<String, dynamic>json){
    return Employees(total: json['total'],
        data: json['data'],
        per_page: json['per_page'],
        page: json['page'],
        total_pages: json['total_pages'],
        support: json['support']);
  }

  Map<String, dynamic> toJson() {
    return {
      "page": page,
      "per_page": per_page,
      "total": total,
      "total_pages": total_pages,
      "data": data,
      "support": support
    };
  }
}