import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedpref;

  static Future<void> cacheDataInit() async {
    sharedpref = await SharedPreferences.getInstance();
  }

  static Future<void> set({required String key, required bool value}) async {
    await sharedpref.setBool(key, value);
  }

  static dynamic get({required String key}) {
    return sharedpref.get(key);
  }

  static Future<void> clear() async {
    await sharedpref.clear();
  }
}
