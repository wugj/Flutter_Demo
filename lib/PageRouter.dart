
import 'package:flutter/widgets.dart';
import 'Constans.dart';
import 'RouteDemo.dart';


class PageRounter{

  Map<String, WidgetBuilder> rountMap = <String, WidgetBuilder>{};

  PageRounter(){
    rountMap[Contants.PAGE_FIRST] = (WidgetBuilder) => FirstPage();
    rountMap[Contants.PAGE_SECONDE] = (WidgetBuilder) => SecondPage("第二页来了");
  }




}