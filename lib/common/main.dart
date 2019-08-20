import 'package:flutter/material.dart';
import 'package:startup_namer/common/AppFactory.dart';
import 'package:startup_namer/common/WidgetFactory.dart';
import 'package:startup_namer/material/MaterialTest.dart';
import 'package:flutter/rendering.dart';
import 'package:redux/redux.dart';
import 'package:startup_namer/page/redux/StoreManager.dart';


void main() {

  // 初始化 redux 状态管理器

//  final store = new Store<int>();
  StoreManager.instance().initStore();

//  debugPaintSizeEnabled = true;
  runApp(new AppFactoroy().getWidget(AppFactoroy.WIDGET_MAIN_TEST));
//  runApp(new MyWidget());
//  runApp(MaterialApp(
//    home: WidgetFactory.buildSimpelPageWidget("素材测试0", new MaterialTest(0)),
//  ));
}

class MyWidget extends StatelessWidget{

  final String _message = "Flutter 框架分析";

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
    ) ;
  }

}


