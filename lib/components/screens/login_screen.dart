import 'dart:ui';
import 'package:flash_chat/components/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'exportsScreens.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;

  bool obsecureText = true;

  bool showLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: <Widget>[
            Align(
              child: Image.asset(
                "images/PicsArt_05-29-01.32.33.png",
                fit: BoxFit.fill,
              ),
              alignment: Alignment.bottomCenter,
            ),
            RotatedBox(
              quarterTurns: 2,
              child: Align(
                child: Image.asset(
                  "images/PicsArt_05-29-01.32.33.png",
                  fit: BoxFit.fill,
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 130,
                  ),
                  Icon(
                    FlutterIcons.user_alt_faw5s,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              email = value;
                            },
                            validator: (value) {
                              final validEmail = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                              if (!validEmail.hasMatch(value)) {
                                return "Please enter valid email";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter your Email',
                                hintStyle: TextStyle(fontSize: 20.0),
                                suffixIcon: Icon(Icons.email),
                                contentPadding:
                                    EdgeInsets.only(top: 20.0, left: 20.0),
                                fillColor: Colors.white),
                            onChanged: (value){
                              email = value;
                            },
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          TextFormField(
                            obscureText: obsecureText,
                            onSaved: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter your Password',
                                hintStyle: TextStyle(fontSize: 20.0),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (obsecureText)
                                        obsecureText = false;
                                      else
                                        obsecureText = true;
                                    });
                                  },
                                  child: Icon(Icons.vpn_key),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                fillColor: Colors.white),
                            onChanged: (value){
                              password = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  RoundedButton(
                    title: 'Log In',
                    minWidth: 150.0,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        setState(() {
                          showLoading = true;
                        });
                        doLoging();
                        FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width - 100,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "New here?"),
                        TextSpan(
                            text: " Sign up",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).primaryColor),
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
            (showLoading)
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void doLoging() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (user != null) {
        setState(() {
          showLoading = false;
        });
        Navigator.pushNamed(context, HomePage.id);
      }
    } catch (e) {
      print(e);
    }
  }
}
