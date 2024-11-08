import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/pages/home/widgets/course_item.dart';
import 'package:education_app/pages/profile/edit_profile_page.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel user = UserModel();
  void _getProfile(BuildContext context) {
    final fakeUser = {
      'name': "Nguyen Van Tuan",
      'specialized': "Flutter",
      'avatar': "assets/images/default_avatar.jpg",
      'email': 'user1@gmail.com',
    };
    user = UserModel.fromJson(fakeUser);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0)
            .copyWith(top: MediaQuery.of(context).padding.top + 10.0),
        children: [
          Row(
            children: [
              _buildAvatar(),
              const SizedBox(width: 20.0),
              _buildInformation()
            ],
          ),
          AppElevatedButton.smail(
            text: "Edit Profile",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(user: user)));
            },
          ),
          const SizedBox(height: 15.0),
          _buildTitle("My courses"),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ).copyWith(bottom: 40.0),
            itemCount: FakeCourse.courses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 15.0),
            itemBuilder: (context, index) {
              final course = FakeCourse.courses[index];
              return CourseItem(course);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.h19Bold,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: SvgPicture.asset(
              "assets/svgs/icon2.svg",
              width: 28.0,
              height: 28.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformation() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name ?? "",
          style: AppTextStyle.h19Bold,
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Icon(
                Icons.email,
                color: AppColor.grey,
                size: 15.0,
              ),
            ),
            Text(
              ": ${user.email}",
              style: AppTextStyle.h17W500,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              user.specialized ?? "",
              style: AppTextStyle.h17W500,
            ),
          ],
        )
      ],
    ));
  }

  Widget _buildAvatar() {
    return Container(
      height: 120.5,
      width: 120.0,
      margin: const EdgeInsets.only(bottom: 17.0, top: 5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: AppBoxShadow.appShadow),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          user.avatar ?? "",
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
