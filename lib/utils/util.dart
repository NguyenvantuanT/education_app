import 'dart:math' as math;

class Util {
  
  Util._();

  static String get userID {
    String st = 'qưertyuiopasdfghjklzxcvbnm';
    st = '${st}0123456789';
    String st2 = '';
    for (int i = 0; i < 5; i++) {
      st2 = '$st${st[math.Random().nextInt(st.length)]}';
    }
    return st2;
  }
}
