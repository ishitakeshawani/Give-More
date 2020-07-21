import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  ReusableCard({this.image, this.time, this.nextChild});

  final String image;
  final double time;
  final Widget nextChild;

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard>
    with TickerProviderStateMixin {
  final Tween<Offset> tween = Tween(begin: Offset(0.5, 0), end: Offset(0, 0));
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInQuad,
    );
    Future.delayed(
      Duration(milliseconds: 200 * widget.time.toInt()),
      () {
        animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(tween),
      child: FadeTransition(
        opacity: animation,
        child: OpenContainer(
            openColor: Theme.of(context).accentColor,
            closedColor: Theme.of(context).accentColor,
            transitionDuration: Duration(milliseconds: 200),
            transitionType: ContainerTransitionType.fade,
            closedElevation: 0,
            openBuilder: (c, a) {
              return widget.nextChild;
            },
            closedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            closedBuilder: (c, a) {
              return Container(
                height: 170.0,
                width: 170.0,
                margin: EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 15,
                      color: Colors.black38,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
