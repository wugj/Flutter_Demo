import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestWdiget2 extends StatefulWidget {
  @override
  _TestWdiget2State createState() => _TestWdiget2State();
}

class _TestWdiget2State extends State<TestWdiget2> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(" mylog:      test  init   ${this}") ;
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print(" mylog:      test  deactivate   ${this}") ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print(" mylog:      test  dispose   ${this}") ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: Colors.blueAccent,
    );
  }
}


class LTscrollbarDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ListView.builder(itemBuilder: (context, index){
      if (index % 3 != 0) {
        return TestWdiget2();
      }
      return LTScrollviewBar(
          height: 196,
          itemCount: 8,
          isShowScrollBar: true,
          space: EdgeInsets.only(top: 8),
          separatorBuilder: (context, index) => Container(width: 16, color: Colors.white,),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 128,
              color: Colors.red,
            );
          });

    });
  }



}



class LTScrollviewBar extends StatefulWidget {

  Color scrollbarColor;
  Color scrollbarSelectColor;
  Size scrollbarSize;
  double height;
  @required IndexedWidgetBuilder itemBuilder;
  @required int itemCount;
  IndexedWidgetBuilder separatorBuilder;
  double lineWidth;
  EdgeInsetsGeometry space;
  bool isShowScrollBar;


  LTScrollviewBar({this.scrollbarColor, this.scrollbarSelectColor,
      this.scrollbarSize, this.height, this.itemBuilder, this.itemCount,
      this.separatorBuilder, this.lineWidth, this.space, this.isShowScrollBar = true,Key key}):
      assert(itemBuilder != null),
      super(key: key){
      this.scrollbarSize = scrollbarSize ?? Size(27, 3);
      this.scrollbarColor = scrollbarColor ?? Color(0xFFE9E9E9);
      this.scrollbarSelectColor = scrollbarSelectColor ?? Color(0xffFB335D);
      this.lineWidth = lineWidth ?? 4;
      this.separatorBuilder = separatorBuilder ?? (context, index) => Container(width: 0, height: 0,);
  }

  @override
  _LTScrollviewBarState createState() => _LTScrollviewBarState();
}

class _LTScrollviewBarState extends State<LTScrollviewBar> {

  ScrollController _controller;
  MyPainter _printer;

  @override
  void initState() {
    super.initState();
    print(" mylog:      init  ${this}");
    _controller = ScrollController();
  }

  @override
  void didUpdateWidget(LTScrollviewBar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print(" mylog:      didUpdateWidget  ${this}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(" mylog:      didchangeDependencies ${this} ");
    _printer = MyPainter(scrollbarColor: widget.scrollbarColor,
        scrollbarSelectColor: widget.scrollbarSelectColor, lineWidth: widget.lineWidth);
    WidgetsBinding.instance.addPostFrameCallback((callback){
      _controller.jumpTo(0.01);
    });
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print(" mylog:      deactivate ${this} ");
  }

  @override
  void dispose() {
    super.dispose();
    print(" mylog:      dispose ${this} ");
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: widget.height,
          child: NotificationListener(
            onNotification: (notification){
              if(notification is ScrollNotification) {
                if(notification.metrics.axis == Axis.horizontal){
                  _printer.update(notification.metrics);
                }
              }
              return false;
            },
            child: ListView.separated(
              key: PageStorageKey(this),
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: widget.itemBuilder,
                separatorBuilder: widget.separatorBuilder ,
                itemCount: widget.itemCount),
          ),
        ),
        widget.isShowScrollBar ?  Container(
          margin: widget.space,
          child: CustomPaint(
            foregroundPainter: _printer,
            size: widget.scrollbarSize,
          ),
        ) : SizedBox(width: 0, height: 0,)
      ],
    );
  }
}

class MyPainter extends ChangeNotifier implements CustomPainter{

  double length;
  double width;

  Color scrollbarColor;
  Color scrollbarSelectColor;
  double lineWidth;

  ScrollMetrics _lastMetrics;


  MyPainter({this.scrollbarColor, this.scrollbarSelectColor, this.lineWidth}): super();

  Paint _paint = Paint()
  .. strokeCap = StrokeCap.round
  .. isAntiAlias = true
  .. style = PaintingStyle.fill;


  void update(
      ScrollMetrics metrics,
      ) {
    _lastMetrics = metrics;
    notifyListeners();
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(" mylog:      paint  ");
    if(_lastMetrics == null) {
      return;
    }
    _paint.strokeWidth = lineWidth;
    // TODO: implement paint
    _paint.color = scrollbarColor;
    canvas.drawLine(Offset(0,0), Offset(size.width, 0), _paint);

    _paint.color = scrollbarSelectColor;

    if(width == null) {
      width = (_lastMetrics.viewportDimension / _lastMetrics.maxScrollExtent) * size.width;
    }

    length = _lastMetrics.pixels / _lastMetrics.maxScrollExtent;

    double scrollPix = (size.width - width) * length;
    canvas.drawLine(Offset(scrollPix, 0), Offset(scrollPix + width, 0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

  @override
  bool hitTest(Offset position) {
    // TODO: implement hitTest
    return false;
  }

  @override
  // TODO: implement semanticsBuilder
  get semanticsBuilder => null;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) {
    // TODO: implement shouldRebuildSemantics
    return false;
  }

}
