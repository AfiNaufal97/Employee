import 'package:contact/utils/colors/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/fonts/my_fonts.dart';

// ignore: must_be_immutable
class ListUser extends StatelessWidget {
  String name;
  String email;
  String image;
  void Function() func;

  ListUser(
      {Key? key,
      required this.name,
      required this.image,
      required this.email,
      required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16,bottom: 10, right: 16, top: 10),
      child: GestureDetector(
        onTap: func,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.lightBlueAccent,
                        spreadRadius: 0.9,
                        blurRadius: 0.8,
                        blurStyle: BlurStyle.outer)
                  ]),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: MyFonts.semiBold.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  email,
                  style:
                      MyFonts.semiBold.copyWith(fontSize: 15, color: MyColors.grey),
                )
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.navigate_next,
              color: MyColors.black,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
