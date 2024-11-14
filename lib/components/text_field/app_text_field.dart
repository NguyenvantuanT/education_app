import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    this.focusNode,
    this.labelText,
    this.validator,
    this.controller,
    this.height = 50.0,
    TextStyle? hintStyle,
    required this.hintText,
    this.textInputAction,
    this.bgColor = AppColor.bgColor,
    this.borderColor = AppColor.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  }) : hintStyle = hintStyle ?? AppTextStyle.h15W300;

  AppTextField.outline({
    super.key,
    this.focusNode,
    this.labelText,
    this.validator,
    this.controller,
    this.height = 50.0,
    required this.hintText,
    this.textInputAction,
    TextStyle? hintStyle,
    this.bgColor = AppColor.bgColor,
    this.borderColor = AppColor.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  }) : hintStyle = hintStyle ?? AppTextStyle.h16Title;


  AppTextField.outlineSmail({
    super.key,
    this.focusNode,
    this.labelText,
    this.validator,
    this.controller,
    required this.hintText,
    this.textInputAction,
    this.height = 50.0,
    TextStyle? hintStyle,
    this.bgColor = AppColor.bgColor,
    this.borderColor = AppColor.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  }) : hintStyle = hintStyle ?? AppTextStyle.h12SubTitle.copyWith(fontSize: 14.0);

  final Color? bgColor;
  final Color borderColor;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String hintText;
  final String? labelText;
  final BorderRadius? borderRadius;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: borderColor, width: 1.2),
            borderRadius: borderRadius,
            boxShadow: AppBoxShadow.appShadow,
          ),
        ),
        TextFormField(
          focusNode: focusNode,
          controller: controller,
          cursorColor: AppColor.grey,
          validator: validator,
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintMaxLines: 1,
            labelText: labelText,
            hintStyle: hintStyle,
            labelStyle: hintStyle,
            contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          textInputAction: textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
