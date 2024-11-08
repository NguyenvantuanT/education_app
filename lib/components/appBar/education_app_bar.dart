import 'package:education_app/components/app_avatar.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class EducationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EducationAppBar({
    super.key,
    this.rightPressed,
    required this.title,
    this.avatar,
    this.color = AppColor.bgColor,
    this.username,
  });
  final VoidCallback? rightPressed;
  final String title;
  final String? avatar;
  final String? username;
  final Color color;

  @override
  Size get preferredSize => const Size.fromHeight(98.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.symmetric(horizontal: 22.0)
          .copyWith(top: MediaQuery.of(context).padding.top + 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.h19Bold.copyWith(fontSize: 24.0),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Expanded(
                child: Text(
                  username ?? "No Valuable",
                  style: AppTextStyle.h17W500,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: rightPressed,
            child: AppAvatar(avatar: avatar, isActive: true),
          ),
        ],
      ),
    );
  }
}
