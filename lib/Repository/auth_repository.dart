import 'package:hive/hive.dart';

class AuthRepository {
  final Box _authBox = Hive.box('authBox');

  Future<void> login(String email, String password) async {
    await _authBox.put('email', email);
    await _authBox.put('password', password);
  }

  bool isLoggedIn() {
    final email = _authBox.get('email');
    final password = _authBox.get('password');

    return email != null && password != null;
  }

  Future<void> logout() async {
    await _authBox.delete('email');
    await _authBox.delete('password');
  }
}
