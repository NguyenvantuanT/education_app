import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/models/todo_model.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class TodoChallengerItem extends StatelessWidget {
  const TodoChallengerItem(this.todo, {super.key});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(
              color: todo.isDone ?? false ? AppColor.blue : AppColor.white,
              width: 1.2),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          boxShadow: AppBoxShadow.appShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 6.0,
              backgroundColor: AppColor.grey.withOpacity(0.5),
            ),
          ),
          Image.asset(
            todo.isDone ?? false
                ? "assets/images/welcome.png"
                : "assets/images/sign_in.png",
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,
          ),
          Text(
            todo.text ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.h16Title,
          ),
        ],
      ),
    );
  }
}
