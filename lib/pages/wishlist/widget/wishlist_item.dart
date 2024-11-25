import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/components/app_rating_bar.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem(this.course, {super.key, this.onTap, this.onFavorite});

  final CourseModel course;
  final Function()? onTap;
  final Function()? onFavorite;

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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppRatingBar(
                        onRatingUpdate: (_) {}, rating: course.rating ?? 0.0),
                    GestureDetector(
                      onTap: onFavorite,
                      behavior: HitTestBehavior.translucent,
                      child: const Padding(
                        padding: EdgeInsets.all(4.6),
                        child: CircleAvatar(
                          backgroundColor: AppColor.greyText,
                          radius: 14.0,
                          child: Icon(
                            Icons.favorite,
                            size: 20.0,
                            color: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
