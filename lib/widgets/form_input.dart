import 'package:contact/utils/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormInput extends StatelessWidget {
  String title;
  String hint;
  TextEditingController controller;

  FormInput({Key? key, required this.controller, required this.title, required this.hint})
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
