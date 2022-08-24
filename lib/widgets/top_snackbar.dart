import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../navigation/routes.dart';

void success(String text, BuildContext context) async {
  Future.delayed(
    const Duration(seconds: 2),
    () {
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    },
  );
  showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: text,
      ));
}
