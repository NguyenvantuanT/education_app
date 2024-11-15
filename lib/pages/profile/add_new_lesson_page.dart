import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

import 'widget/app_text_infor_course.dart';

class AddNewLessonPage extends StatefulWidget {
  const AddNewLessonPage({super.key});

  @override
  State<AddNewLessonPage> createState() => _AddNewLessonPageState();
}

class _AddNewLessonPageState extends State<AddNewLessonPage> {
  final nameLessonController = TextEditingController();
  final descriptionController = TextEditingController();
  final videoIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
            top: MediaQuery.of(context).padding.top + 20.0, bottom: 20.0),
        children: [
          Text(
            "Add New Lesson",
            style: AppTextStyle.h16Title.copyWith(fontSize: 22.0),
          ),
          const SizedBox(height: 20.0),
          AppTextInforCourse(
            controller: nameLessonController,
            hintText: "Enter Name Lesson",
            title: "Name Lesson",
          ),
          AppTextInforCourse(
            controller: videoIDController,
            hintText: "Enter VideoID Lesson",
            title: "ID Video Lesson",
          ),
          const SizedBox(height: 10.0),
          AppTextInforCourse(
            title: "Description",
            height: MediaQuery.of(context).size.width * 0.68,
            controller: descriptionController,
            hintText: "Enter Description Leson",
          ),
          const SizedBox(height: 25.0),
          AppElevatedButton(
            text: "Add",
            onTap: () {},
          )
        ],
      ),
    );
  }
}