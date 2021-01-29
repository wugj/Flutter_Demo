// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:startup_namer/common/main.dart';
import 'package:startup_namer/main_test.dart';

void main() {
  MainTest();
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   var son = Son();
  //       son.init();
  // });

}

abstract class First {
  void init(){
    print('first');
  }
}

abstract class Second{
  void init(){
    print("second");
  }
}

class Father{
  void init(){
    print("father");
  }
}

mixin FirstMixinFather on Father{
  void init(){
    print("first mixin init start");
    super.init();
    print("first mixin init end");
  }
}

mixin SecondMixinFather on Father{
  void init(){
    print("second mixin init start");
    super.init();
    print("second mixin init end");
  }
}

class Son extends Father with FirstMixinFather, SecondMixinFather{
  @override
  void init() {
    print("son init start");
    super.init();
    print("son init end");
  }
}
