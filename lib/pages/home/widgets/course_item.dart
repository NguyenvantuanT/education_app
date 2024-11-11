import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/components/app_rating_bar.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseItem extends StatelessWidget {
  const CourseItem(this.course, {super.key, this.onTap, this.width, this.height});
  final CourseModel course;
  final Function()? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: AppBoxShadow.appShadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                course.image ?? '',
                width: 135.0,
                height: 151.0,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    width: 135.0,
                    height: 151.0,
                    decoration: BoxDecoration(
                      color: AppColor.blue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Icon(
                      Icons.error_outline_outlined,
                      color: AppColor.bgColor,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      course.nameCouse ?? 'No Valuable',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: AppColor.greyText,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    AppRatingBar(
                      onRatingUpdate: (_) {},
                      rating: course.rating ?? 0.0,
                    ),
                    const SizedBox(height: 5.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bio Science" ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        course.description ?? 'No Valuable',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 10.5,
                            color: AppColor.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
