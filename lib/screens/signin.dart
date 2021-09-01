import 'package:flutter/material.dart';
import 'package:flutter_flut/constants.dart';
import 'package:flutter_flut/screens/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isView = true;
  void _change() {
    setState(() {
      isView = !isView;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Column(
                  children: [
                    Container(
                      child: TextFormField(
                        decoration:
                            InputDecoration(hintText: "Username or email"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: TextFormField(
                        obscureText: isView,
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
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0XFFDDF2EF),
                        borderRadius: BorderRadius.circular(05.00),
                      ),
                      child: Text("Sign in",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Already have account ?",
                            style: TextStyle(color: Colors.white)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text("Sign in",
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
