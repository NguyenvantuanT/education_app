import 'package:education_app/models/todo_model.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDialog {
  AppDialog._();

  static Future<void> exitApp(BuildContext context) async {
    bool? status = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColor.bgColor,
            title: const Text('😍'),
            content: Text(
              "You want logout ? ",
              textAlign: TextAlign.center,
              style: AppTextStyle.h16Title,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.blue, fontSize: 16.8),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.blue, fontSize: 16.8),
                ),
              ),
            ],
          );
        });

    if (status ?? false) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  static Future<TodoModel?> createTodo(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = '${now.day}-${now.month}-${now.year}';
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descripController = TextEditingController();
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColor.bgColor,
            title: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundColor: AppColor.blue.withOpacity(0.8),
                radius: 14.0,
                child: const Icon(
                  Icons.edit,
                  size: 16.0,
                  color: AppColor.white,
                ),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: "Title"),
                  ),
                  TextField(
                    controller: descripController,
                    decoration: const InputDecoration(labelText: "Description"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.blue, fontSize: 16.8),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue, fontSize: 16.8),
                ),
              ),
            ],
          );
        }).then(
      (value) {
        if (value ?? false) {
          return TodoModel()
            ..id = '${DateTime.now().millisecondsSinceEpoch}'
            ..text = titleController.text.trim()
            ..description = descripController.text.trim()
            ..date = formattedDate
            ..isDone = false;
        }
        return null;
      },
    );
  }
}
