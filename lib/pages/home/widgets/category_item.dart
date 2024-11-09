import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/components/app_rating_bar.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/pages/course/course_page.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.course, {super.key, this.onTap});

  final CourseModel course;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CoursePage(course)));
      },
      child: Container(
        width: 155,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: AppBoxShadow.appShadow,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Image.asset(
                course.image ?? "",
                width: 125,
                height: 125,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Text(
                course.nameCouse ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.h16Title,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppRatingBar(
                    onRatingUpdate: (_) {}, rating: course.rating ?? 0.0),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  "(${course.rating.toString()})",
                  style: AppTextStyle.h15W300.copyWith(fontSize: 13.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
