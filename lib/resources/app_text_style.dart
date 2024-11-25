import 'package:education_app/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();

  static final h16Title = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: AppColor.greyText,
      fontSize: 16.0,
      fontWeight: FontWeight.bold
    ),
  );

  static final h12SubTitle = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: AppColor.grey,
      fontSize: 12.0,
    ),
  );

  static final h19Bold = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: AppColor.greyText,
      fontWeight: FontWeight.w500,
      fontSize: 19.0,
    ),
  );

  static final h17Medium = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: AppColor.grey,
      fontSize: 17.0,
    ),
  );

  static final h17W500 = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: AppColor.grey,
      fontSize: 17.0,
      fontWeight: FontWeight.w500,
    ),
  );

  static final h15W300 = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: AppColor.grey,
      fontSize: 15.0,
      fontWeight: FontWeight.w300,
    ),
  );
}
