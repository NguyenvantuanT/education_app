import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/components/text_field/app_text_field%20pass.dart';
import 'package:education_app/components/text_field/app_text_field.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:education_app/utils/validator.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  void submitLogin() {
    if (_key.currentState?.validate() == false) return;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
              top: MediaQuery.of(context).padding.top + 20.0,
            ),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/images/sign_up.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Name",
                    style: AppTextStyle.h17Medium.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  AppTextField(
                    controller: nameController,
                    hintText: "Your name",
                    validator: Validator.required,
                    textInputAction: TextInputAction.next,

                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Email address",
                    style: AppTextStyle.h17Medium.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  AppTextField(
                    controller: emailController,
                    hintText: "name@example.com",
                    validator: Validator.email,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Password",
                    style: AppTextStyle.h17Medium.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  AppTextFieldPass(
                    controller: passwordController,
                    hintText: "Password",
                    validator: Validator.password,
                    textInputAction: TextInputAction.done,

                  ),
                  const SizedBox(height: 50.0),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: AppElevatedButton(
                      text: "Sign in",
                      onTap: submitLogin,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        "You have account?",
                        style: AppTextStyle.h15W300,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(" Sign In",
                            style: AppTextStyle.h15W300
                                .copyWith(color: AppColor.blue)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}