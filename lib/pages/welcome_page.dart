import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
          top: MediaQuery.of(context).padding.top + 10.0,
          bottom: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/welcome.png",
              width: size.width,
              height: size.height / 2,
              fit: BoxFit.cover,
            ),
             Text(
              'Let\'s find the "A" with us',
              style: AppTextStyle.h19Bold,
            ),
            const SizedBox(height: 17.0),
             Text(
              'Please Sign in to view personalized',
              style: AppTextStyle.h17Medium,
            ),
             Text(
              'recommendations',
              style: AppTextStyle.h17Medium,
            ),
            const Spacer(),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: AppElevatedButton(
                text: "Sign Up",
                onTap: () {},
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Skip",
              style: TextStyle(color: AppColor.blue, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
