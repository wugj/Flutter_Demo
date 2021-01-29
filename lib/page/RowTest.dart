
import 'package:flutter/material.dart';

class RowTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Row(
        //max为占用最大的空间,min为占用最小的空间
        mainAxisSize:MainAxisSize.max,
        //当MainAxisSize.max 时候这个才生效, 这里设置子组件的对齐方式 start,end,center,spaceBetween,spaceAround,spaceEvenly
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        //表示子Widgets在纵轴方向的对齐方式,需要子组件高度不同才有效果 有 start,center,end,stretch4个值
        crossAxisAlignment:CrossAxisAlignment.center,
        //文字的排列方式 一般都是从左到右,还有个值rtl
        textDirection:TextDirection.ltr,

        children: <Widget>[
          Container(
            width: 80,
            height: 50,
            color: Color(0xffff4400),
            child: Text("data"),
          ),
          Container(
            width: 80,
            height: 80,
            color: Color(0xffff4400),
            child: Text("data"),
          ),
          Container(
            width: 80,
            height: 120,
            color: Color(0xffff4400),
            child: Text("data"),
          )
        ],
      ),
    );
  }
}
