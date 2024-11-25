import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/pages/course/widgets/teacher_infor.dart';
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
  late int selectIndex;
  late List<Lesson> lessons;

  void getLessonsById() {
    lessons = listLessons
        .where((lesson) => (widget.course.lessons ?? []).contains(lesson.id))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    selectIndex = 0;
    getLessonsById();
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
                  _buildTeacherInfor(),
                  const SizedBox(height: 10.0),
                  Text(widget.course.nameCouse ?? "",
                      style: AppTextStyle.h16Title.copyWith(fontSize: 22.0)),
                  const SizedBox(height: 10.0),
                  _buildReview(),
                  const SizedBox(height: 15.0),
                  Text("About Course", style: AppTextStyle.h16Title),
                  const SizedBox(height: 15.0),
                  ReadMoreText(
                    widget.course.description ?? "",
                    trimLines: 4,
                    style: AppTextStyle.h17Medium.copyWith(fontSize: 15.0),
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Read more",
                    trimExpandedText: " End text",
                    lessStyle: AppTextStyle.h16Title,
                    moreStyle: AppTextStyle.h16Title,
                  ),
                  const SizedBox(height: 15.0),
                  Text("Lesson", style: AppTextStyle.h16Title),
                  _buildLessons(),
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReview() {
    return Row(
      children: [
        Text(
          "Art Course",
          style: AppTextStyle.h15W300.copyWith(fontWeight: FontWeight.bold),
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
          style: AppTextStyle.h15W300.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buildTeacherInfor() {
    final teacher = widget.course.teacher;
    return TeacherInfor(
      teacher: teacher,
      description: widget.course.description,
    );
  }

  Widget _buildLessons() {
    return ListView.separated(
      itemCount: lessons.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        height: 1.2,
        color: AppColor.grey.withOpacity(0.3),
      ),
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return LessonItem(
          lesson,
          index: index,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPage(
                  lessons: lessons,
                  index: index,
                  nameCorser: widget.course.nameCouse ?? "",
                ),
              ),
            );
          },
        );
      },
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
