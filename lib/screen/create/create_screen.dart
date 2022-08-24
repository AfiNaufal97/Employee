import 'package:contact/bloc/crud/bloc_crud.dart';
import 'package:contact/bloc/crud/event_crud.dart';
import 'package:contact/bloc/crud/state_crud.dart';
import 'package:contact/widgets/form_input.dart';
import 'package:contact/widgets/rounded_button.dart';
import 'package:contact/widgets/top_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CreateScreen extends StatefulWidget {
  int? id;
  String? nameUser;
  String? jobUser;
  String action;

  CreateScreen(
      {Key? key, this.nameUser, this.jobUser, required this.action, this.id})
      : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController name = TextEditingController(text: '');
  TextEditingController job = TextEditingController(text: '');

  bool cekForm() {
    if (name.text.isEmpty || job.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/icons/ic_user.png'))),
          ),
          FormInput(
            controller: name..text = widget.nameUser ?? '',

            title: 'Name',
            hint: 'full name',
          ),
          const SizedBox(
            height: 20,
          ),
          FormInput(
            controller:job..text = widget.jobUser ?? '',
            title: 'Job',
            hint: 'example : ceo',
          ),
          const SizedBox(
            height: 20,
          ),
          BlocConsumer<BlocCrud, StateCrud>(
            listener: (context, state) {
              if (state is StateError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
              if (state is StateCreateSuccess) {
                success('Success Add Employee', context);
              }

              if (state is StateUpdateSuccess) {
                success('Success Update Employee', context);
              }
            },
            builder: (context, state) {
              if (state is StateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return RoundedButton(
                  func: () {
                    if (cekForm()) {
                      if (widget.action == 'add') {
                        context
                            .read<BlocCrud>()
                            .add(EventCreate(name: name.text, job: job.text));
                      } else if (widget.action == 'update') {
                        context.read<BlocCrud>().add(EventUpdate(
                            name: name.text, job: job.text, id: widget.id!));
                      } else {}
                    } else {
                      showTopSnackBar(
                          context,
                          const CustomSnackBar.error(
                            message: "form cannot  empty",
                          ));
                    }
                  },
                  titleButton: widget.action);
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    job.clear();
    name.clear();
  }
}
