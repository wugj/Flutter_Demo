
import 'package:flutter/material.dart';
import 'package:startup_namer/common/WidgetFactory.dart';
import 'package:startup_namer/material/MaterialTest.dart';

class MaterialMainPage extends StatelessWidget{

  MaterialMainPage(this.count);
  int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(child: WidgetFactory.buildText("装修素材页$count"),
                    onPressed: () => Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => WidgetFactory.buildSimpelPageWidget("装修素材页$count  Test", new MaterialTest(count + 1)),))),
                RaisedButton(child: WidgetFactory.buildText("装修素材页$count"),
                    onPressed: () => Navigator.of(context).pop()),
              ],
            ),
          ),
        ));
  }
}


