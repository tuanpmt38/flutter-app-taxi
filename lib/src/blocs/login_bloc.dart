import 'dart:async';
import 'package:app_taxi/src/validators/validation.dart';

class LoginBloc {

  //single-stream
  StreamController _usernameController = new StreamController();
  StreamController _passwordController = new StreamController();

  //function get stream
  Stream get usernameStream => _usernameController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validations.isValidUsername(username)) {
      //sink input cho stream
      //stream du lieu dau ra
      _usernameController.sink.addError("Tên đăng nhập không hợp lệ");
      return false;
    }
    if (!Validations.isValidPassword(password)) {
      _passwordController.sink.addError("Mât khẩu phải lớn 6 ký tự");
      return false;
    }

    _usernameController.sink.add("OK");
    _passwordController.sink.add("OK");
    return true;
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
