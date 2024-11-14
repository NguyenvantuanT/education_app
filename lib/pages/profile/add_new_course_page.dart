import 'dart:math';

import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/components/button/app_icon_button.dart';
import 'package:education_app/models/category_model.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/pages/main_page.dart';
import 'package:education_app/pages/profile/widget/app_text_infor_course.dart';
import 'package:education_app/pages/profile/widget/dropdown_text_infor_course.dart';
import 'package:education_app/pages/profile/widget/edit_lesson_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
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
            value: categorys[Random().nextInt(categorys.length)].name ?? "",
            strings: categorys.map((e) => e.name ?? "").toList(),
            onChanged: (newValue) => setState(() {
              value = newValue ?? "";
            }),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () async {
              await buildBottomSheet(context);
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
          const SizedBox(height: 25.0),
          AppElevatedButton(
            text: "Save",
            onTap: () {},
          )
        ],
      ),
    );
  }

  Future<dynamic> buildBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, setStatus) {
            return FractionallySizedBox(
              heightFactor: 0.76,
              child: Column(
                children: [
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("All Lesson", style: AppTextStyle.h16Title),
                      AppIconButton(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        ),
                        icon: Icons.add,
                      )
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: lessons.isEmpty
                        ?  Center(child: Text("No value", style: AppTextStyle.h17Medium,),)
                        : ListView.separated(
                            separatorBuilder: ((_, __) =>
                                const SizedBox(height: 15.0)),
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 2.0, right: 6.0, bottom: 4.0),
                            itemCount: lessons.length,
                            itemBuilder: ((context, index) {
                              final lesson = lessons[index];

                              return EditLessonItem(
                                lesson,
                                onEdit: () {},
                                onDelete: () {},
                              );
                            }),
                          ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
