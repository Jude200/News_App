import 'package:flutter/material.dart';
import 'package:flutter_flut/constants.dart';
import 'package:flutter_flut/screens/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isView = false;
  bool isAgree = false;
  passwordView() {
    setState(() {
      isView = !isView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Text("Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: mainColor))),
                Form(
                    child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        obscureText: isView,
                        decoration: inputDecoration(isView, "Password"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        obscureText: isView,
                        decoration: inputDecoration(isView, "Repeat password"),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: mainColor,
                            value: isAgree,
                            onChanged: (b) {
                              setState(() {
                                isAgree = b;
                              });
                            }),
                        Text("I agree to the privacy terms")
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(05.00)),
                      child: Text("Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20)),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign up via Google",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                  fontSize: 20))
                        ],
                      ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign up via Gmail",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                  fontSize: 20))
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Already have account ?",
                            style: TextStyle(color: mainColor)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            },
                            child: Text("Sign in",
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold)))
                      ],
                    ),
                    SizedBox(height: 20)
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  InputDecoration inputDecoration(isView, placeholder) {
    return InputDecoration(
        suffixIcon: IconButton(
            onPressed: passwordView,
            icon: isView
                ? Icon(Icons.lock, color: mainColor)
                : Icon(Icons.lock_open, color: mainColor)),
        hintText: placeholder,
        hintStyle: TextStyle(fontWeight: FontWeight.bold));
  }
}
