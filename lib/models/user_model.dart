import 'package:education_app/models/course_model.dart';

class UserModel {
  String? idUser;
  String? name;
  String? specialized;
  String? avatar;
  String? email;
  List<String>? todos;
  List<String>? createCourses;
  List<String>? myCourses;
  List<CourseModel>? wishLists;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel()
    ..idUser = json['idUser'] as String?
    ..name = json['name'] as String?
    ..specialized = json['specialized'] as String?
    ..avatar = json['avatar'] as String?
    ..email = json['email'] as String?
    ..todos =
        (json['todos'] as List<dynamic>?)?.map((e) => e as String).toList()
    ..createCourses = (json['createCourses'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..myCourses =
        (json['myCourses'] as List<dynamic>?)?.map((e) => e as String).toList()
    ..wishLists = json['wishLists'] != null
        ? (json['wishLists'] as List)
            .map((wishList) => CourseModel.fromJson(wishList))
            .toList()
        : null;

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'specialized': specialized,
        'avatar': avatar,
        'email': email,
        'createCourses': createCourses,
        'myCourses': myCourses,
        'wishLists': wishLists?.map((course) => course.toJson()).toList(),
      };
}
