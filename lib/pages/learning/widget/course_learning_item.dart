import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class CourseLearningItem extends StatelessWidget {
  const CourseLearningItem(this.course, {super.key, this.onTap});
  final CourseModel course;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: AppBoxShadow.appShadow),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              course.image ?? "",
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.nameCouse ?? "", style: AppTextStyle.h16Title),
                const SizedBox(height: 4.0),
                Text('${course.teacher?.name} | ${course.idCategory}',
                    style: AppTextStyle.h12SubTitle.copyWith(fontSize: 14.0)),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Completed',
                        style:
                            AppTextStyle.h12SubTitle.copyWith(fontSize: 14.0)),
                    Text('${(course.progress ?? 0).toInt()}%',
                        style:
                            AppTextStyle.h12SubTitle.copyWith(fontSize: 14.0)),
                  ],
                ),
                const SizedBox(height: 6.0),
                LinearProgressIndicator(
                  value:(course.progress ?? 0.0) / 100.0,
                  color: AppColor.blue,
                  backgroundColor: Colors.grey[300],
                  minHeight: 6.0,
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
