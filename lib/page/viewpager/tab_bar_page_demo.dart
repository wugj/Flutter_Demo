import 'package:flutter/material.dart';
import 'package:startup_namer/page/viewpager/page/TabBarPageFirst.dart';
import 'package:startup_namer/page/viewpager/page/TabBarPageSecond.dart';
import 'package:startup_namer/page/viewpager/page/TabBarPageThree.dart';
import 'package:startup_namer/page/viewpager/tab_bar_with_pager_view.dart';

class TabBarPageDemo extends StatelessWidget {

  final PageController _pageController = new PageController();
  final List<String> _tabItems = const ["动态", "趋势", "我的"];

  _renderTab(){
    List<Widget> list = [];
    for (int i = 0; i < _tabItems.length; i++) {
      list.add(new FlatButton(onPressed: (){
        _pageController.jumpToPage(i);
      }, child: Text(_tabItems[i], maxLines: 1,)));
    }
    return list;
  }

  _renderPage(){
    return [
      TabBarPageFirst(),
      TabBarPageSecond(),
      TabBarPageThree(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return TabbarWithPageView(
      _renderTab(), _renderPage(), _pageController, tabStyle: TabStyle.bottom,
    );
  }
}
