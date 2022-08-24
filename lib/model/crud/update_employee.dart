class UpdateEmployee {
  String name;
  String job;
  String updatedAt;

  UpdateEmployee(
      {required this.name, required this.job, required this.updatedAt});

  factory UpdateEmployee.fromJson(Map<String, dynamic> json) {
    return UpdateEmployee(
        name: json['name'], job: json['job'], updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "job": job, "updatedAt": updatedAt};
  }
}
