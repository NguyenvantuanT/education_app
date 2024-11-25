import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/models/category_model.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/todo_model.dart';
import 'package:education_app/pages/course/course_page.dart';
import 'package:education_app/pages/home/widgets/category_item.dart';
import 'package:education_app/pages/home/widgets/course_item.dart';
import 'package:education_app/pages/home/widgets/todo_challenger_item.dart';
import 'package:education_app/pages/search/search_page.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectIndex;

  @override
  void initState() {
    super.initState();
    selectIndex = 0;
    getCourses();
  }

  List<CourseModel> fileByCategory(String idCategory) {
    return FakeCourse.courses
        .where((course) => (course.idCategory ?? "") == idCategory)
        .toList();
  }

  List<Widget> getCourses() {
    return categorys.map((category) {
      final courseList = fileByCategory(category.id ?? "");
      return _buildCourseByCategory(courseList);
    }).toList();
  }

  Widget _buildCourseByCategory(List<CourseModel> courseList) {
    return SizedBox(
      height: 485.0,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.5,
        ),
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          final course = courseList[index];
          return CategoryItem(course);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _buildSearchBox(context),
            ),
            const SizedBox(height: 20.0),
            _buildTitle("Todo Challenger"),
            SizedBox(
              height: 160,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: todoListA.length,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                separatorBuilder: (_, __) => const SizedBox(
                  width: 15.0,
                ),
                itemBuilder: (context, index) {
                  final todo = todoListA.reversed.toList()[index];
                  return TodoChallengerItem(todo);
                },
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTitle("Propular Courses"),
            SizedBox(
              height: 210.0,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20.0)
                    .copyWith(top: 26.0, bottom: 6.0),
                itemCount: FakeCourse.courses.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 20.0),
                itemBuilder: (context, index) {
                  final size = MediaQuery.of(context).size;
                  final course = FakeCourse.courses[index];
                  return CourseItem(
                    course,
                    width: size.width - 40.0,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CoursePage(course)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10.0),
            _buildTitle("All Courses"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _buildTabView(),
            ),
            IndexedStack(
              index: selectIndex,
              children: getCourses(),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox(BuildContext context) {
    double radius = 12.0;
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SearchPage())),
      child: Container(
        height: 60.0,
        padding: const EdgeInsets.only(
            left: 20.0, top: 5.0, bottom: 5.0, right: 8.0),
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: AppBoxShadow.appShadow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Search your courses",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                color: AppColor.blue,
                border: Border.all(color: AppColor.transparent, width: 1.2),
                borderRadius: BorderRadius.circular(radius - 5.0),
              ),
              child: const Icon(
                Icons.search,
                color: AppColor.white,
                size: 23.97,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabView() {
    return Row(
      children: List.generate(categorys.length, (index) {
        final category = categorys[index];
        return GestureDetector(
          onTap: () => setState(() => selectIndex = index),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0).copyWith(
              left: 20.0,
            ),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: selectIndex == index ? AppColor.blue : AppColor.white,
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                boxShadow: AppBoxShadow.appShadow),
            child: Text(
              category.name ?? "",
              style: selectIndex == index
                  ? AppTextStyle.h17Medium
                      .copyWith(fontSize: 15.0, color: AppColor.white)
                  : AppTextStyle.h17Medium.copyWith(fontSize: 15.0),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.h16Title.copyWith(fontSize: 18),
          ),
          SvgPicture.asset(
            "assets/svgs/icon2.svg",
            width: 28.0,
            height: 28.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
