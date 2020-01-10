import 'dart:async';

import 'package:flutter/material.dart';

class PictrueData{
  final double width;
  final double height;
  final String url;
  PictrueData({this.width, this.height, this.url});
}


class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {

  List<PictrueData> pictrueList = [
    PictrueData(
        width: 1920.0,
        height: 1152.0,
        url:
        "http://admin.soscoon.com/uploadImages/24294a8960f7cec4a5bb77276b8d1804eddc0023.jpg"),
    PictrueData(
        width: 550.0,
        height: 810.00,
        url:
        "http://admin.soscoon.com/uploadImages/72041ef01b9c8dd543511968d8659817c0086145.jpeg"),
    PictrueData(
        width: 1600.0,
        height: 900.00,
        url:
        "http://admin.soscoon.com/uploadImages/c236aa0af948e5d8812d23bd9eb1878682f247d8.jpg"),
    PictrueData(
        width: 1900.0,
        height: 1200.00,
        url:
        "http://admin.soscoon.com/uploadImages/41b2b4490204912f345b80be4fa88d7f5c9487a7.jpg"),
    PictrueData(
        width: 1920.0,
        height: 1000.00,
        url:
        "http://admin.soscoon.com/uploadImages/52a138c4dfcfbaab74daec69f128a2dd6dbf558f.jpg"),
  ];

  double _screenWidth = 0;

  int _currentIndex = 0;

  PageController _controller = new PageController();

  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  void _startTimer(){
    Timer _timer = new Timer.periodic( Duration(seconds: 2 ), (Timer timer){
      _controller.animateToPage((_currentIndex + 1) % pictrueList.length, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(_screenWidth == 0) {

    }
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    PictrueData pictrueData = pictrueList[_currentIndex];
    return Container(
     child: Column(
       children: <Widget>[

    Expanded(
      flex: 1,
      child: ListView.builder(
          itemBuilder: (BuildContext context, int i){

            if(i == 0) {
             return Container(
//           flex: 1,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
//           width: double.infinity,
                  height: _screenWidth * pictrueData.height / pictrueData.width,
                  curve: Curves.ease,
                  child: Stack(
                    children: <Widget>[
                      PageView(
                        controller: _controller,
                        onPageChanged: (index)  {
                          print("回调");
                          _currentIndex = index;
                          setState((){});
                        },
                        children: pictrueList.map((pictrueData) =>
                            FadeInImage.assetNetwork(
                              placeholder: "images/loading_img.gif",
                              image: pictrueData.url,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            )
                        ).toList(),

                      ),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                borderRadius: BorderRadius.circular(40.0)
                            ),
                            child: Text("$_currentIndex/${pictrueList.length}", style: TextStyle(color: Colors.white),),
                          )
                      )
                    ],
                  ),
                ),
              );
            }

            if(i.isOdd){
              return Divider();
            }
            final index = i % pictrueList.length;
            return FadeInImage.assetNetwork(
                height: 200,
                placeholder: "images/loading_img.gif",
                image: pictrueList[index].url);
          })
    )

       ],
     ),
    );
  }
}
