class Validations {
  static bool isValidUsername(String username) {
    return username.isNotEmpty;
  }

  static bool isValidPassword(String password) {
    return password != null && password.length >= 6;
  }
}
