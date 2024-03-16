import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKey {
  isTutorialDisplayed('isTutorialDisplayed'),
  ;

  const SharedPreferencesKey(this.key);

  final String key;
}

class SharedPreferencesController {
  static Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> isTutorialDisplayed() async {
    final prefs = await _getInstance();
    return prefs.getBool(SharedPreferencesKey.isTutorialDisplayed.key) ?? false;
  }

  static Future<void> setTutorialDone() async {
    final prefs = await _getInstance();
    prefs.setBool(SharedPreferencesKey.isTutorialDisplayed.key, true);
  }

  // 開発用
  static Future<void> clear() async {
    final prefs = await _getInstance();
    prefs.clear();
  }
}
