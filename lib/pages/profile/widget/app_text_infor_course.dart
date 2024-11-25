import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextInforCourse extends StatelessWidget {
  AppTextInforCourse({
    super.key,
    this.focusNode,
    this.labelText,
    this.validator,
    this.controller,
    this.height = 50.0,
    this.textInputAction,
    TextStyle? hintStyle,
    required this.hintText,
    this.title = "Name Course",
    this.bgColor = AppColor.bgColor,
    Color? borderColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  })  : hintStyle = hintStyle ?? AppTextStyle.h15W300,
        borderColor = borderColor ?? AppColor.grey.withOpacity(0.4);

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
  final String title;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.lato(
        fontSize: 15.0, color: AppColor.black, fontWeight: FontWeight.normal);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title,
            style: AppTextStyle.h16Title.copyWith(color: AppColor.grey)),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border(bottom: BorderSide(color: borderColor, width: 1.2)),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.68,
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            cursorColor: AppColor.grey,
            validator: validator,
            style: style,
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
        ),
      ],
    );
  }
}
