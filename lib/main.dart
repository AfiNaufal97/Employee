import 'package:contact/bloc/auth/bloc_auth.dart';
import 'package:contact/bloc/auth/event_auth.dart';
import 'package:contact/bloc/crud/bloc_crud.dart';
import 'package:contact/bloc/users/bloc_user.dart';
import 'package:contact/screen/create/create_screen.dart';
import 'package:contact/screen/home/home_screen.dart';
import 'package:contact/screen/login/login_Screen.dart';
import 'package:contact/screen/register/register_screen.dart';
import 'package:contact/utils/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BlocAuth()..add(EventGetToken())),
        BlocProvider(create: (context) => BlocCrud()),
        BlocProvider(create: (context) => BlocUser())
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              color: MyColors.navy,
            ),
            iconTheme: const IconThemeData(color: MyColors.white)),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.register,
        routes: {
          Routes.home: (context) => const HomeScreen(),
          Routes.register: (context) => const RegisterScreen(),
          Routes.login: (context) => const LoginScreen(),
        },
      ),
    );
  }
}
