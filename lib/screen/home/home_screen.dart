import 'package:contact/bloc/auth/bloc_auth.dart';
import 'package:contact/bloc/auth/event_auth.dart';
import 'package:contact/bloc/auth/state_auth.dart';
import 'package:contact/screen/create/create_screen.dart';
import 'package:contact/screen/detail/detail_screen.dart';
import 'package:contact/screen/home/widgets/list_user.dart';
import 'package:contact/utils/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
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
        actions: [
          BlocConsumer<BlocAuth, StateAuth>(
            listener: (context, state) {
              if (state is AuthStateInit) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.register, (route) => false);
              }
              if (state is AuthStateError) {
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    message: state.error,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GestureDetector(
                onTap: () {
                  context.read<BlocAuth>().add(EventLogout());
                },
                child: const Icon(
                  Icons.logout,
                  size: 30,
                ),
              );
            },
          ),
          const SizedBox(
            width: 16,
          )
        ],
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(id: state.employees[index].id),
                          ));
                    });
              },
            );
          }
          if (state is AuthStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(child: Text('kosong'));
        }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.navy,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateScreen(action: 'add')));
          },
          child: const Icon(Icons.add)),
    );
  }
}
