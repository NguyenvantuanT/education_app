class UserModel {
  String? idUser;
  String? name;
  String? specialized;
  String? avatar;
  String? email;
  // String? password;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel()
    ..idUser = json['idUser'] as String?
    ..name = json['name'] as String?
    ..specialized = json['specialized'] as String?
    ..avatar = json['avatar'] as String?
    ..email = json['email'] as String?;
}


