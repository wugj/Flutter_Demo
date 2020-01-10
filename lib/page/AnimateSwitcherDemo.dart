import 'package:flutter/material.dart';

class AnimateSwitcherDemo extends StatefulWidget {
  @override
  _AnimateSwitcherDemoState createState() => _AnimateSwitcherDemoState();
}

class _AnimateSwitcherDemoState extends State<AnimateSwitcherDemo> {

  IconData _actionIcon = Icons.delete;
  int _count = 0;
  MaterialColor _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    Key valueKey = ValueKey(_actionIcon);
    print(" mylog:      key:         $valueKey   color:   $_color");
    return Scaffold(
      appBar: AppBar(
         title: Text("animatedSwitcher"),
        actions: <Widget>[
          AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              transitionBuilder: (child, anim){
//                return ScaleTransition(scale: anim, child: child,);
                return RotationTransition(turns: anim, child: child, alignment: Alignment.center,);
              },
            child: IconButton(
                key: valueKey,
                icon: Icon(_actionIcon),
                onPressed: (){
                  setState(() {
                    if (_actionIcon == Icons.delete)
                      _actionIcon = Icons.done;
                    else
                      _actionIcon = Icons.delete;
                  });
                }),
          )
        ],
      ),
      body: Center(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AnimatedSwitcher(
                duration: Duration(milliseconds: 300),

              transitionBuilder: (child, anim){
                  anim.addStatusListener((value){
                    print(" mylog:      anime status :  $value  ");
                  });
                  anim.addListener((){
                    print(" mylog:      anime status value: ${anim.value}  ");
                    var tween = Tween<Color>(begin: Colors.red, end: Colors.green);
                    setState(() {
                      _color = tween.evaluate(anim);
                      print(" mylog:      color:  $_color  ");
                    });

                  });
//                  var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
//                  return ScaleTransition(scale: anim, child: child,);
//                  return SlideTransition(position: tween.animate(anim), child: child,);
                  return SlideTransitionX(position: anim, child: child, direction: AxisDirection.up,);
              },
              child: Text("$_count", key: ValueKey(_count),),
            ),
            RaisedButton(
              child: Text("+1"),
                onPressed: (){
                  setState(() {
                    _count++;
                  });
            }),
            Container(
              width: 100,
              height: 100,
              color: _color,
            )
          ],
        ),
      ),
    );
  }
}

class SlideTransitionX extends AnimatedWidget{

  SlideTransitionX({
    Key key,
    this.child,
    this.transformHitTests = true,
    this.direction = AxisDirection.up,
    @required Animation<double> position,
  }):super(listenable: position, key: key){
    switch(direction){
      case AxisDirection.left:
        _tween = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.up:
        _tween = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;
  final Widget child;
  final bool transformHitTests;

  final AxisDirection direction;
  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Animation<Offset> animation = _tween.animate(position);
    Offset offset = animation.value;
    offset = _tween.evaluate(position);
    if(position.status == AnimationStatus.reverse){
      switch(direction){
        case AxisDirection.up:
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
        child: child,
    );
  }
}
