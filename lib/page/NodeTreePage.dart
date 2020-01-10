import 'package:flutter/material.dart';

class Node{
  final Widget me;
  List<Node> children;
  Node({this.me, this.children});
  Node.name({this.me});
}

class NodeTreePageDemo extends StatefulWidget {

  @override
  _NodeTreePageDemoState createState() => _NodeTreePageDemoState();
}

class _NodeTreePageDemoState extends State<NodeTreePageDemo> {

  Node node;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var friendsNode=[Node(me: Text("张三丰")),Node(me: Text("独孤九剑")),Node(me: Text("令狐冲")),Node(me: Text("魏无羡"))];
    node = Node(me: Text("我的好友",),
        children: [
          Node(me: NodeTreeWidget(node: Node(me: Text("损友"), children: friendsNode))),
          Node(me: Text("好友")), Node(me: Text("道友",)), Node(me: Text("漫友",)), Node(me: Text("普友",)),
        ]);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NodeTreeWidget(node: node,),
    );
  }
}

class NodeTreeWidget extends StatefulWidget {

  final Node node;

  NodeTreeWidget({this.node});

  @override
  _NodeTreeWidgetState createState() => _NodeTreeWidgetState();
}

class _NodeTreeWidgetState extends State<NodeTreeWidget> {

  bool showList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showList = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: widget.node.me,
          onTap: () => setState((){showList = !showList;}),
        ),
        !showList || widget.node.children?.isNotEmpty != true ? SizedBox(width: 0, height: 0,) :
          Padding(
              padding: EdgeInsets.only(left: 40),
            child:
//               Text("hahha")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.node.children.map((item) => NodeTreeWidget(node: item,)).toList(),
            ),
          )
      ],
    );
  }
}

