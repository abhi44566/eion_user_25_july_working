import 'package:shared_preferences/shared_preferences.dart';
class MySharedPreferences {
  static Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();
  static Future<void> init() async {
    await _prefs;
  }


  static Future<void> setUserId(String userId) async {
    final prefs = await _prefs;
    await prefs.setString('user_id', userId);
  }


  static Future<void> setBookingId(String id) async {
    final prefs = await _prefs;
    await prefs.setString('bookingId', id);
  }
  static Future<String> getBookingId() async {
    final prefs = await _prefs;
    return prefs.getString('bookingId') ?? '';
  }


  static Future<void> setFullName(String userId) async {
    final prefs = await _prefs;
    await prefs.setString('full_name', userId);
  }

  static Future<String> getFullName() async {
    final prefs = await _prefs;
    return prefs.getString('full_name') ?? '';
  }

  static Future<String> getUserId() async {
    final prefs = await _prefs;
    return prefs.getString('user_id') ?? '';
  }

  // static Future<void> removeUserId(String userId) async {
  //   final prefs = await _prefs;
  //   await prefs.remove('user_idd',);
  // }
  //
  // static Future<void> removeVerificationUserId(String userId) async {
  //   final prefs = await _prefs;
  //   await prefs.remove('user_id',);
  // }
}
