import 'package:flutter/material.dart';
import 'package:startup_namer/page/AnimationDemo.dart';
import 'package:startup_namer/page/BannerPageDemo.dart';
import 'package:startup_namer/page/CartProviderDemo.dart';
import 'package:startup_namer/page/Counter.dart';
import 'package:startup_namer/page/LayoutDemo.dart';
import 'package:startup_namer/page/LayoutTest.dart';
import 'package:startup_namer/page/RouteDemo.dart';
import 'package:startup_namer/page/ShoppingList.dart';
import 'package:startup_namer/page/Signature.dart';
import 'package:startup_namer/page/StateTest.dart';
import 'package:startup_namer/page/TextFieldDemo.dart';
import 'package:startup_namer/page/ThemeDemo.dart';
import 'package:startup_namer/common/WidgetFactory.dart';
import 'package:startup_namer/page/fishredux/firstPage/FishFirstPage.dart';
import 'package:startup_namer/page/key_test.dart';
import 'package:startup_namer/page/pointer_event_demo.dart';
import 'package:startup_namer/common/AppFactory.dart';
import 'package:startup_namer/page/redux/ReduxFiresPage.dart';
import 'package:startup_namer/page/viewpager/tab_bar_page_demo.dart';

class MainTest extends StatelessWidget {
  AppFactoroy _factoroy = AppFactoroy();

  @override
  Widget build(BuildContext context) {

    return Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: <Widget>[
                buildWidget(context, "shoppingList",
                    new ShoppingList(
                        products: [
                          new Product(name: "Eggs"),
                          new Product(name: "Flours"),
                          new Product(name: "Chocolate chips")
                        ]
                )),
                buildWidget(context, "LayoutDemo", new LayoutDemoWidget()),
                buildWidget(context, "横竖布局测试", new LayoutTest()),
                buildWidget(context, "状态测试", new StateTest()),
                buildWidget(context, "签名测试", new Signature()),
                buildWidget(context, "动画测试",  new AnimationDemo()),
                buildWidget(context, "输入测试", new TextFieldDemo()),
                buildWidget(context, "页面跳转测试",  new RouteDemo()),
                buildWidget(context, "主题测试", new ThemeTestRoute()),
                buildWidget(context, "pointerEvent测试", new PointterEventDemo()),
                buildWidget(context, "key测试1", new KeyTestDemo()),
                buildWidget(context, "tabbar测试", new TabBarPageDemo()),
                buildWidget(context, "redux测试", new ReduxTestFirstPage()),
                buildWidget(context, "咸鱼 redux测试", FishFirstPage().buildPage(null), isAppbar: false),
                buildWidget(context, "banner测试", new BannerPage()),
                buildWidget(context, "计数器InheritedWidget测试", new CounterDemo()),
                buildWidget(context, "购物车Provider测试", new CartProviderDemo()),
              ],
            ),
          ),
        )
    );
  }

  Widget buildWidget(BuildContext context, String title, Widget widget, {bool isAppbar = true}){
    return RaisedButton(
        child: Text(title),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder:  (context) => isAppbar ? _factoroy.buildDemoWidget(title, widget) : widget))
    );
  }

}
