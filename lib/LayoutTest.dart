import 'package:flutter/material.dart';
import 'WidgetUtil.dart';

class LayoutTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return testCard();
  }

  Widget testCard(){
    return WidgetUitl.buildCard(
        child: Column(
          children: <Widget>[
            WidgetUitl.buildListTitle(lead: Icons.image),
            WidgetUitl.buildListTitle(lead: Icons.restaurant),
            Divider(),
            WidgetUitl.buildListTitle(),

          ],
        )
    );
  }

  Widget testStackView(){
    return WidgetUitl.buildStack();
  }

  Widget getTestListView(){
    List<Widget> list = List();
    for(int i = 0; i < 35; i++) {
      list.add(WidgetUitl.buildListTitle(title: "title${i}"));
      list.add(new Divider());
    }
    return new ListView(
      children: list,
    );
  }


  Widget getTestGridView(){
    return GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: WidgetUitl.buildImageList(count: 30),
    );
  }


  Widget getTestGridView2() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: WidgetUitl.buildImageList(count: 25),
    );
  }



  Widget getTest4() {
    return new Container(
      decoration: BoxDecoration(
          color: Colors.red
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 10,
                            color: Colors.black38
                        ),
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(8.0))
                    ),
                    margin: const EdgeInsets.all(4.0),
                    child: Image.asset("11-0.jpg", package: WidgetUitl.IMAGE_PACK,
                      fit: BoxFit.cover,
                      height: 500,),
                  )
              ),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(4)),
                        border: new Border.all(width: 10, color: Colors.black38)
                    ),
                    margin: const EdgeInsets.all(4),
                    child: Image.asset(
                        "11-0.jpg", package: "shrine_images", height: 200),
                  )
              )
            ],
          )
        ],
      ),
    );
  }


  Widget getTest3() {
    return new Container(
      child: new Column(
        children: <Widget>[
          buildRatings_Test3(),
          new Card(
            margin: EdgeInsets.fromLTRB(10, 20, 30, 40),
            child: buildIconList_Test3(),
          ),
          Image.asset("11-0.jpg",
            package: "shrine_images",
            fit: BoxFit.cover,
            width: 600,
            height: 140,),
        ],
      ),
    );
  }


  Widget buildIconList_Test3() {
    TextStyle textStyle = new TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        fontSize: 25,
        height: 1.0,
        letterSpacing: 0.5
    );
    return DefaultTextStyle.merge(
        style: textStyle,
        child: new Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Icon(Icons.kitchen, color: Colors.green[500],),
                new Text('PREP:'),
                new Text('25 min'),
              ],
            ),
            new Column(
              children: <Widget>[
                new Icon(Icons.timer, color: Colors.green[500],),
                new Text('COOK:'),
                new Text('1 hr'),
              ],
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                new Icon(Icons.restaurant, color: Colors.green[500],),
                new Text('FEEDSDSDS:'),
                new Text('4 - 6'),
              ],
            ),
          ],
        ));
  }


  Widget buildRatings_Test3() {
    return new Container(
      padding: EdgeInsets.all(20),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
            ],
          ),
          new Text(
            "170 Reviews",
            style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20
            ),
          )
        ],
      ),
    );
  }


  Widget getTest2() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Icon(Icons.star, color: Colors.green[100]),
        new Icon(Icons.star, color: Colors.green[300]),
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.green[800]),
        new Icon(Icons.star, color: Colors.black),
        new Icon(Icons.star, color: Colors.black),
      ],
    );
  }


  Widget getTest1() {
    return new Container(
      padding: EdgeInsets.only(left: 0, top: 50, right: 0, bottom: 0),
      child: buildRow(),
    );
  }

  Widget buildRow() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      children: WidgetUitl.buildTextList(),
    );
  }




}
