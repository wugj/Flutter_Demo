import 'dart:developer' as prefix0;
import 'dart:math';

import 'package:flutter/material.dart';

class CustomPageScrollViewDemoPage extends StatefulWidget {
  @override
  _CustomPageScrollViewDemoPageState createState() => _CustomPageScrollViewDemoPageState();
}

class _CustomPageScrollViewDemoPageState extends State<CustomPageScrollViewDemoPage> {
  final _controller = ScrollController();

  final List<int> pages = List.generate(6, (index) => index);

  ScrollPhysics _physics;

  double _width;
  double _space;
  double _edge;

  @override
  void initState() {
    super.initState();
//    double screenWdith = MediaQuery.of(context).size.width;
    double screenWdith = 360;
     _width =  screenWdith * 0.6;
     _space =  screenWdith * 0.05;
    _edge = screenWdith * 0.1;

     println("mylog width: ${_width}   space: ${_space}  edge:${_edge}");

    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          println("mylog 设置数据： width: ${_width}   space: ${_space}  edge:${_edge}");
          _physics = CustomScrollPhysics(itemWidth: _width * 3, space: _space * 3, edge: _edge * 3);
//          _physics = PageScrollPhysics2();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          physics: _physics,
          itemCount: pages.length + 2,
          separatorBuilder: (context, index){
            if ( index == 0 || index == pages.length){
              return SizedBox();
            }
            return Container(
              width: _space,
              color: Colors.white,
            );
          },
          itemBuilder: (context, index)  {
            if ( index == 0 || index == pages.length + 1){
              return Container(
                width: _edge,
                height: 360,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red, Colors.yellow])
                ),
              );
            }
            return Container(
              key: ObjectKey(randomColor),
              height: double.infinity,
              width: _width,
              color: randomColor,
            );
          },
        ),
      ),
    );
  }

  Color get randomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);


}

void println(String s) {
}
class PageScrollPhysics2 extends ScrollPhysics {
  /// Creates physics for a [PageView].
  const PageScrollPhysics2({ ScrollPhysics parent }) : super(parent: parent);

  @override
  PageScrollPhysics2 applyTo(ScrollPhysics ancestor) {
    return PageScrollPhysics2(parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position) {
//    if (position is _PagePosition)
//      return position.page;
    return position.pixels / position.viewportDimension;
  }

  double _getPixels(ScrollPosition position, double page) {
//    if (position is _PagePosition)
//      return position.getPixelsFromPage(page);
  if(page == 0) {
    return 40;
  }
  if(page == 3) {
    return page * position.viewportDimension - 100;
  }
    return page * position.viewportDimension;
  }

  double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity)
      page += 0.5;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}

class CustomScrollPhysics extends ScrollPhysics {
  final double itemWidth;
  final double space;
  final double edge;

  CustomScrollPhysics({this.itemWidth, this.space, this.edge, ScrollPhysics parent})
      : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomScrollPhysics(
        itemWidth: itemWidth, space: space, edge: edge, parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position) {
//    if(position.pixels < (edge + itemWidth / 2)) {
//      return 0;
//    }
    return  max(0, (position.pixels - (edge + itemWidth / 2)) / (itemWidth + space));
  }

  double _getPixels(double page) {
//    if(page == 0) {
//      return 0;
//    }else{
//      return edge + itemWidth / 2 + (itemWidth + space) * page;
//    }
    return edge + itemWidth / 2 + (itemWidth + space) * page;
//    return page * itemWidth - 20;
  }

  bool isTran = true;

  double _getTargetPixels(
      ScrollPosition position, Tolerance tolerance, double velocity) {
    println("mylog     _getTargetPixels  开始   position  ${position.pixels * 3}    itemWidth: ${itemWidth}   space: ${space}  edge:  ${edge} ");

//    double page = _getPage(position);
//    print(" mylog:  _getTargetPixels       page  ${page}  ");
//    if (velocity < -tolerance.velocity) {
////      page -= 0.5;
//    } else if (velocity > tolerance.velocity) {
////      page += 0.5;
//    }
//    double pixels = _getPixels(page.roundToDouble());
//    println("mylog  _getTargetPixels  结束   page: ${page}    pixels:  ${pixels} ");



    double targetPixel;

    var offset = position.pixels * 3;

    double edgetOffset = edge + (itemWidth / 2);

    double pageWidth  = itemWidth + space;

    var  page;
    if(offset < edgetOffset){
      page = 0;
    }else{
      page = (offset - edgetOffset) / pageWidth  + 1;
    }

    page = page.toInt();

    print(" mylog:      page ${page}  ");

    if(page == 0) {
      targetPixel = 0;
    }else{
      targetPixel = edgetOffset + page * pageWidth;
    }

    print(" mylog:      targetPixel:  ${targetPixel}  ");
    return targetPixel.toInt().toDouble();
//    return 100;
  }

  double target;

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    final Tolerance tolerance = this.tolerance;
    if(velocity.abs() >=  tolerance.velocity){
      double target = _getTargetPixels(position, tolerance, velocity);
      if(target != position.pixels.toInt().toDouble()) {
        return ScrollSpringSimulation(spring, position.pixels, target, velocity,
            tolerance: tolerance);
      }
    }

    return null;

  }

  @override
  bool get allowImplicitScrolling => false;
}