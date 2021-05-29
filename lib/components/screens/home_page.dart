import 'package:flash_chat/components/screens/clothes.dart';
import 'package:flash_chat/components/screens/ehelp.dart';
import 'package:flash_chat/components/screens/exportsScreens.dart';
import 'package:flash_chat/components/screens/health.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../reusable_card.dart';
import 'package:flash_chat/components/screens/education.dart';
import 'health.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        centerTitle: true,
        leading: Container(),
        actions: [
          TextButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: Text('Do you want to logout?'),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text('Yes'),
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  "Where you want to Give More?",
                  style: GoogleFonts.acme(
                    fontSize: 45,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ReusableCard(
                      time: 1,
                      image: 'images/edu.jpg',
                      nextChild: Education(),
                    ),
                    ReusableCard(
                      time: 2,
                      image: 'images/blood.jpg',
                      nextChild: Health(),
                    ),
                    ReusableCard(
                      time: 3,
                      image: 'images/food.jpg',
                      nextChild: Ehelp(),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ReusableCard(
                      time: 4,
                      image: 'images/clothes1.jpg',
                      nextChild: Clothes(),
                    ),
                    ReusableCard(
                      time: 5,
                      image: 'images/wash.jpg',
                      nextChild: Article(),
                    ),
                    ReusableCard(
                        time: 6,
                        image: 'images/senior.jpg',
                        nextChild: SeniorPage()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
