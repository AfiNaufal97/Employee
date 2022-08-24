class CreateEmployee {
  String name;
  String job;
  String id;
  String createdAt;

  CreateEmployee(
      {required this.id,
      required this.name,
      required this.job,
      required this.createdAt});

  factory CreateEmployee.fromJson(Map<String, dynamic> json) {
    return CreateEmployee(
        id: json['id'],
        name: json['name'],
        job: json['job'],
        createdAt: json['createdAt']);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "job": job, "id": id, "createdAt": createdAt};
  }
}
