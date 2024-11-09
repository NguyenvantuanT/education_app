import 'package:education_app/models/lesson.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class LessonItem extends StatelessWidget {
  const LessonItem(
    this.lesson, {
    super.key,
    required,
    this.onTap,
    required this.index,
  });

  final Lesson lesson;
  final Function()? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                lesson.imageLesson ?? "",
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    height: 55,
                    width: 55,
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
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lesson.nameLesson ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.h16Title),
                  const SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text(
                        "Chapter $index",
                        style: AppTextStyle.h12SubTitle,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.access_alarm_outlined,
                        color: AppColor.grey,
                        size: 19.0,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        lesson.duration.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.h12SubTitle,
                      ),
                      const SizedBox(width: 5.0),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                ],
              ),
            ),
            const CircleAvatar(
              backgroundColor: AppColor.blue,
              radius: 18.0,
              child: Icon(
                Icons.play_arrow_outlined,
                size: 20,
                color: AppColor.white,
              ),
            ),
          ],
        ));
  }
}
