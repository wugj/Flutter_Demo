import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startup_namer/page/CustomPageScrollViewDemo.dart';
import 'package:startup_namer/page/util/log.dart';

class PartRefreshCounterWidget extends StatefulWidget {
  @override
  _PartRefreshCounterWidgetState createState() =>
      _PartRefreshCounterWidgetState();
}

class _PartRefreshCounterWidgetState extends State<PartRefreshCounterWidget> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  int _counter2 = 0;

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FLog("========build");
    return Stack(
      // alignment: AlignmentDirectional.center,
      // fit: StackFit.expand,
      children: <Widget>[

        Center(
          child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) => Text('asdf$value'),
          ),
        ),
        ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) => CounterWidget('纯纯粹粹$value')
        ),
        Text("22222   $_counter2"),
        Positioned(
          bottom: 20,
            right: 20,
            child: FloatingActionButton(
          onPressed: () => _counter.value += 1,
          child: Icon(Icons.add),
        )),
        Positioned(
            bottom: 90,
            right: 20,
            child: RaisedButton(
              onPressed: () => setState((){
                _counter2 += 1;
              }),
              child: Icon(Icons.add_alarm),
            ))

      ],
    );
  }
}

// class CounterWidget extends StatelessWidget {
//
//   String text;
//
//   @override
//   Widget build(BuildContext context) {
//     FLog("====CounterWidget====build");
//
//     return Container(
//       child: Text(text),
//     );
//   }
//
//   CounterWidget(this.text);
// }


class CounterWidget extends StatefulWidget {

  String text;
  @override
  _CounterWidgetState createState() => _CounterWidgetState();

  CounterWidget(this.text);
}

class _CounterWidgetState extends State<CounterWidget> {

  int _counter2 = 0;


  @override
  Widget build(BuildContext context) {
    FLog("====CounterWidget====build");
    return Column(
      children: <Widget>[
        Text(widget.text),
        Text("子孩子  $_counter2"),
        FloatingActionButton(
          onPressed: () => setState((){
            _counter2 += 1;
          }),
          child: Icon(Icons.add_alarm),
        )

      ],
    );
  }
}
