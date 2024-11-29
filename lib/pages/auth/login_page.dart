import 'dart:async';
import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/components/text_field/app_text_field%20pass.dart';
import 'package:education_app/components/text_field/app_text_field.dart';
import 'package:education_app/pages/auth/register_page.dart';
import 'package:education_app/pages/main_page.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:education_app/services/remote/account_service.dart';
import 'package:education_app/services/remote/auth_service.dart';
import 'package:education_app/services/remote/body/login_body.dart';
import 'package:education_app/utils/validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.email});

  final String? email;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  AuthService authService = AuthService();
  AccountService accountService = AccountService();

  bool isLoad = false;

  Future<void> submitLogin(BuildContext context) async {
    if (_key.currentState?.validate() == false) return;

    setState(() => isLoad = true);
    await Future.delayed(const Duration(milliseconds: 1200));

    LoginBody body = LoginBody()
      ..email = emailController.text.trim()
      ..password = passwordController.text.trim();

    authService.login(body).then((_) {
      accountService.getUser(body.email ?? "").then((_) {
        if (!context.mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainPage()),
          (Route<dynamic> route) => false,
        );
      });
    }).whenComplete(() => setState(() => isLoad = false));
  }

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email ?? "";
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 20.0,
                    ),
                    child: Image.asset(
                      "assets/images/sign_in.png",
                      fit: BoxFit.cover,
                    ),
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
                    validator: Validator.required,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Password",
                    style: AppTextStyle.h17Medium.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  AppTextFieldPass(
                    hintText: "Password",
                    controller: passwordController,
                    validator: Validator.password,
                    // onFieldSubmitted: (_) => submitLogin(),
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 50.0),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: AppElevatedButton(
                      text: "Sign in",
                      onTap: () => submitLogin(context),
                      isDisable: isLoad,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have account?",
                        style: AppTextStyle.h15W300,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage())),
                        child: Text(" Sign up",
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


// Text(
//                     "Email address",
//                     style: AppTextStyle.h17Medium.copyWith(fontSize: 14.0),
//                   ),
//                   const SizedBox(height: 10.0),
//                   AppTextField(
//                     hintText: "name@example.com",
//                     controller: nameController,
//                     textInputAction: TextInputAction.next,
//                     validator: Validator.required,
//                   ),
//                   const SizedBox(height: 20.0),
//                   Text(
//                     "Password",
//                     style: AppTextStyle.h17Medium.copyWith(fontSize: 14.0),
//                   ),
//                   const SizedBox(height: 10.0),
//                   AppTextFieldPass(
//                     hintText: "Password",
//                     controller: passwordController,
//                     validator: Validator.password,
//                     textInputAction: TextInputAction.done,
//                   ),
//                   // const SizedBox(height: 100.0),
//                   FractionallySizedBox(
//                     widthFactor: 0.6,
//                     child: AppElevatedButton(
//                       text: "Sign in",
//                       onTap: submitLogin,
//                     ),
//                   ),
//                   const SizedBox(height: 20.0),
