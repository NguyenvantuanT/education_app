import 'dart:io';
import 'package:education_app/components/app_show_modal.dart';
import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/models/category_model.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/pages/profile/widget/app_text_infor_course.dart';
import 'package:education_app/pages/profile/widget/dropdown_text_infor_course.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EditMyCoursePage extends StatefulWidget {
  const EditMyCoursePage(this.course, {super.key});
  final CourseModel course;

  @override
  State<EditMyCoursePage> createState() => _EditMyCoursePageState();
}

class _EditMyCoursePageState extends State<EditMyCoursePage> {
  late TextEditingController nameCourseController;
  late TextEditingController createByController;
  late TextEditingController descriptionController;
  late TextEditingController idCategoryController;
  String value = "Null";
  List<Lesson> lessons = [];
  String? imagePath;

  List<String> getCategory() {
    return categorys.map((e) => e.name ?? "").toList();
  }

  Future<void> pickImageCourse() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result == null) return;
    setState(() => imagePath = result.files.single.path!);
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
    nameCourseController = TextEditingController(text: widget.course.nameCouse);
    createByController =
        TextEditingController(text: widget.course.teacher?.name);
    descriptionController =
        TextEditingController(text: widget.course.description);
    idCategoryController =
        TextEditingController(text: widget.course.idCategory);
    getCategory();
    getvalue();
    lessons = [...listLessons];
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
            "Edit Course",
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
            hintText: "Enter Create Course",
          ),
          const SizedBox(height: 10.0),
          DropdownTextInforCourse(
            title: "Category",
            value: value,
            strings: getCategory(),
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
            hintText: "Enter Description Course",
          ),
          const SizedBox(height: 10.0),
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
                          ? AssetImage(widget.course.image ?? "")
                              as ImageProvider
                          : FileImage(File(imagePath!)),
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
            text: "Save",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
