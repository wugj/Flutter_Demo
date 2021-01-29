import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/common/AppFactory.dart';

import 'PartRefreshCounterWidget.dart';

class PartRefreshWidgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("计数器"),
              onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  AppFactoroy().buildDemoWidget("计数器", PartRefreshCounterWidget())));
          })
        ],
      ),
    );
  }
}
