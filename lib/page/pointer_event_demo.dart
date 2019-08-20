
import 'package:flutter/material.dart';

class PointterEventDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: <Widget>[
                buildListenerTestWidget1(),
                buildListenerTestWidget2(),
                buildListenerTestWidget3(),
                buildListenerTestWidget4(),
                buildListenerTestWidget5(),
                buildListenerTestWidget6(),
              ],
            ),
          ),
        )
    );
  }

  Widget buildListenerTestWidget1() {
    return createTestWidget(" deferTochild", HitTestBehavior.deferToChild);
  }
  Widget buildListenerTestWidget2() {
    return createTestWidget(" opaue", HitTestBehavior.opaque);
  }
  Widget buildListenerTestWidget3() {
    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300, 200)),
              child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
          ),
          onPointerDown: (event) => print("translucent 111  down0"),
        ),
        Listener(
          child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200, 100)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击  none  trunslucent"),),
          ),
          onPointerDown: (event) => print("translucent 111  down1"),
        )
      ],
    );
  }
  Widget buildListenerTestWidget4() {
    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300, 200)),
              child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
          ),
          onPointerDown: (event) => print("translucent 222  down0"),
        ),
        Listener(
          child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200, 100)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击  have  trunslucent"),),
          ),
          onPointerDown: (event) => print("translucent 222  down1"),
          behavior: HitTestBehavior.translucent,
        )
      ],
    );
  }

  Widget buildListenerTestWidget5() {
    return Listener(
      child: AbsorbPointer(
        child: Listener(
          child: Container(
            color: Colors.red,
            width: 200,
            height: 100 ,
          ),
          onPointerDown: (event) => print(" absorb  in"),
        ),
      ),
      onPointerDown: (event) => print(" absorb  out"),
    );
  }
  Widget buildListenerTestWidget6() {
    return Listener(
      child: IgnorePointer(
        child: Listener(
          child: Container(
            color: Colors.red,
            width: 200,
            height: 100 ,
          ),
          onPointerDown: (event) => print(" ignore  in"),
        ),
      ),
      onPointerDown: (event) => print(" ignore  out"),
    );
  }

  Widget createTestWidget(String text, HitTestBehavior behavior){
    return Listener(
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(Size(300, 150)),
        child: Center(
          child: Text("Box $text"),
        ),
      ),
      behavior: behavior,
      onPointerDown: (event) => print("down $text"),
    );
  }



}