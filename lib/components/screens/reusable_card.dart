import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour,this.cardchild,this.onPress,this.image});

  final Color colour;
  final Widget cardchild;
  final Function onPress;
  final DecorationImage image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 170.0,
        child: cardchild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
            image: image,
          border: Border.all(
            color: Colors.blue
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),

    );
  }
}
