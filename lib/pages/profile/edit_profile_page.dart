import 'dart:io';

import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/components/button/app_elevated_button.dart';
import 'package:education_app/components/text_field/app_text_field.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:education_app/utils/validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, required this.user});
  final UserModel user;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final specializedController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserModel user = UserModel();

  String? avatarPath;
  bool isLoading = false;

  Future<void> pickAvatar() async {
    isLoading = true;
    setState(() {});
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result == null) {
      isLoading = false;
      setState(() {});
      return;
    }
    isLoading = false;
    setState(() => avatarPath = result.files.single.path!);
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name ?? '';
    emailController.text = widget.user.email ?? '';
    specializedController.text = widget.user.specialized ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
            top: MediaQuery.of(context).padding.top + 20.0, bottom: 16.0),
        children: [
          const Text(
            'My Profile',
            style: TextStyle(color: AppColor.greyText, fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          Center(
            child: _buildAvatar(),
          ),
          const SizedBox(height: 22.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle("Username"),
              _buildTitle("Specialized"),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: AppTextField(
                  controller: nameController,
                  hintText: "Full Name",
                  validator: Validator.required,
                  textInputAction: TextInputAction.done,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                flex: 1,
                child: AppTextField(
                  controller: specializedController,
                  hintText: "specialized",
                ),
              ),
            ],
          ),
          const SizedBox(height: 18.0),
          _buildTitle("Email"),
          AppTextField(
            controller: emailController,
            hintText: "Email",
            validator: Validator.email,
          ),
          const SizedBox(height: 72.0),
          AppElevatedButton(
            onTap: () {},
            text: 'Save',
          ),
          const SizedBox(height: 20.0),
          AppElevatedButton.outline(
            onTap: () => Navigator.pop(context),
            text: 'Back',
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 20.0),
      child: Text(
        title,
        style: AppTextStyle.h17W500,
      ),
    );
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: isLoading ? null : () => pickAvatar(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: isLoading
                ? Container(
                    height: 120.5,
                    width: 120.0,
                    margin: const EdgeInsets.only(bottom: 17.0, top: 5.0),
                    padding: const EdgeInsets.all(40.0),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: AppBoxShadow.appShadow),
                    child: const CircularProgressIndicator(
                      color: AppColor.greyText,
                    ))
                : widget.user.avatar != null
                    ? Container(
                        height: 120.5,
                        width: 120.0,
                        margin: const EdgeInsets.only(bottom: 17.0, top: 5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: AppBoxShadow.appShadow),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: avatarPath == null
                                  ? AssetImage(widget.user.avatar ?? "")
                                      as ImageProvider
                                  : FileImage(File(avatarPath!)),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: 120.5,
                        width: 120.0,
                        margin: const EdgeInsets.only(bottom: 17.0, top: 5.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: AppBoxShadow.appShadow),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            "assets/images/default_avatar.jpg",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
          ),
          Positioned(
            right: 0.0,
            bottom: 15.0,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.greyText)),
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 17.6,
                color: AppColor.greyText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _avatarProfile(String path) {
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
        borderRadius: BorderRadius.circular(12.0),
        child: Image.asset(
          path,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
