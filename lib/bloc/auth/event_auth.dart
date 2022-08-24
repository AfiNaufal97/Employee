import 'package:equatable/equatable.dart';

abstract class EventAuth extends Equatable {}

class EventGetAllUser extends EventAuth {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class EventRegister extends EventAuth {
  String email;
  String password;

  EventRegister({required this.password, required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

// ignore: must_be_immutable
class EventLogin extends EventAuth {
  String email;
  String password;

  EventLogin({required this.password, required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

class EventGetToken extends EventAuth {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EventLogout extends EventAuth {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
