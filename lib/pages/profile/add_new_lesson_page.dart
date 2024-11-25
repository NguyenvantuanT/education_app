import 'dart:io';

import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'widget/app_text_infor_course.dart';

class AddNewLessonPage extends StatefulWidget {
  const AddNewLessonPage(this.lessons, {super.key, this.onUpdate});

  final List<Lesson> lessons;
  final Function()? onUpdate;

  @override
  State<AddNewLessonPage> createState() => _AddNewLessonPageState();
}

class _AddNewLessonPageState extends State<AddNewLessonPage> {
  final nameLessonController = TextEditingController();
  final descriptionController = TextEditingController();
  final videoIDController = TextEditingController();

  String? imageLessonPath ;

  Future<void> pickImageLesson() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result == null) return;
    setState(() => imageLessonPath = result.files.single.path!);
  }

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
            textInputAction: TextInputAction.next,
          ),
          AppTextInforCourse(
            controller: videoIDController,
            hintText: "Enter VideoID Lesson",
            title: "ID Video Lesson",
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10.0),
          AppTextInforCourse(
            title: "Description",
            height: MediaQuery.of(context).size.width * 0.68,
            controller: descriptionController,
            hintText: "Enter Description Leson",
            textInputAction: TextInputAction.done,
          ),
          Text("Image Course",
              style: AppTextStyle.h16Title.copyWith(color: AppColor.grey)),
          const SizedBox(height: 5.0),
          Row(
            children: [
              GestureDetector(
                onTap: () => pickImageLesson(),
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageLessonPath == null
                          ? const AssetImage("assets/images/welcome.png")
                              as ImageProvider
                          : FileImage(File(imageLessonPath!)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: 1.2,
            color: AppColor.grey.withOpacity(0.4),
          ),
          const SizedBox(height: 25.0),
          AppElevatedButton(
            text: "Add",
            onTap: () {
              Lesson newLesson = Lesson()
                ..id = '${DateTime.now().millisecondsSinceEpoch}'
                ..nameLesson = nameLessonController.text.trim()
                ..description = descriptionController.text.trim()
                ..duration = "1hours 5min"
                ..isCompleted = false
                ..imageLesson = imageLessonPath.toString()
                ..videoPath = videoIDController.text.trim();
              widget.lessons.add(newLesson);
              nameLessonController.clear();
              descriptionController.clear();
              videoIDController.clear();
              widget.onUpdate?.call();
            },
          )
        ],
      ),
    );
  }
}
