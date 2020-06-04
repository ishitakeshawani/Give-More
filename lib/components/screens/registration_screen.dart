import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';



class RegistrationScreen extends StatefulWidget {
  static const  String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;



  @override
  Widget build(BuildContext context) {
    return Material(
          child: Container(
    
        child:Stack(
          children: <Widget>[
                   Align(
                child: Image.asset("images/PicsArt_05-29-01.32.33.png",
                      fit: BoxFit.fill,
                  ),
                  alignment: Alignment.bottomCenter,
                   ),
                   RotatedBox(
                     quarterTurns: 2,
                  child: Align(
                child: Image.asset("images/PicsArt_05-29-01.32.33.png",
                        fit: BoxFit.fill,
                  ),
                  alignment: Alignment.bottomCenter,
                     ),
                   ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                   children: <Widget>[
                       
            
          
                    Padding(
                      padding: EdgeInsets.only(top:100.0,left:50,right: 20.0),
                    
                      child: Column(
                         
                        children: <Widget>[
                          Center(
                            child: Text('Register Here..',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Dancing Script'
                          ),
                          ),
                          ),
                          SizedBox(
                            height:90.0,
                          ),
                          TextField(
                            
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {

                                email = value;

                              },

                              decoration: InputDecoration(

                                  hintText: 'Enter your Email',
                                  hintStyle: TextStyle(
                                    fontSize:20.0
                                  ),
                                  suffixIcon: Icon(Icons.email),

                                  contentPadding:

                                  EdgeInsets.only(top: 20.0, left: 20.0),
                                  fillColor: Colors.white
                              ),

                            ),
                      SizedBox(
                        height: 50.0,
                      ),
                  
                 TextField(
                       obscureText: true,
                          onChanged: (value) {

                            password = value;

                          },

                          decoration: InputDecoration(

                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(
                                    fontSize:20.0
                                  ),
                              suffixIcon: Icon(Icons.vpn_key),

                              contentPadding:

                              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              fillColor: Colors.white
                          ),

                        ),
                        ],
                      ),
                    ),
                
                      SizedBox(
                        height:30.0
                      ),
                    
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children:<Widget>[
                            RoundedButton(title: 'Sign Up',minWidth:150.0,onPressed: () async{
                           
                           try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email , password: password);
                        if(newUser !=null){
                          Navigator.pushNamed(context, HomePage.id);
                        }


                      }
                      catch(e){
                        print(e);
                      }

                          },),
                     SizedBox(
                          height:60.0
                        ),
                        
                       

            

                  ],
          
              ),
          
          ],
        ),
          ],
          ),
          ),
    );
  }
}

