import 'package:equatable/equatable.dart';

abstract class EventUser extends Equatable{}

class EventGetSingleUser extends EventUser{
  int id;
  EventGetSingleUser({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];

}