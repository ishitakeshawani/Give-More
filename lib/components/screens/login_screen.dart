import 'dart:ui';

import 'package:flash_chat/components/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 100.0, left: 50, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Enter your Email',
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  suffixIcon: Icon(Icons.email),
                                  contentPadding:
                                      EdgeInsets.only(top: 20.0, left: 20.0),
                                  fillColor: Colors.white),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundedButton(
                      title: 'Log In',
                      minWidth: 150.0,
                      onPressed: () async {
                        _formKey.currentState.save();
                        setState(() {
                          showLoading = true;
                        });
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
                      },
                    ),
                    SizedBox(height: 100.0),
                    Text(
                      'Sign Up for New Account',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    RoundedButton(
                      title: 'Sign Up',
                      minWidth: 150.0,
                      onPressed: () async {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
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
}
