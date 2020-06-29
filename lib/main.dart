import 'package:flutter/material.dart';

import 'components/screens/exportsScreens.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => InitalScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomePage.id: (context) => HomePage(),
        Education.id: (context) => Education(),
        SeniorPage.id: (context) => SeniorPage(),
        Article.id: (context) => Article(),
        Ehelp.id: (context) => Ehelp(),
        Clothes.id: (context) => Clothes(),
        Health.id: (context) => Health(),
      },
    );
  }
}
