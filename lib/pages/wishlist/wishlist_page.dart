import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/pages/wishlist/widget/wishlist_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  late UserModel user;

  Map<String, dynamic> jsonData = {
    'idUser': '12345',
    'name': 'John Doe',
    'specialized': 'Computer Science',
    'avatar': 'avatar_url',
    'email': 'john.doe@example.com',
    'createCourses': ['course1', 'course2'],
    'myCourses': ['course3', 'course4', 'course5', 'course1', 'course2'],
    'wishLists': [
      FakeCourse.course1,
    ]
  };

  @override
  void initState() {
    super.initState();
    user = UserModel.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: ListView(
         padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Text("Your WishList" , style: AppTextStyle.h16Title.copyWith(fontSize: 18.0),),
          ListView.separated(
            itemCount: (user.wishLists ?? []).length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            separatorBuilder: (_, __) => const SizedBox(height: 20.0),
            itemBuilder: (context, index) {
              final course = (user.wishLists ?? []).reversed.toList()[index];
              return WishlistItem(course);
            },
          ),
        ],
      ),
    );
  }
}
