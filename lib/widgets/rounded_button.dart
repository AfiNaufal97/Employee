import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedButton extends StatelessWidget {
  String titleButton;
  void Function() func;

  RoundedButton({required this.func, required this.titleButton});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: func,
      child: Text(titleButton),
      style: ButtonStyle(
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder())),
    );
  }
}
