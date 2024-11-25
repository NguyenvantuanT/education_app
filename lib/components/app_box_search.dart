import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBoxSearch extends StatelessWidget {
  const AppBoxSearch({
    super.key,
    this.searchController,
    this.onChanged,
    this.onTap,
    this.radius = 12.0,
  });
  final TextEditingController? searchController;
  final Function(String?)? onChanged;
  final double radius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding:
          const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0, right: 8.0),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: AppBoxShadow.appShadow),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              onChanged: onChanged,
              cursorColor: AppColor.greyText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search your course",
                hintStyle: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: AppColor.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                color: AppColor.blue,
                border: Border.all(color: AppColor.transparent, width: 1.2),
                borderRadius: BorderRadius.circular(radius - 5.0),
              ),
              child: const Icon(
                Icons.search,
                color: AppColor.white,
                size: 23.97,
              ),
            ),
          )
        ],
      ),
    );
  }
}
