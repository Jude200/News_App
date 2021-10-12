import 'package:flutter/material.dart';
import 'package:flutter_flut/constants.dart';
import 'package:flutter_flut/screens/home.dart';
import 'package:flutter_flut/screens/signup.dart';
import 'package:flutter_flut/services/auth_helper.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  int a;
  AuthentificationHelper _helper;
  bool isView = true;
  bool shouldValidate = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _change() {
    setState(() {
      isView = !isView;
    });
  }

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    _helper = AuthentificationHelper(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0.0,
        leading: Icon(Icons.keyboard_arrow_left_rounded),
      ),
      body: Container(
        color: mainColor,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 100, bottom: 20),
                    child: Text("Sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white))),
                Container(
                  child: Text(
                    "Insert your email and password to sign in",
                    style: TextStyle(color: Colors.white, fontFamily: "Mogra"),
                  ),
                ),
                SizedBox(height: 20),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            validator: (v) {
                              if (!GetUtils.isEmail(v)) {
                                return "Adresse mail invalide";
                              }
                              return null;
                            },
                            onSaved: (v) => _email = v,
                            decoration: InputDecoration(
                              hintText: "Email",
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: TextFormField(
                            obscureText: isView,
                            onSaved: (v) => _password = v,
                            decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: IconButton(
                                    onPressed: _change,
                                    icon: isView
                                        ? Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                          )
                                        : Icon(
                                            Icons.lock_open,
                                            color: Colors.white,
                                          ))),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot password ?",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () async {
                              bool b =
                                  _formKey.currentState.validate() ?? false;
                              setState(() {
                                shouldValidate = true;
                              });
                              if (b) {
                                _formKey.currentState.save();
                                await _helper.signInWithEmailAndPassword(
                                    _email, _password);
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                minimumSize: MaterialStateProperty.all(
                                    Size(double.infinity, 40))),
                            child: Text("Sign in",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))),
                        SizedBox(height: 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Already have account ?",
                                style: TextStyle(color: Colors.white)),
                            TextButton(
                                onPressed: () {
                                  Get.to(SignUp());
                                },
                                child: Text("Sign up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)))
                          ],
                        ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
