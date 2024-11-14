import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.borderColor = AppColor.transparent,
    this.bgColor = AppColor.greyText,
    this.iconColor = AppColor.red,
    this.onTap,
    this.icon = Icons.error,
    this.size = 25.0,
    this.radius = 12.0,
  });

  final Color borderColor;
  final Color bgColor;
  final Color iconColor;
  final Function()? onTap;
  final IconData icon;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: radius * 3,
        width: radius * 3,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 1.2),
            boxShadow: AppBoxShadow.appShadow),
        child: Icon(
          icon,
          color: iconColor,
          size: size,
        ),
      ),
    );
  }
}
