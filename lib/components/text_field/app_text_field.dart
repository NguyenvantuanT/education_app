import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.focusNode,
    this.labelText,
    this.validator,
    this.controller,
    required this.hintText,
    this.textInputAction,
    this.bgColor = AppColor.bgColor,
    this.borderColor = AppColor.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  final Color? bgColor;
  final Color borderColor;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String hintText;
  final String? labelText;
  final BorderRadius? borderRadius;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: borderColor, width: 1.2),
            borderRadius: borderRadius,
            boxShadow:
                AppBoxShadow.appShadow, 
          ),
        ),
        TextFormField(
          focusNode: focusNode,
          controller: controller,
          cursorColor: AppColor.grey,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintMaxLines: 1,
            labelText: labelText,
            hintStyle: AppTextStyle.h15W300,
            labelStyle: AppTextStyle.h15W300,
            contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          textInputAction: textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
