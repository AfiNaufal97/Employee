import 'package:contact/bloc/crud/bloc_crud.dart';
import 'package:contact/bloc/crud/event_crud.dart';
import 'package:contact/bloc/crud/state_crud.dart';
import 'package:contact/widgets/form_input.dart';
import 'package:contact/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../navigation/routes.dart';

class CrudScreen extends StatefulWidget {
  const CrudScreen({Key? key}) : super(key: key);

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  TextEditingController name = TextEditingController(text: '');
  TextEditingController job = TextEditingController(text: '');

  bool cekForm() {
    if (name.text.isEmpty || job.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void notifResult()async{
    Future.delayed(const Duration(seconds: 1), () {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Succes Add')));
    },);
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
            controller: name,
            title: 'Name',
            hint: 'full name',
          ),
          const SizedBox(
            height: 20,
          ),
          FormInput(
            controller: job,
            title: 'Job',
            hint: 'example : ceo',
          ),
          const SizedBox(
            height: 20,
          ),
          BlocConsumer<BlocCrud, StateCrud>(
            listener: (context, state) {
              if(state is StateError){
                ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                        content: Text(state.error)));
              }
              if(state is StateCreateSuccess){
                Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
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
                    cekForm()
                        ? context
                            .read<BlocCrud>()
                            .add(EventCreate(name: name.text, job: job.text))
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Tidak Boleh Kososng')));
                  },
                  titleButton: 'Save');
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
