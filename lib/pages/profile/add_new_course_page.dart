import 'dart:io';
import 'dart:math' as math;
import 'package:education_app/components/app_show_modal.dart';
import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/models/category_model.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/pages/profile/widget/app_text_infor_course.dart';
import 'package:education_app/pages/profile/widget/dropdown_text_infor_course.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddNewCoursePage extends StatefulWidget {
  const AddNewCoursePage({super.key});

  @override
  State<AddNewCoursePage> createState() => _AddNewCoursePageState();
}

class _AddNewCoursePageState extends State<AddNewCoursePage> {
  final nameCourseController = TextEditingController();
  final createByController = TextEditingController();
  final descriptionController = TextEditingController();
  final idCategoryController = TextEditingController();
  String value = "Null";
  List<Lesson> lessons = [];
  String? imagePath;

  Future<void> pickImageCourse() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result == null) return;
    setState(() => imagePath = result.files.single.path!);
  }

  List<String> getCategory() {
    return categorys.map((e) => e.name ?? "").toList();
  }

  void getvalue() {
    final lists = categorys
        .where((category) => category.id == idCategoryController.text)
        .toList();
    value = lists[0].name ?? "";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
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
            "Add New Course",
            style: AppTextStyle.h16Title.copyWith(fontSize: 22.0),
          ),
          const SizedBox(height: 20.0),
          AppTextInforCourse(
            controller: nameCourseController,
            hintText: "Enter Name Course",
          ),
          const SizedBox(height: 10.0),
          AppTextInforCourse(
            title: "Create By",
            controller: createByController,
            hintText: "Enter Name Course",
          ),
          const SizedBox(height: 10.0),
          DropdownTextInforCourse(
            title: "Category",
            value: categorys[math.Random().nextInt(categorys.length)].name ?? "",
            strings: categorys.map((e) => e.name ?? "").toList(),
            onChanged: (newValue) => setState(() {
              value = newValue ?? "";
            }),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              AppShowmodal.modalBottomSheet(
                context: context,
                lessons: lessons,
              );
            },
            child: DropdownTextInforCourse(
              title: "All Lessons",
              value: "Lesson",
              strings: const ["Lesson"],
            ),
          ),
          const SizedBox(height: 10.0),
          AppTextInforCourse(
            title: "Description",
            height: MediaQuery.of(context).size.width * 0.68,
            controller: descriptionController,
            hintText: "Enter Name Course",
          ),
          Text("Image Course",
              style: AppTextStyle.h16Title.copyWith(color: AppColor.grey)),
          const SizedBox(height: 5.0),
          Row(
            children: [
              GestureDetector(
                onTap: () => pickImageCourse(), 
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imagePath == null
                          ? const AssetImage("assets/images/react.jpg")
                              as ImageProvider
                          : FileImage(File(imagePath!)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25.0),
          AppElevatedButton(
            text: "Save",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
