

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup_namer/LayoutDemo.dart';
import 'package:startup_namer/ShoppingList.dart';
import 'package:startup_namer/LayoutTest.dart';
import 'StateTest.dart';
import 'Signature.dart';
import 'AnimationDemo.dart';
import 'TextFieldDemo.dart';

class AppFactoroy{

  static const int WIDGET_SHOPPING = 1;
  static const int WIDGET_LAYOUT = 2;
  static const int WIDGET_LAYOUT_TEST = 3;
  static const int WIDGET_STATE_TEST = 4;
  static const int WIDGET_SIGNATURE = 5;
  static const int WIDGET_ANIMATION_TEST = 6;
  static const int WIDGET_TEXT_FIELD_TEST = 7;

  Widget getWidget(int widget){
    switch(widget){
      case WIDGET_SHOPPING:
        return getShoppingListWidget();
      case WIDGET_LAYOUT:
        return getLayoutDemoWidget();
      case WIDGET_LAYOUT_TEST:
        return buildDemoWidget("横竖布局测试", new LayoutTest());
      case WIDGET_STATE_TEST:
        return buildDemoWidget("状态测试", new StateTest());
      case WIDGET_SIGNATURE:
        return buildDemoWidget("签名测试", new Signature());
      case WIDGET_ANIMATION_TEST:
        return buildDemoWidget("动画测试", new AnimationDemo());
      case WIDGET_TEXT_FIELD_TEST:
        return buildDemoWidget("输入测试", new TextFieldDemo());
    }
    return null;
  }



  Widget buildDemoWidget(String test, Widget body){
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text(test),),
        body: body,
      ),
    );
  }

  Widget getLayoutDemoWidget(){
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text("布局测试"),),
        body: new LayoutDemoWidget(),
      ),
    );
  }

  Widget getShoppingListWidget(){
    return new MaterialApp(
      home: new ShoppingList(products: [
        new Product(name: "Eggs"),
        new Product(name: "Flours"),
        new Product(name: "Chocolate chips")
      ],),
    );
  }
}