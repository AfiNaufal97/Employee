import 'package:contact/bloc/auth/event_auth.dart';
import 'package:contact/bloc/auth/state_auth.dart';
import 'package:contact/service/users/users_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/auth/auth_service.dart';

class BlocAuth extends Bloc<EventAuth, StateAuth> {
  BlocAuth() : super(AuthStateInit()) {
    on<EventAuth>((event, emit) async {
      if (event is EventGetAllUser) {
        try {
          emit(AuthStateLoading());
          var employees = await UsersService().getListUser();
          print(employees[2].first_name);
          emit(AuthGetAllSuccess(employees: employees));
        } catch (e) {
          emit(AuthStateError(error: e.toString()));
        }
      }

      if (event is EventRegister) {
        try {
          emit(AuthStateLoading());
          var register =
              await AuthService().registerEmployee(event.email, event.password);
          emit(AuthRegisterSuccess(authResponse: register));
        } catch (e) {
          emit(AuthStateError(error: e.toString()));
        }
      }

      if (event is EventLogin) {
        try {
          emit(AuthStateLoading());
          var login =
              await AuthService().loginEmployee(event.email, event.password);
          emit(AuthLoginSuccess(authResponse: login));
        } catch (e) {
          emit(AuthStateError(error: e.toString()));
        }
      }
    });
  }
}
