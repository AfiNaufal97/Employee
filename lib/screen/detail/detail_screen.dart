import 'package:contact/bloc/crud/bloc_crud.dart';
import 'package:contact/bloc/crud/state_crud.dart';
import 'package:contact/bloc/users/bloc_user.dart';
import 'package:contact/bloc/users/event_user.dart';
import 'package:contact/bloc/users/state_user.dart';
import 'package:contact/model/users/employee.dart';
import 'package:contact/screen/create/create_screen.dart';
import 'package:contact/screen/detail/widgets/delete_button.dart';
import 'package:contact/screen/detail/widgets/list_detail.dart';
import 'package:contact/utils/colors/my_colors.dart';

import 'package:contact/utils/fonts/my_fonts.dart';
import 'package:contact/widgets/rounded_button.dart';
import 'package:contact/widgets/top_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  int id;

  DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget profile(Employee employee) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: MyColors.navy,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(employee.avatar))),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            employee.first_name,
            style:
                MyFonts.semiBold.copyWith(color: MyColors.white, fontSize: 20),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    context.read<BlocUser>().add(EventGetSingleUser(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail'),
        actions: [
          BlocBuilder<BlocUser, StateUser>(
            builder: (context, state) {
              if (state is StateSingleUser) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateScreen(
                                  jobUser: 'Ceo',
                                  nameUser: state.employee.first_name,
                                  action: 'update',
                                  id: state.employee.id,
                                )));
                  },
                  child: const Icon(
                    Icons.edit,
                    size: 30,
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<BlocUser, StateUser>(
            builder: (context, state) {
              if (state is StateLoadingUser) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is StateSingleUser) {
                return Column(
                  children: [
                    profile(state.employee),
                    const SizedBox(
                      height: 30,
                    ),
                    ListDetail(
                        text:
                            "${state.employee.first_name} ${state.employee.last_name}",
                        iconData: Icons.person),
                    const SizedBox(
                      height: 20,
                    ),
                    ListDetail(
                        text: state.employee.email, iconData: Icons.email),
                    const SizedBox(
                      height: 30,
                    ),
                    deleteButton(state.employee.id)
                  ],
                );
              }
              return const Center(
                child: Text('Load Error'),
              );
            },
          )
        ],
      ),
    );
  }
}
