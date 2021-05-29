import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  bool obscureText = true;

  final _registrationformKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Register Here..',
                  style:
                      TextStyle(fontSize: 30.0, fontFamily: 'Dancing Script'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                  key: _registrationformKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          final isValidEmail = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (value.isEmpty)
                            return "Email is needed 😬";
                          else if (!isValidEmail)
                            return "Please enter a valid email";
                          else
                            return null;
                        },
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
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        obscureText: obscureText,
                        onSaved: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(fontSize: 20.0),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  if (obscureText)
                                    obscureText = false;
                                  else
                                    obscureText = true;
                                });
                              },
                              child: Icon(Icons.remove_red_eye),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            fillColor: Colors.white),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              RoundedButton(
                title: 'Sign Up',
                minWidth: 150.0,
                onPressed: () async {
                  print(email);
                  if (_registrationformKey.currentState.validate())
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);

                      if (newUser != null) {
                        Navigator.pushReplacementNamed(context, HomePage.id);
                      }
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Email is not exist!")));
                    }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
