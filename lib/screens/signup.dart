import 'package:flutter/material.dart';
import 'package:flutter_flut/constants.dart';
import 'package:flutter_flut/models/data_user.dart';
import 'package:flutter_flut/screens/home.dart';
import 'package:flutter_flut/screens/signin.dart';
import 'package:flutter_flut/services/auth_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthentificationHelper _helper;
  var isView = false;
  bool shouldValidate = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  bool isAgree = false;
  passwordView() {
    setState(() {
      isView = !isView;
    });
  }

  String _name;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    _helper = AuthentificationHelper(context);
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
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.trim().length == 0) {
                                return "Le nom ne peut etre vide ";
                              }
                              return null;
                            },
                            onSaved: (value) => _name = value,
                            decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (!GetUtils.isEmail(value)) {
                                return "Adresse mail non valide";
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.trim().length < 8) {
                                return "Mot de passe non securisé";
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value,
                            obscureText: isView,
                            decoration: inputDecoration(isView, "Password"),
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
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(mainColor),
                              minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 40)),
                            ),
                            onPressed: () async {
                              bool b =
                                  _formKey.currentState.validate() ?? false;
                              setState(() {
                                shouldValidate = true;
                              });

                              if (b) {
                                _formKey.currentState.save();

                                await _helper.registerWithEmailAndPassword(
                                    _email, _password);
                              }
                            },
                            child: Text("Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20))),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 15)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0XFFDDF2EF)),
                          ),
                          onPressed: () async {
                            await _helper.signInWithGoogle();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svgs/google.svg",
                                  width: 20, height: 20, color: mainColor),
                              SizedBox(width: 20),
                              Text("Sign up via Google",
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
                                  Get.to(() => SignIn());
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
