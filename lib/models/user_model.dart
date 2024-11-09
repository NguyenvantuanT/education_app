class UserModel {
  String? idUser;
  String? name;
  String? specialized;
  String? avatar;
  String? email;
  List<String>? createCourses;
  List<String>? myCourses;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel()
    ..idUser = json['idUser'] as String?
    ..name = json['name'] as String?
    ..specialized = json['specialized'] as String?
    ..avatar = json['avatar'] as String?
    ..email = json['email'] as String?
    ..createCourses = (json['createCourses'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..myCourses =
        (json['myCourses'] as List<dynamic>?)?.map((e) => e as String).toList();

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'specialized': specialized,
        'avatar': avatar,
        'email': email,
        'createCourses': createCourses,
        'myCourses': myCourses,
      };
}


