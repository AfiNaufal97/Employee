import 'package:equatable/equatable.dart';

abstract class EventCrud extends Equatable {}

// ignore: must_be_immutable
class EventCreate extends EventCrud {
  String name;
  String job;

  EventCreate({required this.name, required this.job});

  @override
  // TODO: implement props
  List<Object?> get props => [name, job];
}

// ignore: must_be_immutable
class EventUpdate extends EventCrud {
  int id;
  String name;
  String job;

  EventUpdate({required this.id, required this.name, required this.job});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, job];
}

// ignore: must_be_immutable
class EventDelete extends EventCrud {
  int id;

  EventDelete({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
