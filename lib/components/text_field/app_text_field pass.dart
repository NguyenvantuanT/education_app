import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextFieldPass extends StatefulWidget {
  const AppTextFieldPass({
    super.key,
    this.lableText,
    this.focusNode,
    this.validator,
    this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    required this.hintText,
    this.bgColor = AppColor.bgColor,
    this.boderColor = AppColor.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  });

  final Color? bgColor;
  final Color boderColor;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String hintText;
  final String? lableText;
  final BorderRadius? borderRadius;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  @override
  State<AppTextFieldPass> createState() => _AppTextFieldPassState();
}

class _AppTextFieldPassState extends State<AppTextFieldPass> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: widget.bgColor,
            border: Border.all(color: widget.boderColor, width: 1.2),
            borderRadius: widget.borderRadius,
            boxShadow: AppBoxShadow.appShadow,
          ),
        ),
        TextFormField(
          cursorColor: AppColor.grey,
          obscureText: !obscureText,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlignVertical: const TextAlignVertical(y: 0.0),
          validator: widget.validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            labelText: widget.lableText,
            hintStyle: AppTextStyle.h15W300,
            labelStyle: AppTextStyle.h15W300,
            hintMaxLines: 1,
            contentPadding: const EdgeInsets.only(left: 10.0,right: 10.0),
            suffixIcon: GestureDetector(
              onTap: () => setState(() => obscureText = !obscureText),
              child: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColor.greyText,
                size: 23.0,
              ),
            ),
          ),
          textInputAction: widget.textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      ],
    );
  }
}
