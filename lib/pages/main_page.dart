import 'package:education_app/components/appBar/education_app_bar.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/pages/learning/learning_page.dart';
import 'package:education_app/pages/home/home_page.dart';
import 'package:education_app/pages/todo/todo_page.dart';
import 'package:education_app/pages/profile/profile_page.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UserModel user = UserModel();
  late int selectedIndex;

  List pages = [
    const HomePage(),
    const TodoPage(),
    const LearningPage(),
  ];

  List<IconData> listIconData = [
    Icons.home,
    Icons.slideshow,
    Icons.class_,
  ];

  List<String> listLabel = [
    'Home',
    'Todo',
    'Learning',
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    _getProfile(context);
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: EducationAppBar(
        title: "Good evening!",
        username: user.name,
        avatar: user.avatar,
        rightPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage())),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return AnimatedContainer(
      height: 60.0,
      duration: const Duration(milliseconds: 2000),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                color: AppColor.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      listIconData[index],
                      size: 22.0,
                      color: selectedIndex == index
                          ? AppColor.blue
                          : AppColor.grey,
                    ),
                    Text(
                      listLabel[index],
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: selectedIndex == index
                              ? AppColor.blue
                              : AppColor.grey,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
