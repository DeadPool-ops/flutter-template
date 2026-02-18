import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalStorageService {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  LocalStorageService(this._prefs, this._secureStorage);

  // ─── Shared Preferences ────────────────────────────────────────────────────

  Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);

  String? getString(String key) => _prefs.getString(key);

  Future<bool> setBool(String key, {required bool value}) =>
      _prefs.setBool(key, value);

  bool? getBool(String key) => _prefs.getBool(key);

  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);

  int? getInt(String key) => _prefs.getInt(key);

  Future<bool> remove(String key) => _prefs.remove(key);

  Future<bool> clearAll() => _prefs.clear();

  // ─── Secure Storage ────────────────────────────────────────────────────────

  Future<void> setSecureString(String key, String value) =>
      _secureStorage.write(key: key, value: value);

  Future<String?> getSecureString(String key) =>
      _secureStorage.read(key: key);

  Future<void> deleteSecureString(String key) =>
      _secureStorage.delete(key: key);

  Future<void> clearSecureStorage() => _secureStorage.deleteAll();
}
