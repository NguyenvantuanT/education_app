import 'dart:async';

import 'package:education_app/components/app_box_shadow.dart';
import 'package:education_app/models/todo_model.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/pages/todo/widget/todo_item.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:education_app/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController todoController = TextEditingController();
  final addFocus = FocusNode();
  UserModel user = UserModel();

  late List<TodoModel> todos;
  bool isLoad = false;

  final fakeUser = {
    'name': "Nguyen Van Tuan",
    'specialized': "Flutter",
    'avatar': "assets/images/default_avatar.jpg",
    'email': 'user1@gmail.com',
    'todos': ['1', '2', '3']
  };

  List<TodoModel> fileTodo(List<String> idTodos, List<TodoModel> todos) {
    return todos.where((todo) => idTodos.contains(todo.id ?? "")).toList();
  }

  Future<void> createTodo(UserModel user, String text) async {
    if (text.isEmpty) return;
    isLoad = true;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 1600));
    final todo = TodoModel()
      ..id = Util.userID
      ..text = text
      ..isDone = false;
    todos.add(todo);
    todoListA.add(todo);
    user.todos!.add(todo.id ?? "");
    todoController.clear();

    isLoad = false;
    setState(() {});
  }

  void onDelete(UserModel user, String idTodo) {
    user.todos!.removeWhere((e) => e == idTodo);
    todoListA.removeWhere((e) => e.id == idTodo);
    todos.removeWhere((e) => e.id == idTodo);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    user = UserModel.fromJson(fakeUser);

    todos = [...fileTodo(user.todos ?? [], todoListA)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25.0)
                  .copyWith(bottom: 95.0),
              children: [
                Text("Todo Challenges",
                    style: AppTextStyle.h16Title.copyWith(fontSize: 18)),
                const SizedBox(height: 15.0),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: todos.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 15.0,
                  ),
                  itemBuilder: (context, index) {
                    final todo = todos.reversed.toList()[index];
                    return TodoItem(
                      todo,
                      onTap: () => setState(() => todo.isDone = true),
                      onDelete: () => onDelete(user, todo.id ?? ""),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: _buildAddTodo(),
          )
        ],
      ),
    );
  }

  Widget _buildAddTodo() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60.0,
            padding: const EdgeInsets.only(
                left: 20.0, top: 5.0, bottom: 5.0, right: 8.0),
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: AppBoxShadow.appShadow),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: todoController,
                    focusNode: addFocus,
                    cursorColor: AppColor.greyText,
                    onFieldSubmitted: (_) =>
                        createTodo(user, todoController.text),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "New Challenges",
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
                  onTap: () {
                    createTodo(user, todoController.text);
                  },
                  child: Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      color: AppColor.blue,
                      border:
                          Border.all(color: AppColor.transparent, width: 1.2),
                      borderRadius: BorderRadius.circular(12.0 - 5.0),
                    ),
                    child: isLoad
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: AppColor.white,
                            ),
                          )
                        : const Icon(
                            Icons.add,
                            color: AppColor.white,
                            size: 23.97,
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
