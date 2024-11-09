import 'package:education_app/models/user_model.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class TeacherInfor extends StatelessWidget {
  const TeacherInfor({
    super.key,
    this.teacher,
    this.description,
    this.radius = 24.0,
  });

  final UserModel? teacher;
  final String? description;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: radius * 1.5,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(radius * 1.5)),
                  child: Image.asset(
                    teacher?.avatar ?? '',
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teacher?.name ?? "",
                  style: AppTextStyle.h16Title,
                ),
                Text(teacher?.specialized ?? "",
                    style: AppTextStyle.h12SubTitle.copyWith(fontSize: 14))
              ],
            ),
          ],
        ),
        
      ],
    );
  }
}
