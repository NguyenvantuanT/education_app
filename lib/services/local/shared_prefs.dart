import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String keyAvatar = 'Avatar';
  
  Future<String?> getAvatar() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(keyAvatar);
  }

  Future<void> saveAvatar(String avatarPath) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(keyAvatar, avatarPath);
  }
}
