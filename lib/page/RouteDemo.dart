import 'package:flutter/material.dart';
import 'package:startup_namer/common/AppFactory.dart';

class RouteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FirstPage();
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Column(
      children: <Widget>[
        RaisedButton(
            child: Text("secondPage"),
            onPressed: () {
//              Navigator.pushNamed(context, Contants.PAGE_SECONDE);

//            Navigator.of(context).push(PageRouteBuilder(pageBuilder: null))

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SecondPage("哈哈哈哈这是参数")),

              );
            }),
      ],
    ));
  }
}

class SecondPage extends StatelessWidget {

   String  params;

  SecondPage(this.params);

  @override
  Widget build(BuildContext context) {
    AppFactoroy factoroy = new AppFactoroy();
    return factoroy.buildDemoWidget(
        "secondPage",
        Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(child: Center(child: Text(params),))
            ],
          ),
        ));
  }
}
