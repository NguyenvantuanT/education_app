import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/components/text_field/app_text_field%20pass.dart';
import 'package:education_app/components/text_field/app_text_field.dart';
import 'package:education_app/pages/auth/login_page.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:education_app/utils/validator.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key, required this.email});

  final String email;

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  bool isLoad = false;

  Future<void> changePassword(BuildContext context) async {
    if (_key.currentState!.validate() == false) return;

    isLoad = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPage(email: widget.email)),
      (Route<dynamic> route) => false,
    );
    isLoad = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
              top: MediaQuery.of(context).padding.top + 40.0,
            ),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Change Password Page",
                    style: AppTextStyle.h16Title.copyWith(fontSize: 22.0),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Current Password",
                    style: AppTextStyle.h17Medium.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  AppTextField(
                    controller: currentPassController,
                    hintText: "Enter your password",
                    validator: Validator.required,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "New Password",
                    style: AppTextStyle.h17Medium.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  AppTextFieldPass(
                    hintText: "Enter new password",
                    controller: newPassController,
                    validator: Validator.password,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Confirm Password",
                    style: AppTextStyle.h17Medium.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  AppTextFieldPass(
                    hintText: "Enter confirm password",
                    controller: confirmPassController,
                    validator: Validator.confirmPassword(
                      newPassController.text,
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 50.0),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: AppElevatedButton(
                      text: "Change",
                      isDisable: isLoad,
                      onTap: () => changePassword(context),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
