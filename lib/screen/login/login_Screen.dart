import 'package:contact/bloc/auth/event_auth.dart';
import 'package:contact/widgets/top_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../../bloc/auth/bloc_auth.dart';
import '../../bloc/auth/state_auth.dart';
import '../../navigation/routes.dart';
import '../../utils/fonts/my_fonts.dart';
import '../../widgets/form_input.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              hint: 'example : name@mail.com',
            ),
            const SizedBox(
              height: 30,
            ),
            FormInput(
              controller: password,
              title: 'password',
              hidden: true,
              hint: '******',
            ),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<BlocAuth, StateAuth>(builder: (context, state) {
              if (state is AuthStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return RoundedButton(
                  func: () {
                    cekForm()
                        ? context.read<BlocAuth>().add(EventLogin(
                            password: password.text, email: email.text))
                        : showTopSnackBar(
                            context,
                            const CustomSnackBar.error(
                              message: "form cannot  empty",
                            ),
                          );
                  },
                  titleButton: 'Login');
            }, listener: (context, state) {
              if (state is AuthStateError) {
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    message: state.error,
                  ),
                );
              }
              if (state is AuthLoginSuccess) {
                success('Login Success', context);
              }
            }),
            const SizedBox(
              height: 10,
            ),
            TextButtonWidget(
              text: 'Belum Punya Akun? ',
              textButton: 'Register',
              func: () => Navigator.pushNamed(context, Routes.register),
            )
          ],
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
