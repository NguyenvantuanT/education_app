import 'package:education_app/resources/app_color.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onTap,
    this.icon,
    required this.text,
    this.isDisable = false,
    this.height = 50.0,
    this.boderColor = AppColor.transparent,
    this.bgColor = AppColor.blue,
    this.colorText = AppColor.bgColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    EdgeInsetsGeometry? padding,
  }) : padding = padding ??
            const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            );
  const AppElevatedButton.outline({
    super.key,
    this.onTap,
    this.icon,
    required this.text,
    this.isDisable = false,
    this.height = 50.0,
    this.boderColor = AppColor.blue,
    this.bgColor = AppColor.bgColor,
    this.colorText = AppColor.black,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    EdgeInsetsGeometry? padding,
  }) : padding = padding ??
            const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            );
  const AppElevatedButton.smail({
    super.key,
    this.onTap,
    this.icon,
    required this.text,
    this.height = 40.0,
    this.boderColor = AppColor.blue,
    this.bgColor = AppColor.blue,
    this.colorText = AppColor.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
    EdgeInsetsGeometry? padding,
    this.isDisable = false,
  }) : padding = padding ??
            const EdgeInsets.symmetric(
              horizontal: 20.0,
            );

  final Function()? onTap;
  final Color bgColor;
  final Color boderColor;
  final Icon? icon;
  final String text;
  final double height;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? colorText;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: boderColor, width: 1.2),
            borderRadius: borderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 4.0),
            ],
            isDisable == true
                ? Center(
                    child: SizedBox.square(
                      dimension: height - 22.0,
                      child: CircularProgressIndicator(
                          color: colorText, strokeWidth: 2.2),
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: colorText,
                      fontSize: 18.0,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
