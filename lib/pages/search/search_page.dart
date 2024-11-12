import 'package:education_app/components/app_box_search.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/pages/course/course_page.dart';
import 'package:education_app/pages/search/widget/search_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  late List<CourseModel> courseSearchs;

  void searchCourse(String search) {
    search = search.toLowerCase();
    courseSearchs =  FakeCourse.courses.where(
        (course) => (course.nameCouse ?? "").toLowerCase().contains(search)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    courseSearchs = [...FakeCourse.courses];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: Column(
          children: [
            SizedBox(
              height: 190.0,
              child: _buildInformationUser(),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: courseSearchs.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                separatorBuilder: (_, __) => const SizedBox(height: 15.0),
                itemBuilder: (context, index) {
                  final course = courseSearchs[index];
                  return SearchItem(course,onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CoursePage(course)));
                  },);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInformationUser() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: MediaQuery.of(context).padding.top + 10.0),
          decoration: const BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )),
          child: Text(
            "Search Courses",
            style: AppTextStyle.h16Title.copyWith(color: AppColor.white),
          ),
        ),
        Positioned(
          top: 110.0,
          left: 20.0,
          right: 20.0,
          child: AppBoxSearch(
            searchController: searchController,
            onChanged: (value) => searchCourse(value ?? ""),
          ),
        ),
      ],
    );
  }
}
