import 'package:contact/bloc/crud/event_crud.dart';
import 'package:contact/utils/colors/my_colors.dart';
import 'package:contact/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/crud/bloc_crud.dart';
import '../../../bloc/crud/state_crud.dart';
import '../../../widgets/top_snackbar.dart';

Widget deleteButton(int id) {
  return BlocConsumer<BlocCrud, StateCrud>(
    builder: (context, state) {
      if (state is StateLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return RoundedButton(
        color: MyColors.red,
          func: () {
            context.read<BlocCrud>().add(EventDelete(id: id));
          },
          titleButton: 'Delete');
    },
    listener: (context, state) {
      if (state is StateDeleteSuccess) {
        success('Success Delete', context);
      }
      if (state is StateError) {
        success('Success Delete', context);
      }
    },
  );
}
