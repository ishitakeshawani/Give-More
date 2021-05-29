import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
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

  final List<String> orgs = [
    "Protect Others",
    "Donate Mask",
    "Sanitize India",
    "Be Safe ",
    "Mantra Foundation",
    "Go Corona",
    "Let's Fight India",
  ];

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_a7AJBgKRKYFzzc',
      'amount': totalAmount * 100,
      'name': 'Test Purpose',
      'description': 'test payment',
      'prefill': {'contact': '', 'email': ' '},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCESS: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'ERROR: ' + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL WALLET  " + response.walletName);
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
          icon: Icon(FlutterIcons.ios_arrow_back_ion),
          color: Colors.white.withOpacity(0.8),
          iconSize: 30.0,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Organizations',
          style: GoogleFonts.acme(
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: orgs.length,
        itemBuilder: (context, index) =>
            buildRadioListTile(orgs[index], index + 1),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          FlutterIcons.payment_mdi,
          color: Colors.white.withOpacity(0.9),
        ),
        onPressed: () {
          _scaffoldKey.currentState.showBottomSheet(
            (context) => Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 8,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff4f6ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 400,
                  child: buildPaymentBar(),
                ),
              ),
              color: Colors.transparent,
            ),
          );
        },
        backgroundColor: Color(0xffffbcbc),
      ),
    );
  }

  Widget buildPaymentBar() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      elevation: 10,
      onPrimary: Theme.of(context).accentColor,
      primary: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: GoogleFonts.acme(fontSize: 50, color: Colors.black54),
            decoration: InputDecoration.collapsed(
                hintText: 'Enter Amount',
                hintStyle: GoogleFonts.acme(
                  fontSize: 50,
                )),
            onChanged: (value) {
              setState(() {
                totalAmount = num.parse(value);
              });
            },
          ),
          SizedBox(
            height: 15.0,
          ),
          ElevatedButton(
            style: raisedButtonStyle,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Donate Now',
                style: GoogleFonts.acme(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {
              openCheckout();
            },
          ),
        ],
      ),
    );
  }

  Widget buildRadioListTile(String name, int value) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          020,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 16,
            color: Colors.black26,
          )
        ],
      ),
      child: RadioListTile(
        value: value,
        groupValue: selectedRadio,
        title: Text(
          name,
          style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black87),
        ),
        activeColor: Theme.of(context).primaryColor,
        onChanged: (val) {
          setSelectedRadio(val);
        },
      ),
    );
  }
}
