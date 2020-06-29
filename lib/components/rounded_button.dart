import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.onPressed, this.minWidth});

  final String title;
  final double minWidth;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          width: 110.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                Color(0xff36D1DC),
                Color(0xFF5B86E5),
              ]),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 30,
                    color: Colors.black38)
              ]),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
