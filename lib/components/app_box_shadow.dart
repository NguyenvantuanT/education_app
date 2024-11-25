import 'package:education_app/resources/app_color.dart';
import 'package:flutter/material.dart';

class AppBoxShadow {
  AppBoxShadow._();

  static const appShadow = [
    BoxShadow(
      color: AppColor.shadow,
      offset: Offset(3.0, 3.0),
      blurRadius: 6.0,
    )
  ];
}
