import 'package:flutter/material.dart';
import 'package:startup_namer/WidgetUtil.dart';

class StateTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ParentWidget();
  }

}

class ParentWidget extends StatefulWidget{

  int i = 0;

  @override
  State<StatefulWidget> createState() {
    return new ParentState();
  }
}

class ParentState extends State<ParentWidget>{

  bool _actvity = false;

  void _handleTapBoxChanged(bool newState){
    widget.i += 1;
    setState(() {
      _actvity = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TapboxC(onChanged: _handleTapBoxChanged,
        active: _actvity,),
    );
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC>{

  bool _highlight = false;

  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
        onTapDown: _handleTapDown, // Handle the tap events in the order that
        onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
        onTapCancel: _handleTapCancel,
      child: Container(
        child: InkWell(
            child:  Center(
              child: WidgetUitl.buildText(fontsize: 32, color: Colors.white, text: widget.active ? "选中" : "未选中"),
            ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: 200,
          height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all(color: Colors.teal[700], width: 10) : null
        ),
      )

    );
  }

}













