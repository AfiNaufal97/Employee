import 'package:contact/bloc/users/event_user.dart';
import 'package:contact/bloc/users/state_user.dart';
import 'package:contact/model/users/employee.dart';
import 'package:contact/model/users/single_user.dart';
import 'package:contact/service/users/users_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocUser extends Bloc<EventUser, StateUser> {
  BlocUser() : super(StateInit()) {
    on<EventUser>((event, emit) async {
      if (event is EventGetSingleUser) {
        try {
          emit(StateLoadingUser());
          Employee employee = await UsersService().getSingleUser(event.id);
          emit(StateSingleUser(employee: employee));
        } catch (e) {
          emit(StateError(error: e.toString()));
        }
      }
    });
  }
}
