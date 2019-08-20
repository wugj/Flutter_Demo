

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup_namer/common/PageRouter.dart';
import 'package:startup_namer/page/AnimationDemo.dart';
import 'package:startup_namer/page/LayoutDemo.dart';
import 'package:startup_namer/page/RouteDemo.dart';
import 'package:startup_namer/page/ShoppingList.dart';
import 'package:startup_namer/page/LayoutTest.dart';
import 'package:startup_namer/page/Signature.dart';
import 'package:startup_namer/page/StateTest.dart';
import 'package:startup_namer/page/TextFieldDemo.dart';
import 'package:startup_namer/page/ThemeDemo.dart';
import 'package:startup_namer/main_test.dart';

class AppFactoroy{

  static const int WIDGET_MAIN = 0;
  static const int WIDGET_SHOPPING = 1;
  static const int WIDGET_LAYOUT = 2;
  static const int WIDGET_LAYOUT_TEST = 3;
  static const int WIDGET_STATE_TEST = 4;
  static const int WIDGET_SIGNATURE = 5;
  static const int WIDGET_ANIMATION_TEST = 6;
  static const int WIDGET_TEXT_FIELD_TEST = 7;
  static const int WIDGET_ROUTE_TEST = 8;
  static const int WIDGET_THEME_TEST = 9;
  static const int WIDGET_MAIN_TEST = 10;

  Widget getWidget(int widget){
    switch(widget){
      case WIDGET_MAIN:
        return buildDemoWidget("测试首页", new MainTest());
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
      case WIDGET_ROUTE_TEST:
        return buildDemoWidget("页面跳转测试", new RouteDemo());
      case WIDGET_THEME_TEST:
        return buildDemoWidget("主题测试", new ThemeTestRoute());
      case WIDGET_MAIN_TEST:
        return buildDemoWidget("测试页面测试", new MainTest());
    }
    return null;
  }



  Widget buildDemoWidget(String test, Widget body){
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text(test),),
        body: body,
      ),
      routes: PageRounter().rountMap,
    );
  }

  Widget getLayoutDemoWidget(){
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: new Text("布局测试"),),
        body: new LayoutDemoWidget(),
      ),
      routes: <String, WidgetBuilder>{

      },
    );
  }

  Widget getShoppingListWidget(){
    return new ShoppingList(products: [
        new Product(name: "Eggs"),
        new Product(name: "Flours"),
        new Product(name: "Chocolate chips")
      ]
    );
  }
}