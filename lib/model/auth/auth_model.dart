import 'package:flutter/material.dart';

class AuthModel {
  String email;
  String password;

  AuthModel({required this.password, required this.email});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(password: json['password'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {"password": password, "email": email};
  }
}
