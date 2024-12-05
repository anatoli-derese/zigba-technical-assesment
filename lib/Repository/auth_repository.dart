import 'package:hive/hive.dart';

class AuthRepository {
  final Box _authBox;

  AuthRepository(this._authBox);

  Future<void> login(String email, String password) async {
    // Validate email and password
    if (!_validateEmail(email)) {
      throw Exception('Invalid email format');
    }
    if (!_validatePassword(password)) {
      throw Exception('Password cannot has to be more than 3 charachters');
    }

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

  bool _validateEmail(String email) {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$",
    );
    return emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length > 3;
  }
}
