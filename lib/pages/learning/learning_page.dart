import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/pages/learning/widget/course_learning_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  late int selectIndex;
  late UserModel userModel;
  late List<CourseModel> myCourses;
  List<String> tabName = ['All', 'Ongoing', 'Completed'];

  Map<String, dynamic> jsonData = {
    'idUser': '12345',
    'name': 'John Doe',
    'specialized': 'Computer Science',
    'avatar': 'avatar_url',
    'email': 'john.doe@example.com',
    'createCourses': ['course1', 'course2'],
    'myCourses': ['course3', 'course4', 'course5', 'course1', 'course2'],
  };

  List<CourseModel> fileByIDCourse(
      List<String> idCourses, List<CourseModel> courses) {
    return courses
        .where((courses) => idCourses.contains(courses.idCourse ?? ""))
        .toList();
  }

  List<List<CourseModel>> get progress {
    final completed = myCourses.where((c) => c.isCompleted).toList();
    final onGoing = myCourses
        .where((c) => (c.progress ?? 0) > 0 && !c.isCompleted)
        .toList();
    return [myCourses, onGoing, completed];
  }

  @override
  void initState() {
    super.initState();
    selectIndex = 0;
    userModel = UserModel.fromJson(jsonData);
    myCourses = fileByIDCourse(userModel.myCourses ?? [], FakeCourse.courses);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Text(
            "My Courses",
            style: AppTextStyle.h16Title.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 15.0),
          _buildTabView(),
          IndexedStack(
            index: selectIndex,
            children: List.generate(
              progress.length,
              (idx) => _buildBody(progress[idx]),
            ),
          )
        ],
      ),
    );
  }

  ListView _buildBody(List<CourseModel> courses) {
    return ListView.separated(
      itemCount: courses.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      separatorBuilder: (_, __) => const SizedBox(height: 20.0),
      itemBuilder: (context, index) {
        final course = courses.reversed.toList()[index];
        return CourseLearningItem(course);
      },
    );
  }

  Widget _buildTabView() {
    return Row(
      children: List.generate(tabName.length, (index) {
        final tab = tabName[index];
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => selectIndex = index),
            child: Container(
              margin: EdgeInsets.only(
                  right: index == tabName.length - 1 ? 0.0 : 10.0),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: selectIndex == index ? AppColor.blue : AppColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                boxShadow: AppBoxShadow.appShadow,
              ),
              child: Text(
                tab,
                style: selectIndex == index
                    ? AppTextStyle.h17Medium
                        .copyWith(fontSize: 15.0, color: AppColor.white)
                    : AppTextStyle.h17Medium.copyWith(fontSize: 15.0),
              ),
            ),
          ),
        );
      }),
    );
  }
}
