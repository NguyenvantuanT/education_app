import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class LessonItem extends StatelessWidget {
  const LessonItem(this.lesson,
      {super.key, required, this.onTap, required this.index});

  final Lesson lesson;
  final Function()? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool isIndex = index % 2 == 0;
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          decoration: BoxDecoration(
              color: isIndex ? AppColor.grey.withOpacity(0.6) : AppColor.white,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              boxShadow: isIndex ? null : AppBoxShadow.appShadow
              ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.nameLesson ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: isIndex
                              ? AppTextStyle.h16Title
                                  .copyWith(color: AppColor.white)
                              : AppTextStyle.h16Title,
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text("Chapter $index",
                                style: isIndex
                                    ? AppTextStyle.h12SubTitle
                                        .copyWith(color: AppColor.white)
                                    : AppTextStyle.h12SubTitle),
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
                              style: isIndex
                                  ? AppTextStyle.h12SubTitle
                                      .copyWith(color: AppColor.white)
                                  : AppTextStyle.h12SubTitle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
