import 'package:flash_chat/components/screens/home_page.dart';
import 'package:flash_chat/components/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InitalScreen extends StatefulWidget {
  @override
  _InitalScreenState createState() => _InitalScreenState();
}

class _InitalScreenState extends State<InitalScreen> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.currentUser().then((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, HomePage.id);
      }
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
