import 'package:education_app/models/lesson.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class EditLessonItem extends StatelessWidget {
  const EditLessonItem(
    this.lesson, {
    super.key,
    this.onEdit,
    this.onDelete,
  });

  final Lesson lesson;
  final Function()? onEdit;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.grey300),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11.5),
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
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(lesson.nameLesson ?? "No Name",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyle.h16Title),
              Text(
                lesson.description ?? "No Name",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyle.h12SubTitle,
              ),
            ],
          ),
        ),
        GestureDetector(
            onTap: onEdit,
            behavior: HitTestBehavior.translucent,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.edit,
                color: AppColor.red,
              ),
            )),
        const SizedBox(width: 6.0),
        GestureDetector(
          onTap: onDelete,
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.delete,
              color: AppColor.grey,
            ),
          ),
        ),
      ],
    );
  }
}
