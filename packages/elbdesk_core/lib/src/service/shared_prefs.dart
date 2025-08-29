import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  factory SharedPrefs() {
    return _instance;
  }
  SharedPrefs._();
  static final SharedPrefs _instance = SharedPrefs._();
  static late SharedPreferences _prefs;
  static SharedPreferences get instance => _prefs;

  // Get the run mode from dart-define
  static final runMode =
      RunMode.fromString(const String.fromEnvironment('RUN_MODE'));

  // Add prefix to keys based on environment
  static String _getKey(String key) {
    if (runMode == RunMode.dev) return key;
    return '${runMode.key}_$key';
  }

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    return _prefs.getString(_getKey(key));
  }

  static void setString(String key, String value) {
    _prefs.setString(_getKey(key), value);
  }

  static int? getInt(String key) {
    return _prefs.getInt(_getKey(key));
  }

  static void setInt(String key, int value) {
    _prefs.setInt(_getKey(key), value);
  }

  static double? getDouble(String key) {
    return _prefs.getDouble(_getKey(key));
  }

  static void setDouble(String key, double value) {
    _prefs.setDouble(_getKey(key), value);
  }

  static bool? getBool(String key) {
    return _prefs.getBool(_getKey(key));
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(_getKey(key), value);
  }

  static List<String>? getStringList(String key) {
    return _prefs.getStringList(_getKey(key));
  }

  static void setStringList(String key, List<String> value) {
    _prefs.setStringList(_getKey(key), value);
  }

  // static void clearAll() {
  //   _prefs.clear();
  // }

  static void clearAll() {
    // Only clear keys for current environment
    final keys = _prefs.getKeys().where(
          (key) => key.startsWith('${runMode.key}_'),
        );

    for (final key in keys) {
      _prefs.remove(key);
    }
  }

  static void reload() {
    _prefs.reload();
  }

  static void setAppWindowSize(Size size) {
    _prefs
      ..setDouble('app_window_width', size.width)
      ..setDouble('app_window_height', size.height);
  }

  static Size? getAppWindowSize() {
    final width = _prefs.getDouble('app_window_width');
    final height = _prefs.getDouble('app_window_height');
    if (width == null || height == null) {
      return null;
    }
    return Size(width, height);
  }

  static void setAppWindowPosition(Offset position) {
    _prefs
      ..setDouble('app_window_x', position.dx)
      ..setDouble('app_window_y', position.dy);
  }

  static Offset? getAppWindowPosition() {
    final x = _prefs.getDouble('app_window_x');
    final y = _prefs.getDouble('app_window_y');
    if (x == null || y == null) {
      return null;
    }
    return Offset(x, y);
  }
}
