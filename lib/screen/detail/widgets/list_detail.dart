import 'package:contact/utils/colors/my_colors.dart';
import 'package:contact/utils/fonts/my_fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListDetail extends StatelessWidget {
  IconData iconData;
  String text;

  ListDetail({Key? key, required this.text, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: MyColors.grey,
          blurRadius: 0.9,
          spreadRadius: 0.9,
          blurStyle: BlurStyle.outer,
        )
      ]),
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 40,
            color: MyColors.black,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: MyFonts.semiBold.copyWith(fontSize: 18),
          )
        ],
      ),
    );
  }
}
