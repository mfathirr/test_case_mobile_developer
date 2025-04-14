import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthLocal {
  final FlutterSecureStorage _storage;

  AuthLocal(this._storage);

  Future<void> storeToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<void> removeData() async {
    await _storage.deleteAll();
  }
}
