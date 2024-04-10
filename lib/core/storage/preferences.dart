import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences pref;
  static Future<SharedPreferences> init() async {
    pref = await SharedPreferences.getInstance();
    return pref;
  }
}
