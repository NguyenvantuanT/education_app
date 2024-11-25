import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.avatar,
    this.isActive = false,
    this.radius = 15.00,
  });

  final String? avatar;
  final bool isActive;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(5.5),
          decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(color: AppColor.white),
              borderRadius: BorderRadius.circular(radius),
              boxShadow: AppBoxShadow.appShadow),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius - 4.0),
            child: Image.asset(
              avatar == null ? "assets/images/user_3.png" : avatar!,
              fit: BoxFit.cover,
              width: 45.0,
              height: 45.0,
              errorBuilder: (_, __, ___) {
                return Container(
                  width: 45.0,
                  height: 45.0,
                  color: AppColor.orange,
                  child: const Center(
                    child: Icon(Icons.error_rounded, color: AppColor.bgColor),
                  ),
                );
              },
              // loadingBuilder: (_, child, loadingProgress) {
              //   if (loadingProgress == null) return child;
              //   return const SizedBox.square(
              //     dimension: 12.00,
              //     child: Center(
              //       child: SizedBox.square(
              //         dimension: 24.6,
              //         child: CircularProgressIndicator(
              //           color: AppColor.pink,
              //           strokeWidth: 2.0,
              //         ),
              //       ),
              //     ),
              //   );
              // },
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: CircleAvatar(
            backgroundColor: AppColor.bgColor,
            radius: radius / 2.6 + 1.8,
            child: CircleAvatar(
              backgroundColor: isActive ? AppColor.green : AppColor.yellow,
              radius: radius / 2.6,
            ),
          ),
        )
      ],
    );
  }
}
