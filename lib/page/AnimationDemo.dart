import 'package:flutter/material.dart';
import 'package:startup_namer/WidgetUtil.dart';
import 'Transition.dart';

class AnimationDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("动画测试");
    return new ScaleLogoWidget();
  }

}

class ScaleLogoWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ScaleLogoWidgetState3();
  }
}

class LogoAnimationWidgetState  extends State<ScaleLogoWidget> with SingleTickerProviderStateMixin<ScaleLogoWidget>{

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeIn)
    ..addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if(status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
  }

}

class AnimatedLogo extends AnimatedWidget{

  AnimatedLogo({Key key, Animation<double> animation})
            :super(key: key, listenable: animation);

  Tween<double>  _opacityTween = new Tween<double>(begin: 0.1, end: 1);
  Tween<double>  _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);


  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
          opacity: _opacityTween.evaluate(animation),
        child: Container(
          width: _sizeTween.evaluate(animation),
          height: _sizeTween.evaluate(animation),
          child: WidgetUitl.buildLogo(),
        ),
      ),
    );
  }

}


class ScaleLogoWidgetState3 extends State<ScaleLogoWidget> with SingleTickerProviderStateMixin<ScaleLogoWidget>{

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    animation = Tween(begin: 0.0, end: 300.0).animate(animationController)
    ..addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if(status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    })
    ;
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(animation: animation, child: WidgetUitl.buildImage(),);
  }
}

class AnimationLogo extends AnimatedWidget{

  AnimationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: new FlutterLogo(),
        width: animation.value,
        height: animation.value,
      ),
    );;
  }

}
class ScaleLogoWidgetState2 extends State<ScaleLogoWidget> with SingleTickerProviderStateMixin<ScaleLogoWidget>{

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    animation = Tween(begin: 0.0, end: 300.0).animate(animationController)
      ..addStatusListener((AnimationStatus status){
        if(status == AnimationStatus.completed){
          animationController.reverse();
        }else if(status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      })
    ;
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLogo(animation: animation,);
  }
}

class ScaleLogoWidgetState extends State<ScaleLogoWidget> with SingleTickerProviderStateMixin<ScaleLogoWidget>{

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    animation = Tween(begin: 0.0, end: 300.0).animate(animationController)
    ..addListener((){
      setState(() {
        //标识状态改变，  让框架重绘
        print("${animation.value}");
      });
    })
    ..addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if(status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    })
    ;
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: new FlutterLogo(),
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}



















