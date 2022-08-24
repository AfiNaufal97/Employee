import 'package:contact/model/crud/create_employee.dart';
import 'package:contact/model/crud/update_employee.dart';
import 'package:equatable/equatable.dart';

abstract class StateCrud extends Equatable {}

class StateInit extends StateCrud {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class StateLoading extends StateCrud {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class StateError extends StateCrud {
  String error;

  StateError({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

// ignore: must_be_immutable
class StateCreateSuccess extends StateCrud {
  CreateEmployee newEmployee;

  StateCreateSuccess({required this.newEmployee});

  @override
  // TODO: implement props
  List<Object?> get props => [newEmployee];
}

// ignore: must_be_immutable
class StateUpdateSuccess extends StateCrud {
  UpdateEmployee updateEmployee;

  StateUpdateSuccess({required this.updateEmployee});

  @override
  // TODO: implement props
  List<Object?> get props => [updateEmployee];
}

class StateDeleteSuccess extends StateCrud {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


