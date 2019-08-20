import 'package:flutter/material.dart';
//import 'package:flutter_boost/flutter_boost.dart';


class InnerBody extends StatelessWidget{
  InnerBody(this.body);
  Widget body;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: body, onWillPop: (){
      print("kaishi   will pop");
      if(Navigator.of(context).canPop()){
        return Future.value(true);
      }else{
        print("close");
        return Future.value(false);
//        FlutterBoost.singleton.closePageForContext(context);
      }
    });
  }

}

/**
 * 通用组件生成器
 */
class WidgetFactory {

  static Widget buildSimpelPageWidget(String title, Widget body){
    return WidgetFactory.buildPageWidget(WidgetFactory.buildAppBar(title), body);
  }

  static Widget buildPageWidget(Widget appbar, Widget body){
    return InnerBody(new Scaffold(
        appBar: appbar,
        body:  body,
    ));
  }

  static Widget buildAppBar(@required String title, {IconData iconData, VoidCallback onPressed}) {
    return new AppBar(
      leading: Builder(
          builder: (context) {
            return WidgetFactory.buildIconButton(iconData != null ? iconData : Icons.accessibility, onPressed: onPressed != null ? onPressed : () {
              print("kaishi  maypop ");
              Navigator.maybePop(context);
            });
          }
      ),
      title: WidgetFactory.buildText(title),
    );
  }

  static Widget buildText(@required String text,
      {Color color, double fonsize}) {
    return new Text(
      text,
      style: new TextStyle(color: color, fontSize: fonsize),
    );
  }

  static Widget buildIconButton(@required IconData icon,
      {VoidCallback onPressed}) {
    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }
}
