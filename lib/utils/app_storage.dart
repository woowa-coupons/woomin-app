import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  static const storage = FlutterSecureStorage();

  add(String key, body) async {
    await storage.write(key: key, value: body);
  }

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  delete(String key) async {
    await storage.delete(key: key);
  }
}
