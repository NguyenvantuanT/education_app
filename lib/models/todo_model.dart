class TodoModel {
  String? id;
  String? text;
  String? description;
  String? date;
  bool? isDone;
}

List<TodoModel> todoListA = [
  TodoModel()
    ..id = '1'
    ..text = 'Học'
    ..description = 'Flutter của thầy Tuấn'
    ..date = DateTime.now().toString()
    ..isDone = false,
  TodoModel()
    ..id = '2'
    ..text = 'tap the duc'
    ..isDone = false,
  TodoModel()
    ..id = '3'
    ..text = 'an sang'
    ..isDone = false,
  TodoModel()
    ..id = '4'
    ..text = 'di den truong'
    ..isDone = false,
  TodoModel()
    ..id = '5'
    ..text = 'hoc Flutter'
    ..isDone = false,
  TodoModel()
    ..id = '6'
    ..text = 've nha'
    ..isDone = false,
  TodoModel()
    ..id = '7'
    ..text = 'nghi trua'
    ..isDone = false,
  TodoModel()
    ..id = '8'
    ..text = 'hoc tieng anh'
    ..isDone = false,
  TodoModel()
    ..id = '9'
    ..text = 'di choi'
    ..isDone = false,
];
