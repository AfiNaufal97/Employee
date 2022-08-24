import 'package:flutter/widgets.dart';

import '../utils/colors/my_colors.dart';
import '../utils/fonts/my_fonts.dart';

class TextButtonWidget extends StatelessWidget {
  String text;
  String textButton;
  void Function() func;

  TextButtonWidget(
      {required this.text, required this.textButton, required this.func});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: MyFonts.semiBold
              .copyWith(fontSize: 12, color: MyColors.black.withOpacity(0.5)),
        ),
        GestureDetector(
            onTap: func,
            child: Text(
              textButton,
              style:
                  MyFonts.semiBold.copyWith(fontSize: 12, color: MyColors.navy),
            ))
      ],
    );
  }
}
