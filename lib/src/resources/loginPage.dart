import 'package:app_taxi/src/blocs/login_bloc.dart';
import 'package:app_taxi/src/resources/home.dart';
import 'package:app_taxi/src/resources/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //khoi tao stream (co nhieu cach de khoi tao)
  LoginBloc loginBloc = new LoginBloc();
  bool _showPass = true;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(), // full width, full height
        color: Colors.white,
        // singleChildScrollView scroll tren nhieu device
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Image.asset("ic_car_green.png"),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,40,0,6),
                child: Text("Welcome Back !", style: TextStyle(fontSize: 22,
                    color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              Text("Login to continue using iCar", style: TextStyle(fontSize: 15,
                  color: Colors.grey),),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,100,0,20),
                child:
                StreamBuilder(
                  stream: loginBloc.usernameStream,
                  builder: (context, snapshot) =>TextField(
                    controller: _usernameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      errorText: snapshot.hasError ? snapshot.error : null,
                      labelText: "Username",
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
                )
                ,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    StreamBuilder(
                      stream: loginBloc.passwordStream,
                      builder: (context, snapshot) => TextField(
                        controller: _passwordController,
                        obscureText: _showPass,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null,
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

              Container(
                constraints: BoxConstraints.loose(Size(double.infinity, 40)),
                //alignment can le phai
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text('For got password ?',
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: RaisedButton(
                    onPressed: _onLoginClick,
                    child: Text("Login", style: TextStyle(color: Colors.white,
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
                      text: "New user ? ",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = (){
                              _onClickRegister();
                            },
                            text: "Sign up for a new acount",
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
    setState(() {
      if(loginBloc.isValidInfo(_usernameController.text, _passwordController.text)){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
      }
    });

  }

  //redirect sang page register khi login thanh cong
  void _onClickRegister(){
    Navigator.push(context, MaterialPageRoute(builder: gotoRegister));
  }
  Widget gotoRegister(BuildContext context) {
    return RegisterPage();
  }

  //event show/hidden password
  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
