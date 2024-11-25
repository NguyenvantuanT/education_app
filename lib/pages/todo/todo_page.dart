import 'package:education_app/components/app_dialog.dart';
import 'package:education_app/models/todo_model.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/pages/todo/widget/todo_item_cart.dart';
import 'package:education_app/resources/app_color.dart';
import 'package:education_app/resources/app_text_style.dart';
import 'package:flutter/material.dart';

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

  void fileTodo() {
    todos = todoListA
        .where((todo) => (user.todos ?? []).contains(todo.id ?? ""))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    user = UserModel.fromJson(fakeUser);
    fileTodo();
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
                    return TodoItemCart(
                      todo,
                      onCompleted: () {},
                      onDelete: () {
                        todos.removeWhere((e) => e.id == todo.id);
                        setState(() {});
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: GestureDetector(
                onTap: () async {
                  TodoModel? todo = await AppDialog.createTodo(context);
                  if (todo == null) return;
                  todos.add(todo);
                  setState(() {});
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: AppColor.blue,
                    border: Border.all(color: AppColor.transparent, width: 1.2),
                    borderRadius: BorderRadius.circular(12.0 - 5.0),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColor.white,
                    size: 23.97,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
