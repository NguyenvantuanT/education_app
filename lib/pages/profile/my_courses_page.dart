import 'package:education_app/components/button/app_icon_button.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/pages/profile/add_new_course_page.dart';
import 'package:education_app/pages/profile/edit_my_course_page.dart';
import 'package:education_app/pages/profile/widget/create_course_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage(this.courses, {super.key});

  final List<CourseModel> courses;

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
            top: MediaQuery.of(context).padding.top + 20.0, bottom: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "All My Courses ",
                  style: AppTextStyle.h16Title.copyWith(fontSize: 22.0),
                ),
                const Spacer(),
                AppIconButton(
                  icon: Icons.add,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddNewCoursePage()));
                  },
                ),
                const SizedBox(width: 20.0),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: widget.courses.length,
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                itemBuilder: (context, index) {
                  final course = widget.courses.reversed.toList()[index];
                  return CreateCourseItem(
                    course,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditMyCoursePage(course)));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
