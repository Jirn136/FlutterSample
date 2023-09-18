import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static PreferenceUtils? _instance;
  late SharedPreferences _preferences;

  PreferenceUtils._internal();

  factory PreferenceUtils() {
    _instance ??= PreferenceUtils._internal();
    return _instance!;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> save(String key, dynamic value) async {
    if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else {
      await _preferences.setStringList(key, value);
    }
  }

  String? getString(String key) => _preferences.getString(key);

  int getInt(String key) => _preferences.getInt(key) ?? 0;

  bool getBoolean(String key) => _preferences.getBool(key) ?? false;

  double getDouble(String key) => _preferences.getDouble(key) ?? 0;

  List<String> getStringList(String key) =>
      _preferences.getStringList(key) ?? [];
}
