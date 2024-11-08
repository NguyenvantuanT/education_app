import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/pages/course/widgets/lesson_item.dart';
import 'package:education_app/pages/lesson/video_page.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CoursePage extends StatefulWidget {
  const CoursePage(this.course, {super.key});

  final CourseModel course;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<Lesson> getLessonsById(List<Lesson> lessons, List<String> listIdLesson) {
    return lessons.where((lesson) => listIdLesson.contains(lesson.id)).toList();
  }

  List<Widget> getLessonWidget(List<String> listIdLesson) {
    final lessons = getLessonsById(listLessons, listIdLesson);
    return List.generate(
      lessons.length,
      (index) {
        final lesson = lessons[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: LessonItem(
            lesson,
            index: index,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPage(
                    lesson,
                    title: widget.course.nameCouse,
                    index: index,
                    lessons: lessons,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0)
                  .copyWith(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(widget.course.nameCouse ?? "",
                      style: AppTextStyle.h16Title.copyWith(fontSize: 22.0)),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        "Art Course",
                        style: AppTextStyle.h15W300
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: AppColor.orange,
                        size: 20,
                      ),
                      Text(
                        widget.course.rating.toString(),
                        style: AppTextStyle.h16Title,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        "(2k Reviews)",
                        style: AppTextStyle.h15W300
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ReadMoreText(
                    widget.course.description ?? "",
                    trimLines: 4,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Read more",
                    trimExpandedText: " End text",
                    lessStyle: AppTextStyle.h16Title,
                    moreStyle: AppTextStyle.h16Title,
                  ),
                  const SizedBox(height: 20.0),
                  Text("Course Contents", style: AppTextStyle.h16Title),
                  Column(
                    children: getLessonWidget(widget.course.lessons ?? []),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      floating: false,
      pinned: true,
      backgroundColor: AppColor.bgColor,
      automaticallyImplyLeading: false,
      expandedHeight: 205.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          widget.course.image ?? "",
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            radius: 20.0,
            backgroundColor: AppColor.white.withOpacity(0.5),
            child: const Padding(
                padding: EdgeInsets.only(left: 6.0),
                child: Icon(Icons.arrow_back_ios, size: 25.0)),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32.0,
          decoration: const BoxDecoration(
            color: AppColor.bgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
        ),
      ),
    );
  }
}
