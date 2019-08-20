
import 'package:flutter/material.dart';
import 'package:startup_namer/common/AppFactory.dart';
import 'package:startup_namer/common/WidgetFactory.dart';

class ThemeTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ThemeTestRouteState();
  }
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {

  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
          primaryColor: _themeColor,
          iconTheme: IconThemeData(color: _themeColor)
        ),
        child: Scaffold(
          appBar: WidgetFactory.buildAppBar("主题测试"),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  WidgetFactory.buildText("颜色随主题改变")
                ],
              ),
              Theme(
                  data: themeData.copyWith(
                    iconTheme: themeData.iconTheme.copyWith(
                      color: Colors.black
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.favorite),
                      Icon(Icons.airport_shuttle),
                      Text("黑色主题")
                    ],
                  )
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () =>
            setState(() =>
              _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal
            ),
            child: Icon(Icons.palette),
          ),
        )
    );
  }

}