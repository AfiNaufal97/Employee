import 'package:contact/model/auth/login_response.dart';
import 'package:contact/model/auth/register_response.dart';
import 'package:equatable/equatable.dart';
import '../../model/users/employee.dart';

abstract class StateAuth extends Equatable {}

class AuthStateInit extends StateAuth {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthStateLoading extends StateAuth {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class AuthStateError extends StateAuth {
  String error;

  AuthStateError({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

// ignore: must_be_immutable
class AuthGetAllSuccess extends StateAuth {
  List<Employee> employees;

  AuthGetAllSuccess({required this.employees});

  @override
  // TODO: implement props
  List<Object?> get props => [employees];
}

// ignore: must_be_immutable
class AuthRegisterSuccess extends StateAuth {
  RegisterResponse authResponse;

  AuthRegisterSuccess({required this.authResponse});

  @override
  // TODO: implement props
  List<Object?> get props => [authResponse];
}

// ignore: must_be_immutable
class AuthLoginSuccess extends StateAuth {
  LoginResponse authResponse;

  AuthLoginSuccess({required this.authResponse});

  @override
  // TODO: implement props
  List<Object?> get props => [authResponse];
}

// ignore: must_be_immutable
class AuthGetToken extends StateAuth {
  String? token;

  AuthGetToken({required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
