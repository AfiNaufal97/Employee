import 'package:contact/model/users/single_user.dart';
import 'package:equatable/equatable.dart';

abstract class StateUser extends Equatable {}

class StateInit extends StateUser {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class StateLoading extends StateUser {
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
  SingleUser singleUser;

  StateSingleUser({required this.singleUser});

  @override
  // TODO: implement props
  List<Object?> get props => [singleUser];
}
