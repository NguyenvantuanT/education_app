import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/models/todo_model.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

class TodoItemCart extends StatelessWidget {
  const TodoItemCart(
    this.todo, {
    super.key, this.onDelete, this.onCompleted,
  });
  final TodoModel todo;
  final Function()? onDelete;
  final Function()? onCompleted;
  

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedDate = '${now.day}-${now.month}-${now.year}';
    return GestureDetector(
      onTap: onCompleted,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            boxShadow: AppBoxShadow.appShadow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.text ?? "No Title", style: AppTextStyle.h16Title),
                const SizedBox(height: 5),
                Text(todo.description ?? "No Title", style: AppTextStyle.h12SubTitle),
                const SizedBox(height: 10),
                Text('Date: $formattedDate', style: AppTextStyle.h12SubTitle),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    todo.isDone ?? false
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank,
                    size: 25.0,
                    color: AppColor.blue,
                  ),
                  const SizedBox(height: 25.0),
                  GestureDetector(
                    onTap: onDelete,
                    behavior: HitTestBehavior.translucent,
                    child:const Padding(
                      padding:  EdgeInsets.all(3.0),
                      child:  Icon(
                        Icons.delete,
                        size: 25.0,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
