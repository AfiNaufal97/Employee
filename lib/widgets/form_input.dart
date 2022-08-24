import 'package:contact/utils/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormInput extends StatelessWidget {
  String title;
  String hint;
  bool? hidden;
  TextEditingController controller;

  FormInput(
      {Key? key,
      this.hidden,
      required this.controller,
      required this.title,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyFonts.semiBold.copyWith(fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: hidden ?? false,
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        )
      ],
    );
  }
}
