import 'package:flash_chat/components/screens/article.dart';
import 'package:flash_chat/components/screens/education.dart';
import 'package:flash_chat/components/screens/home_page.dart';
import 'package:flash_chat/components/screens/seniorpage.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/screens/login_screen.dart';
import 'package:flash_chat/components/screens/registration_screen.dart';
import 'package:flash_chat/components/screens/ehelp.dart';
import 'package:flash_chat/components/screens/clothes.dart';
import 'package:flash_chat/components/screens/health.dart';


void main() => runApp(
    FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes:{
        LoginScreen.id:(context) =>LoginScreen(),
        RegistrationScreen.id:(context) => RegistrationScreen(),
        HomePage.id:(context) => HomePage(),
        Education.id:(context) => Education(),
        SeniorPage.id:(context) => SeniorPage(),
        Article.id:(context) => Article(),
        Ehelp.id:(context) => Ehelp(),
        Clothes.id:(context) =>Clothes(),
        Health.id:(context) =>Health(),
      }
    );
  }
}


 