
import 'package:flutter/material.dart';

class LayoutDemoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        new ImageSection(),
        new TitleSection(),
        new ButtonSection(),
        new TextSection()
      ],
    );
  }

}

class ImageSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Image.asset(
      'images/lake.jpg',
      fit: BoxFit.cover,
      width: 600,
      height: 240,
    );
  }

}

class TextSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(22),
      color: Colors.amberAccent,
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''', )
    );
  }

}


class ButtonSection extends StatelessWidget{

  Color color;


  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;
    // TODO: implement build
    return new Container(
      child: new Row(
        mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BuidButtonItem("CALL", Icons.call),
          BuidButtonItem("ROUTE", Icons.near_me),
          BuidButtonItem("SHARE", Icons.share),
        ],
      ),
    );
  }

  Widget BuidButtonItem(String label, IconData icon){
    return new Container(
      child: new Column(
        children: <Widget>[
          new Icon(icon),
          new Container(
            margin: const EdgeInsets.only(top : 8),
            child: new Text(
                label,
              style: new TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color
              ),
            ),
          )
        ],
      )
    );
  }

}

class TitleSection extends StatelessWidget{

  static const double fontSize = 16;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: new Text(
                        'Oeschinen Lake Campground',
                        style: new TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    new Text(
                      'Kandersteg, Switzerland',
                      style: new TextStyle(
                        fontSize: fontSize,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],

              )
    ),
          new FavoriteWidget()
//          new Icon(
//            Icons.star,
//            color: Colors.grey[500],
//            ),
//          new Text(
//            "41",
//            style: new TextStyle(
//              fontSize: fontSize
//            ),
//          )
        ],
      ),
    );
  }
}

class FavoriteWidget  extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() {
    // TODO: implement createState
    return new _FavoriteWidgetState();
  }

}

class _FavoriteWidgetState  extends State<FavoriteWidget>{

  bool _isFavorite = true;
  int _favoriteCount = 41;
  void _clickFavorite(){
    setState(() {
      print("点击事件开始:  " + _isFavorite.toString() + "    " + _favoriteCount.toString());
      _favoriteCount = _isFavorite ? _favoriteCount - 1 : _favoriteCount + 1;
      _isFavorite = !_isFavorite;
      print("点击事件结束:  " + _isFavorite.toString() + "    " + _favoriteCount.toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(0.0),
          child: new IconButton(
              icon: new Icon(_isFavorite ? Icons.star : Icons.star_border),
              onPressed: _clickFavorite
          ),
        ),
        new SizedBox(
          width: 18,
            child: new Text("$_favoriteCount"),
        )
      ],
    );
  }

}
