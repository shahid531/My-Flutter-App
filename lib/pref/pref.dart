import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Pref {
  static final Pref _instance = Pref._internal();
  factory Pref() => _instance;

  static const key = 'user';

  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  late final FlutterSecureStorage _storage;

  Pref._internal() {
    _storage = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  Future<void> createUser(String user) async {
    await _storage.write(key: key, value: user);
  }

  Future<String> readUser() async {
    return await _storage.read(key: key) ?? '';
  }

  Future<void> deleteUser() async {
    await _storage.delete(key: key);
  }
}
