import 'package:education_app/components/button/app_icon_button.dart';
import 'package:education_app/models/lesson.dart';
import 'package:education_app/pages/profile/add_new_lesson_page.dart';
import 'package:education_app/pages/profile/widget/edit_lesson_item.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class AppShowmodal {
  AppShowmodal._();

  static void modalBottomSheet({
    required BuildContext context,
    List<Lesson>? lessons,
  }) {
    bool isLoad = (lessons ?? []).isEmpty;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStatus) {
            return FractionallySizedBox(
              heightFactor: 0.76,
              child: Column(
                children: [
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("All Lesson", style: AppTextStyle.h16Title),
                      AppIconButton(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNewLessonPage(
                              lessons ?? [],
                              onUpdate: () => setStatus(() {
                                isLoad = (lessons ?? []).isEmpty;
                              }),
                            ),
                          ),
                        ),
                        icon: Icons.add,
                      )
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: isLoad
                        ? Center(
                            child: Text(
                              "No value",
                              style: AppTextStyle.h17Medium,
                            ),
                          )
                        : ListView.separated(
                            separatorBuilder: ((_, __) =>
                                const SizedBox(height: 15.0)),
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 2.0, right: 20.0, bottom: 4.0),
                            itemCount: (lessons ?? []).length,
                            itemBuilder: ((context, index) {
                              final lesson =
                                  (lessons ?? []).reversed.toList()[index];
                              return EditLessonItem(
                                lesson,
                                onEdit: () {},
                                onDelete: () {
                                  (lessons ?? [])
                                      .removeWhere((e) => e.id == lesson.id);
                                  isLoad = (lessons ?? []).isEmpty;
                                  setStatus(() {});
                                },
                              );
                            }),
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
