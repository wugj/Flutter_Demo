import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget{
  int data;
  ShareDataWidget(@required this.data, {Widget child}):super(child: child);

  static ShareDataWidget of(BuildContext context){
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
//    return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
//    return Text(ShareDataWidget.of(context).data.toString());
    return Text("333333");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print(" mylog:      _testWidget   didChangeDependencies  ");
  }
}

class CounterDemo extends StatefulWidget {
  @override
  _CounterDemoState createState() => _CounterDemoState();
}


class _CounterDemoState extends State<CounterDemo> {

  int data = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(data,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: _TestWidget(),
          ),
          RaisedButton(
            child: Text("Increment"),
            //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
            onPressed: () => setState(() => ++data),
          )
        ],
      )
      ),
    );
  }
}
