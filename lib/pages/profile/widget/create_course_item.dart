import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/components/app_rating_bar.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class CreateCourseItem extends StatelessWidget {
  const CreateCourseItem(this.course, {super.key, this.onTap});

  final CourseModel course;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
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
                      Text(course.nameCouse ?? "",
                          style: AppTextStyle.h16Title),
                      const SizedBox(height: 4.0),
                      Text(
                          '${course.teacher?.name} | ${course.idCategory}',
                          style: AppTextStyle.h12SubTitle
                              .copyWith(fontSize: 14.0)),
                      const SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppRatingBar(
                              onRatingUpdate: (_) {},
                              rating: course.rating ?? 0.0),
                          const Icon(
                            Icons.edit_document,
                            color: AppColor.blue,
                            size: 25.0,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        
      ],
    );
  }
}
