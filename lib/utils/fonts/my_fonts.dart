import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/my_colors.dart';

class MyFonts {
  static TextStyle bold = GoogleFonts.poppins()
      .copyWith(fontWeight: FontWeight.w700, color: MyColors.black);
  static TextStyle semiBold = GoogleFonts.poppins()
      .copyWith(fontWeight: FontWeight.w600, color: MyColors.black);
  static TextStyle medium = GoogleFonts.poppins()
      .copyWith(fontWeight: FontWeight.w500, color: MyColors.black);
  static TextStyle regular = GoogleFonts.poppins()
      .copyWith(fontWeight: FontWeight.w400, color: MyColors.black);
  static TextStyle light = GoogleFonts.poppins()
      .copyWith(fontWeight: FontWeight.w300, color: MyColors.black);
}
