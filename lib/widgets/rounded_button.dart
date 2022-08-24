import 'package:contact/utils/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedButton extends StatelessWidget {
  String titleButton;
  Color? color;
  void Function() func;

  RoundedButton({this.color,required this.func, required this.titleButton});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: func,
      child: Text(titleButton),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color ?? MyColors.navy),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder())),
    );
  }
}
