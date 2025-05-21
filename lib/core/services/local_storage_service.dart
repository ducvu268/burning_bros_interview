import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class LocalStorageService {
  static SharedPreferences? _prefs;

  // init
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Lưu giá trị bool
  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  // Lấy giá trị bool
  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  // Lưu giá trị String
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  // Lấy giá trị String
  static String getString(String key, {String defaultValue = ''}) {
    return _prefs?.getString(key) ?? defaultValue;
  }

  // Lưu giá trị int
  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  // Lấy giá trị int
  static int getInt(String key, {int defaultValue = 0}) {
    return _prefs?.getInt(key) ?? defaultValue;
  }

  // Lưu giá trị double
  static Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  // Lấy giá trị double
  static double getDouble(String key, {double defaultValue = 0.0}) {
    return _prefs?.getDouble(key) ?? defaultValue;
  }

  // Lưu danh sách String
  static Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  // Lấy danh sách String
  static List<String> getStringList(String key, {List<String> defaultValue = const []}) {
    return _prefs?.getStringList(key) ?? defaultValue;
  }

  // Xóa giá trị theo key
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Kiểm tra key có tồn tại hay không
  static bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }

  // Xóa tất cả các dữ liệu
  static Future<void> clear() async {
    await _prefs?.clear();
  }
}
