
class Employee {
  int id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  Employee(
      {required this.email,
      required this.id,
      required this.avatar,
      required this.first_name,
      required this.last_name});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        email: json['email'],
        id: json['id'],
        avatar: json['avatar'],
        first_name: json['first_name'],
        last_name: json['last_name']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "first_name": first_name,
      "last_name": last_name,
      "avatar": avatar,
    };
  }
}
