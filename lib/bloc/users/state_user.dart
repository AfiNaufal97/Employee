import 'package:contact/model/users/employee.dart';
import 'package:contact/model/users/single_user.dart';
import 'package:equatable/equatable.dart';

abstract class StateUser extends Equatable {}

class StateInit extends StateUser {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class StateLoadingUser extends StateUser {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class StateError extends StateUser {
  String error;

  StateError({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class StateSingleUser extends StateUser {
  Employee employee;

  StateSingleUser({required this.employee});

  @override
  // TODO: implement props
  List<Object?> get props => [employee];
}
