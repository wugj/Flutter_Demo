import 'package:flutter/material.dart';

class TextFieldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFieldShowDialog();
  }
}

class TextFieldShowDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldShowDialogState();
  }
}

class TextFieldShowDialogState extends State<TextFieldShowDialog> {
  final TextEditingController _controller = TextEditingController();

  Map<String, dynamic> _userinfo = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(

                controller: _controller,
                decoration: InputDecoration(hintText: "请输入")
//            decoration: null
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("输入的内容"),
                          content: Text(_controller.text),
                        );
                      });
                },
                child: Text("click"),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                  controller: TextEditingController(text: _userinfo["nickName"]),
                  decoration: InputDecoration(hintText: "请输入nickName"),
                  onChanged: (value) => _userinfo["nickName"] = value,

//            decoration: null
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("输入的nickName内容"),
                          content: Text(_userinfo["nickName"]),
                        );
                      });
                },
                child: Text("click"),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                  controller: TextEditingController(text: _userinfo["account"]),
                  decoration: InputDecoration(hintText: "请输入account"),
                  onChanged: (value) => _userinfo["account"] = value,

//            decoration: null
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("输入的account内容"),
                          content: Text(_userinfo["account"]),
                        );
                      });
                },
                child: Text("click"),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
