import 'package:flutter/material.dart';

enum TabStyle{
  top, bottom
}

class TabbarWithPageView extends StatefulWidget {

  List<Widget> _tabItems;
  List<Widget> _pages;
  PageController _pageController;
  TabStyle _tabStyle;


  TabbarWithPageView(this._tabItems, this._pages, this._pageController,
  {Key key, TabStyle tabStyle = TabStyle.bottom}):
      this._tabStyle = tabStyle,
        super(key: key);

  @override
  _TabbarWithPageViewState createState() => _TabbarWithPageViewState();
}

class _TabbarWithPageViewState extends State<TabbarWithPageView> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: widget._tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (widget._tabStyle == TabStyle.top){
      return Scaffold(
        appBar: AppBar(
          title: Text("这里是appbar"),
          bottom: TabBar(tabs: widget._tabItems,
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.red,
          ),
        ),
        body: PageView(
          controller: widget._pageController,
          children: widget._pages,
          onPageChanged: (index){
            _tabController.animateTo(index);
          },
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text("这里是appbar"),),
        body: PageView(
          controller: widget._pageController,
          children: widget._pages,
          onPageChanged: (index){
            _tabController.animateTo(index);
          },
        ),
        bottomNavigationBar: TabBar(
          tabs: widget._tabItems,
          controller: _tabController,
          indicatorColor: Colors.red,
        ));



  }
}


