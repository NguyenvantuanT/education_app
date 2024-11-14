import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownTextInforCourse extends StatelessWidget {
  DropdownTextInforCourse({
    super.key,
     this.value = "Lesson",
    this.strings = const [],
    this.title = "No Title",
    this.bgColor,
    this.height = 50.0,
    Color? borderColor,
    this.onChanged,
  }) : borderColor = borderColor ?? AppColor.grey.withOpacity(0.4);

  final String value;
  final List<String>? strings;
  final String title;
  final Color? bgColor;
  final double height;
  final Color borderColor;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    String selectedValue = value;
    final style = GoogleFonts.lato(
      fontSize: 15.0,
      color: AppColor.black,
      fontWeight: FontWeight.normal,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: AppTextStyle.h16Title.copyWith(color: AppColor.grey),
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border(bottom: BorderSide(color: borderColor, width: 1.2)),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.68,
          ),
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            style: style,
            dropdownColor: AppColor.white,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            items: (strings ?? []).map((String repeat) {
              return DropdownMenuItem<String>(
                value: repeat,
                child: Text(
                  repeat,
                  style: style,
                ),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
