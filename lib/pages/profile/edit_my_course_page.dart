import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/components/button/app_icon_button.dart';
import 'package:education_app/models/category_model.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/pages/main_page.dart';
import 'package:education_app/pages/profile/widget/app_text_infor_course.dart';
import 'package:education_app/pages/profile/widget/dropdown_text_infor_course.dart';
import 'package:education_app/pages/profile/widget/edit_lesson_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
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
          const Spacer(),
          
          const SizedBox(width: 20.0),
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
              buildBottomSheet(context);
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
          const SizedBox(height: 25.0),
          AppElevatedButton(
            text: "Save",
            onTap: () {},
          )
        ],
      ),
    );
  }

  Future<void> buildBottomSheet(BuildContext context) async {
    return showModalBottomSheet<bool>(
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
                        onTap: () => Navigator.of(context).pop(true),
                        icon: Icons.add,
                      )
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: ((_, __) =>
                          const SizedBox(height: 15.0)),
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 2.0, right: 6.0, bottom: 4.0),
                      itemCount: lessons.length,
                      itemBuilder: ((context, index) {
                        final lesson = lessons[index];
                        return EditLessonItem(
                          lesson,
                          onEdit: () {
                            Navigator.of(context).pop(false);
                          },
                          onDelete: () {
                            Navigator.of(context).pop(false);
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          });
        }).then(
      (value) {
        if (value == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
          );
        }
      },
    );
  }
}
