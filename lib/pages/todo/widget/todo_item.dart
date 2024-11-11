import 'package:education_app/models/todo_model.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
    this.todo, {
    super.key,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final Function()? onTap;
  final Function()? onEdit;
  final Function()? onDelete;
  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.6)
            .copyWith(left: 12.6, right: 6.8),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(5.0),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadow,
              offset: Offset(0.0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              todo.isDone == true
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              size: 25.0,
              color: AppColor.blue,
            ),
            const SizedBox(width: 8.6),
            Expanded(
              child: Text(
                todo.text ?? '-:-',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  decoration: () {
                    if (todo.isDone == true) {
                      return TextDecoration.lineThrough;
                    }
                    return TextDecoration.none;
                  }(),
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // GestureDetector(
            //   onTap: onEdit,
            //   behavior: HitTestBehavior.translucent,
            //   child: Padding(
            //     padding: const EdgeInsets.all(4.6),
            //     child: CircleAvatar(
            //       backgroundColor: AppColor.orange.withOpacity(0.8),
            //       radius: 14.0,
            //       child: const Icon(
            //         Icons.edit,
            //         size: 16.0,
            //         color: AppColor.white,
            //       ),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: onDelete,
              behavior: HitTestBehavior.translucent,
              child: Padding(
                padding: const EdgeInsets.all(4.6),
                child: CircleAvatar(
                  backgroundColor: AppColor.grey.withOpacity(0.9),
                  radius: 14.0,
                  child: const Icon(
                    Icons.delete,
                    size: 16.0,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}