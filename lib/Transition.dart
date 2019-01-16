import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  Animation<double> animation;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (BuildContext context, Widget child) {
            return Container(
              child: child,
              width: animation.value,
              height: animation.value,
            );
          }),
    );
  }
}
