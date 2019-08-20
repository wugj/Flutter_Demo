import 'dart:async';

import 'package:flutter/material.dart';
import 'package:startup_namer/page/UniqueColorGenerator.dart';

class KeyTestDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new KeyTestState();
  }
}

class KeyTestState extends State<KeyTestDemo>{

//  List<Widget> widgets = [StatelessContainer(), StatelessContainer()];
  List<Widget> widgets = [
    Padding(
      padding: const EdgeInsets.all(8.0),
//    child: StatefullContainer(key: GlobalKey()),
    child: StatefullContainer(key: UniqueKey()),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
//      child: StatefullContainer(key: GlobalKey()),
      child: StatefullContainer(key: UniqueKey()),
    )
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: switchWidget,
      child: Icon(Icons.undo),),
    );
  }
  switchWidget(){
    setState(() {
      widgets.insert(0, widgets.removeAt(1));
    });
  }
}

class StatefullContainer extends StatefulWidget {
  StatefullContainer({Key key}):super(key: key);

  @override
  _StatefullContainerState createState() => _StatefullContainerState();
}

class _StatefullContainerState extends State<StatefullContainer> {
  final Color color = UniqueColorGenerator().getColor();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(" mylog:      重建  ");

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}




class  StatelessContainer extends StatelessWidget{
  final Color color = UniqueColorGenerator().getColor();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }

}

