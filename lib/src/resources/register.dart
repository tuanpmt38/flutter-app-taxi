import 'package:app_taxi/src/resources/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPass = true;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(), // full width, full height
        color: Colors.white,
        // singleChildScrollView scroll tren nhieu device
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Image.asset("ic_car_red.png"),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,30,0,6),
                child: Text("Welcome Aboard !", style: TextStyle(fontSize: 22,
                    color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              Text("Signup with iCar in simple steps", style: TextStyle(fontSize: 15,
                  color: Colors.grey),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Container(
                      width: 50,
                      child: Image.asset('ic_user.png'),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Phone",
                    prefixIcon: Container(
                      width: 50,
                      child: Image.asset('ic_phone.png'),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Container(
                      width: 50,
                      child: Image.asset('ic_mail.png'),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(6))
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      obscureText: _showPass,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Container(
                          width: 50,
                          child: Image.asset('ic_lock.png'),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            borderSide: BorderSide(width: 1, color: Colors.grey)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: GestureDetector(
                        onTap: onToggleShowPass,
                        child: Icon(
                          _showPass ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: _onLoginClick,
                    child: Text("Signup", style: TextStyle(color: Colors.white,
                        fontSize: 16)),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                      text: "Already a User ? ",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = (){
                              _onLogin();
                            },
                            text: "Login now",
                            style: TextStyle(color: Colors.blue, fontSize: 18)
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }

  //event click button login
  void _onLoginClick() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }

  //redirect sang page register khi login thanh cong
  void _onLogin(){
    Navigator.push(context, MaterialPageRoute(builder: gotoLogin));
  }
  Widget gotoLogin(BuildContext context) {
    return LoginPage();
  }

  //event show/hidden password
  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
