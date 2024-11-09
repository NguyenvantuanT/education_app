import 'package:education_app/components/app_box_search.dart';
import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/models/category_model.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/pages/course/course_page.dart';
import 'package:education_app/pages/home/widgets/category_item.dart';
import 'package:education_app/pages/home/widgets/course_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectIndex;
  
  List<CourseModel> fileByCategory(
      List<CourseModel> courses, String idCategory) {
    return courses
        .where((course) => (course.idCategory ?? "") == idCategory)
        .toList();
  }

  List<Widget> getCourses(List<CourseModel> courses) {
    return categorys.map((category) {
      final courseList = fileByCategory(courses, category.id ?? "");
      return SizedBox(
        height: 230.0,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: courseList.length,
            padding: const EdgeInsets.symmetric(horizontal: 20.0,),
            separatorBuilder: (_, __) => const SizedBox(width: 20.0),
            itemBuilder: (context, index) {
              final course = courseList[index];
              return CategoryItem(course);
            }),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    selectIndex = 0;
    getCourses(FakeCourse.courses);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 40.0),
              child: Row(
                children: [
                  Expanded(
                    child: AppBoxSearch(
                      searchController: searchController,
                    ),
                  ),
                  const SizedBox(width: 25.0),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/svgs/icon1.svg",
                      width: 28.0,
                      height: 28.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            _buildTitle("All Courses"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _buildTabView(),
            ),
            IndexedStack(
              index: selectIndex,
              children: getCourses(FakeCourse.courses),
            ),
            const SizedBox(height: 10.0),
            _buildTitle("Propular Courses"),
            const SizedBox(height: 10.0),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ).copyWith(bottom: 40.0),
              itemCount: FakeCourse.courses.length,
              separatorBuilder: (_, __) => const SizedBox(height: 15.0),
              itemBuilder: (context, index) {
                final course = FakeCourse.courses[index];
                return CourseItem(
                  course,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoursePage(course)),
                  ),
                );
              },
            ),
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
            style: AppTextStyle.h19Bold,
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
