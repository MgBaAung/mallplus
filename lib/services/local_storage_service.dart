import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServie {
  static late SharedPreferences _prefs;
  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static setData(String key, String data) async {
    await _prefs.setString(key, data);
    await _prefs.reload();
  }

  static String getData(String key) {
    final data = _prefs.getString(key);
    return data ?? "";
  }

  static setBoolData(String key, bool data) async {
    await _prefs.setBool(key, data);
  }

  static bool getBoolData(String key) {
    final data = _prefs.getBool(key);
    return data ?? false;
  }

  static setIntData(String key, int data) async {
    await _prefs.setInt(key, data);
  }

  static int getIntData(String key) {
    final data = _prefs.getInt(key);
    return data ?? 0;
  }

  static Future<bool> iskeyexists(String key) async{
    final is_exist = await _prefs.containsKey(key);
    return is_exist;
  }
  static deleteData(String key) async {
    await _prefs.remove(key);
    await _prefs.reload();
  }
}

// abstract class LocalDatasources {
//   Future<void> setToken({required String token});
//   Future<String> getToken();
//   Future<void> removeToken();
//   Future<void> setAlreadySawOnboarding();
//   bool getAlreadySawOnboarding();
// }

// class LocalDatasourcesImpl implements LocalDatasources {
//   final SharedPreferences _sharedPreferences;

//   LocalDatasourcesImpl({required SharedPreferences sharedPreferences})
//       : _sharedPreferences = sharedPreferences;
//   @override
//   Future<String> getToken() async {
//     return _sharedPreferences.getString("token") ?? "";
//   }

//   @override
//   Future<void> setToken({required String token}) async {
//     await _sharedPreferences.setString("token", token);
//   }

//   @override
//   Future<void> removeToken() async {
//     await _sharedPreferences.remove("token");
//   }

//   @override
//   Future<void> setAlreadySawOnboarding() async {
//     await _sharedPreferences.setBool("alreadySawOnboarding", true);
//   }

//   @override
//   bool getAlreadySawOnboarding() {
//     try {
//       return _sharedPreferences.getBool("alreadySawOnboarding") ?? false;
//     } catch (e) {
//       return false;
//     }
//   }
// }
