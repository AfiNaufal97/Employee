import 'package:contact/bloc/auth/bloc_auth.dart';
import 'package:contact/bloc/auth/event_auth.dart';
import 'package:contact/bloc/auth/state_auth.dart';
import 'package:contact/screen/home/widgets/list_user.dart';
import 'package:contact/utils/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../navigation/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<BlocAuth>().add(EventGetAllUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Employee'),
      ),
      body: SafeArea(
        child: BlocBuilder<BlocAuth, StateAuth>(builder: (context, state) {
          if (state is AuthGetAllSuccess) {
            return ListView.builder(
              itemCount: state.employees.length,
              itemBuilder: (context, index) {
                return ListUser(
                    name: state.employees[index].first_name,
                    image: state.employees[index].avatar,
                    email: state.employees[index].email,
                    func: () {

                    });
              },
            );
          }
          return Center(child: Text('kosong'));
        }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.navy,
          onPressed: () {
            Navigator.pushNamed(context, Routes.crud);
          },
          child: const Icon(Icons.add)),
    );
  }
}
