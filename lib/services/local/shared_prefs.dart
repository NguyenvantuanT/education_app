import 'dart:convert';

import 'package:education_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;
  static const String keyUser = 'user';

  static Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static UserModel? get user {
    String? data =  _prefs.getString(keyUser);
    if(data == null) return null;
    return UserModel.fromJson(jsonDecode(data));
  }

  static set user(UserModel? user) {
    _prefs.setString(keyUser, jsonEncode(user?.toJson()));
  }

  static remote() {
    _prefs.remove(keyUser);
  }
}
