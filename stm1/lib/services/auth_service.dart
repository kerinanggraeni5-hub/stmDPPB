class AuthService {
  static String? _email;
  static String? _password;
  static String? _name;

  static bool register({
    required String name,
    required String email,
    required String password,
  }) {
    _name = name;
    _email = email;
    _password = password;
    return true;
  }

  static bool login({
    required String email,
    required String password,
  }) {
    if (_email == email && _password == password) {
      return true;
    }
    return false;
  }

  static String get name => _name ?? 'User';

  static void logout() {
    _email = null;
    _password = null;
    _name = null;
  }

  static bool get isLoggedIn => _email != null;
}
