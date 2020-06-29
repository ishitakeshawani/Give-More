import 'package:flash_chat/components/screens/clothes.dart';
import 'package:flash_chat/components/screens/health.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'exportsScreens.dart';
import 'reusable_card.dart';
import 'package:flash_chat/components/screens/education.dart';
import 'seniorpage.dart';
import 'article.dart';
import 'ehelp.dart';
import 'health.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Give More'
        ),
        actions:<Widget> [
          IconButton(
              icon: Icon(Icons.cancel),
              onPressed:(){
                Navigator.pushNamed(context, LoginScreen.id);
              }),
    ],

          ),




      body: SingleChildScrollView(
        padding:EdgeInsets.symmetric(vertical:10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Row(
              children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (
                      ){
                    Navigator.pushNamed(context, Education.id);
                  },
                  colour: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('images/edu.jpg',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                cardchild: Stack(
                      children: <Widget>[
                      Positioned(
                        left: 40.0,
                        bottom: 0.0,
                        child: Text(
                          'Education',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dancing Script',
                              decoration: TextDecoration.none,
                              fontSize: 20.0
                            ),
                        ),
                      )
                    ],
                  ),
                ),

              ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      Navigator.pushNamed(context, Health.id);
                    },
                    colour: Colors.white10,
                    image: DecorationImage(
                      image: AssetImage('images/blood.jpg',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      Navigator.pushNamed(context,Ehelp.id);
                    },
                    colour: Colors.blueGrey,
                    image: DecorationImage(
                      image: AssetImage('images/food.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      Navigator.pushNamed(context,Clothes.id);},
                    colour: Colors.white10,
                    image: DecorationImage(
                      image: AssetImage('images/clothes1.jpg',
                      ),
                    
                    ),
                  cardchild: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 10.0,
                        bottom: 0.0,
                        child: Text(
                          'Clothing Donation',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dancing Script',
                              decoration: TextDecoration.none,
                              fontSize: 20.0
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ),

              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      Navigator.pushNamed(context, Article.id);
                    },
                    colour: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('images/wash.jpg'),
                      
                    ),
                    cardchild: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10.0,
                          bottom: 0.0,
                          child: Text(
                            'Mask & Senitizer',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dancing Script',
                                decoration: TextDecoration.none,
                                fontSize: 20.0
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ),

                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      Navigator.pushNamed(context, SeniorPage.id);
                    },
                    colour: Colors.white,
                    image: DecorationImage(
                      image: AssetImage('images/senior.jpg'),
                    
            
                      
                    ),
                    cardchild: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30.0,
                          bottom: 0.0,
                          child: Text(
                            'Old-age Home',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dancing Script',
                                decoration: TextDecoration.none,
                                fontSize: 20.0
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
