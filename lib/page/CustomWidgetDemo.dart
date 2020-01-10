import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      constraints: BoxConstraints(
        minWidth: 100,
        minHeight: 100,
        maxWidth: double.infinity,
        maxHeight: double.infinity
      ),
      child: CustomCenter(
        child: Container(
          color: Colors.red,
        )
      ),
    );
  }
}

class CustomCenter extends SingleChildRenderObjectWidget{

  CustomCenter({Widget child}):super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return CustomRender();
  }
}

class CustomRender extends RenderShiftedBox{
  CustomRender() : super(null);

  @override
  void paint(PaintingContext context, Offset offset){
    super.paint(context, offset);
  }

  @override
  void performLayout() {
    // TODO: implement performLayout
//    super.performLayout();
    child.layout(BoxConstraints(
      minHeight: 0,
      maxHeight: constraints.minHeight / 2,
      minWidth: 0,
      maxWidth: constraints.minWidth / 2
    ), parentUsesSize: true);

      BoxParentData childParentData = child.parentData;
      childParentData.offset = Offset((constraints.maxWidth - child.size.width) / 2, (constraints.maxHeight - child.size.height) / 2);
      size = Size(constraints.maxWidth / 2, constraints.maxHeight / 2);
  }

}
