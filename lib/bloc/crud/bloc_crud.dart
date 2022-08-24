import 'package:contact/bloc/crud/event_crud.dart';
import 'package:contact/bloc/crud/state_crud.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/crud/crud_service.dart';

class BlocCrud extends Bloc<EventCrud, StateCrud> {
  BlocCrud() : super(StateInit()) {
    on<EventCrud>((event, emit) async {
      if (event is EventCreate) {
        try {
          emit(StateLoading());
          var res = await CrudService().createEmployee(event.job, event.name);
          emit(StateCreateSuccess(newEmployee: res));
        } catch (e) {
          emit(StateError(error: e.toString()));
        }
      }
    });
  }
}
