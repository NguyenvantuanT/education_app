import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/components/app_dialog.dart';
import 'package:education_app/models/course_model.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/pages/auth/change_password_page.dart';
import 'package:education_app/pages/profile/edit_profile_page.dart';
import 'package:education_app/pages/profile/my_courses_page.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserModel user;
  late List<CourseModel> createCourses;

  List<String> nameCard = [
    'Edit Profile',
    'Change Password',
    'Courses',
    'Log Out'
  ];

  List<IconData> iconData = [
    Icons.edit,
    Icons.lock,
    Icons.book,
    Icons.exit_to_app,
  ];

  Map<String, dynamic> jsonData = {
    'idUser': '12345',
    'name': 'John Doe',
    'specialized': 'Computer Science',
    'avatar': 'assets/images/default_avatar.jpg',
    'email': 'john.doe@example.com',
    'createCourses': ['course1', 'course2', 'course4'],
    'myCourses': ['course3', 'course4', 'course5', 'course1', 'course2'],
    'wishLists': [
      FakeCourse.course1,
    ]
  };

  void getCourseById() {
    createCourses = FakeCourse.courses
        .where((courses) =>
            (user.createCourses ?? []).contains(courses.idCourse ?? ""))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    user = UserModel.fromJson(jsonData);
    getCourseById();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget?> pages = [
      EditProfilePage(user: user),
      ChangePasswordPage(email: user.email ?? ""),
      MyCoursesPage(createCourses),
      null
    ];

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Column(
        children: [
          SizedBox(
            height: 280.0,
            child: _buildInformationUser(),
          ),
          ...List.generate(nameCard.length, (idx) {
            return _buildCard(
              idx,
              idx == nameCard.length - 1
                  ? () => AppDialog.exitApp(context)
                  : () => navigator(context, pages[idx]),
            );
          })
        ],
      ),
    );
  }

  void navigator(BuildContext context, Widget? widget) {
    if (widget == null) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  Widget _buildCard(int idx, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: AppBoxShadow.appShadow,
        ),
        child: Row(
          children: [
            Icon(
              iconData[idx],
              color: AppColor.blue,
              size: 25.0,
            ),
            const SizedBox(width: 15.0),
            Text(
              nameCard[idx],
              style: AppTextStyle.h16Title,
            ),
            const Spacer(),
            const Icon(
              Icons.navigate_next,
              size: 32.0,
              color: AppColor.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInformationUser() {
    List<Map<String, String>> information = [
      {'label': 'ID: ', 'value': user.idUser ?? "No ID"},
      {'label': 'Mail: ', 'value': user.email ?? "No Email"},
      {'label': 'Specialized: ', 'value': user.specialized ?? "No Specialized"},
    ];

    return Stack(
      children: [
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 20.0)
                  .copyWith(top: MediaQuery.of(context).padding.top + 10.0),
              decoration: const BoxDecoration(
                  color: AppColor.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )),
              child: Text(
                "My Profile",
                style: AppTextStyle.h16Title.copyWith(color: AppColor.white),
              ),
            )),
        Positioned(
          top: 130.0,
          left: 20.0,
          right: 20.0,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                boxShadow: AppBoxShadow.appShadow),
            child: Row(
              children: [
                _buildAvatar(),
                const SizedBox(width: 15.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        user.name ?? "No Value",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.h16Title
                            .copyWith(color: AppColor.blue),
                      ),
                      const SizedBox(height: 4.0),
                      ...information.map(
                        (info) => _buildInforUser(
                          info['label']!,
                          info['value']!,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInforUser(String label, String value) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: AppTextStyle.h16Title
                    .copyWith(color: AppColor.blue, fontSize: 14)),
            Expanded(
              child: Text(
                value,
                maxLines: 1,
                style: AppTextStyle.h16Title.copyWith(fontSize: 14.0),
              ),
            )
          ],
        ));
  }

  Widget _buildAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        user.avatar ?? "",
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
