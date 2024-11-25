import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class LessonVideoItem extends StatelessWidget {
  const LessonVideoItem({
    super.key,
    required this.lesson,
    this.onTap,
  });
  final Lesson lesson;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
          decoration: const ShapeDecoration(
            color: AppColor.white,
            shadows: AppBoxShadow.appShadow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLessonItemLeading(),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      lesson.nameLesson ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.h16Title,
                    ),
                    const SizedBox(height: 10.0),
                    LinearProgressIndicator(
                      value: (lesson.progress ?? 0.0) / 100.0,
                      color: AppColor.blue,
                      backgroundColor: Colors.grey[300],
                      minHeight: 6.0,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              _buildLessonItemTrailing()
            ],
          )),
    );
  }

  Widget _buildLessonItemLeading() {
    return const CircleAvatar(
      backgroundColor: AppColor.blue,
      child: Icon(
        Icons.play_arrow_outlined,
        size: 20,
        color: AppColor.white,
      ),
    );
  }

  Widget _buildLessonItemTrailing() {
    return lesson.isCompleted ?? false
        ? const CircleAvatar(
            radius: 15.0,
            backgroundColor: AppColor.green,
            child: Icon(
              Icons.check,
              size: 20.0,
            ),
          )
        : const CircleAvatar(
            radius: 15.0,
            backgroundColor: AppColor.white,
            child: Icon(
              Icons.skip_next_outlined,
              size: 20.0,
            ),
          );
  }
}
