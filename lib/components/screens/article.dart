import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/services.dart';

class Article extends StatefulWidget {
  static const String id = 'article';
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  static int totalAmount = 0;
  Razorpay _razorpay;
  int selectedRadio;

  @override
  void initState(){
    super.initState();
    selectedRadio = 0;
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;

    });
  }
  @override
  void dispose(){
    super.dispose();
    _razorpay.clear();
  }
  void openCheckout() async {
    var options = {
      'key': 'rzp_test_a7AJBgKRKYFzzc' ,
      'amount': totalAmount * 100 ,
      'name': 'Test Purpose' ,
      'description': 'test payment' ,
      'prefill': {
        'contact': '' ,
        'email': ' '
      } ,
      'external': {
        'wallets': ['paytm']
      }
    };
    try{
      _razorpay.open(options);
    }
    catch(e){
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCESS: "+response.paymentId);
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: 'ERROR: '+response.code.toString()+" - "+ response.message);

  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL WALLET  "+response.walletName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(icon: Icon(Icons.home) ,
          iconSize: 30.0,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:Text(
          'Organizations',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Dancing Script',
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      body:SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RadioListTile(
                  value: 1,
                  groupValue: selectedRadio,
                  title: Text("Donate Mask",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  activeColor: Colors.blue,
                  onChanged: (val){
                    setSelectedRadio(val);
                  },
                ),
                Divider(
                  color: Colors.blue,
                ),
                RadioListTile(
                  value: 2,
                  groupValue: selectedRadio,
                  title: Text("Sanitize India",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  activeColor: Colors.blue,
                  onChanged: (val){
                    setSelectedRadio(val);
                  },
                ),
                Divider(
                  color: Colors.blue,
                ),
                RadioListTile(
                  value: 3,
                  groupValue: selectedRadio,
                  title: Text("Be Safe ",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  activeColor: Colors.blue,
                  onChanged: (val){
                    setSelectedRadio(val);

                  },
                ),
                Divider(
                  color: Colors.blue,
                ),
                RadioListTile(
                  value: 4,
                  groupValue: selectedRadio,
                  title: Text("Mantra Foundation",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  activeColor: Colors.blue,
                  onChanged: (val){
                    setSelectedRadio(val);

                  },
                ),
                Divider(
                  color: Colors.blue,
                ),
                RadioListTile(
                  value: 5,
                  groupValue: selectedRadio,
                  title: Text("Go Corona",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  activeColor: Colors.blue,
                  onChanged: (val){
                    setSelectedRadio(val);

                  },
                ),
                Divider(
                  color: Colors.blue,
                ),
                RadioListTile(
                  value: 6,
                  groupValue: selectedRadio,
                  title: Text("Let's Fight India",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  activeColor: Colors.blue,
                  onChanged: (val){
                    setSelectedRadio(val);

                  },
                ),
                Divider(
                  color: Colors.blue,
                ),
                RadioListTile(
                  value: 7,
                  groupValue: selectedRadio,
                  title: Text("Protect Others",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  activeColor: Colors.blue,
                  onChanged: (val){
                    setSelectedRadio(val);

                  },
                ),
                Divider(
                  color: Colors.blue,
                ),


                SizedBox(
                  height: 10.0,
                ),
                TextField(

                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Please Enter Amount' ,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.lightBlueAccent,width: 2.0
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      )


                  ),
                  onChanged: (value){
                    setState(() {
                      totalAmount = num.parse(value);
                    });
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                RaisedButton(
                  color: Colors.cyan,
                  child: Text(
                    'Donate Now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Dancing Script',
                    ),
                  ),
                  onPressed: (){
                    openCheckout();
                  },
                ),

              ],
            )
        ),
      ),
    );
  }
}
