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
    return Container(
      decoration: const ShapeDecoration(
        color: AppColor.white,
        shadows: AppBoxShadow.appShadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: _buildLessonItemLeading(),
        title: Text(
          lesson.nameLesson ?? '',
          style: AppTextStyle.h16Title,
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.watch_later,
              size: 16.0,
              color: AppColor.blue,
            ),
            const SizedBox(width: 5.0),
            Text(
              lesson.duration ?? "",
              style: AppTextStyle.h12SubTitle,
            ),
          ],
        ),
        trailing: _buildLessonItemTrailing(),
      ),
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
    return lesson.isComplete ?? false
        ? const CircleAvatar(
            backgroundColor: AppColor.green,
            child: Icon(Icons.check),
          )
        : const Icon(
            Icons.skip_next_outlined,
            color: AppColor.black,
          );
  }
}
