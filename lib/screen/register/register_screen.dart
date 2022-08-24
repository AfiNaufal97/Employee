import 'package:contact/bloc/auth/bloc_auth.dart';
import 'package:contact/bloc/auth/event_auth.dart';
import 'package:contact/bloc/auth/state_auth.dart';
import 'package:contact/utils/fonts/my_fonts.dart';
import 'package:contact/widgets/form_input.dart';
import 'package:contact/widgets/rounded_button.dart';
import 'package:contact/widgets/text_button_widget.dart';
import 'package:contact/widgets/top_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../navigation/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController(text: '');

  TextEditingController password = TextEditingController(text: '');

  bool cekForm() {
    if (email.text.isEmpty || password.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<BlocAuth, StateAuth>(
          listener: (context, state) {
            if (state is AuthGetToken) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.home, (route) => false);
            }
          },
          child: ListView(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
            children: [
              Text(
                "Let’s\nGet Started",
                style: MyFonts.bold.copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 30,
              ),
              FormInput(
                  controller: email,
                  title: 'email',
                  hint: 'example : name@gmail.com'),
              const SizedBox(
                height: 30,
              ),
              FormInput(
                controller: password,
                title: 'password',
                hidden: true,
                hint: "*****",
              ),
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<BlocAuth, StateAuth>(
                builder: (context, state) {
                  if (state is AuthRegisterSuccess) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return RoundedButton(
                      func: () {
                        cekForm()
                            ? context.read<BlocAuth>().add(EventRegister(
                                password: password.text, email: email.text))
                            : showTopSnackBar(
                                context,
                                const CustomSnackBar.error(
                                  message: "form cannot  empty",
                                ),
                              );
                      },
                      titleButton: 'Register');
                },
                listener: (context, state) {
                  if (state is AuthStateError) {
                    showTopSnackBar(
                      context,
                      CustomSnackBar.error(
                        message: state.error,
                      ),
                    );
                  }
                  if (state is AuthRegisterSuccess) {
                    success('Register Success', context);
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButtonWidget(
                text: 'Sudah Punya Akun? ',
                textButton: 'Login',
                func: () => Navigator.pushNamed(context, Routes.login),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.clear();
    password.clear();
  }
}
