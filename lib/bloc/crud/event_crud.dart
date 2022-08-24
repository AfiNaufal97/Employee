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
