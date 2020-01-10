import 'package:flutter/material.dart';

import 'BannerPageDemo.dart';
import 'viewpager/page/TabBarPageFirst.dart';
import 'viewpager/page/TabBarPageSecond.dart';
import 'viewpager/page/TabBarPageThree.dart';

class SliverPageDemo extends StatefulWidget {
  @override
  _SliverPageDemoState createState() => _SliverPageDemoState();
}

class _SliverPageDemoState extends State<SliverPageDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<String> _tabItems = const ["动态", "趋势", "我的"];
  final List<Widget> _pageItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabItems.length, vsync: this);
    _pageItems
      ..clear()
      ..addAll(_tabItems.map((item) {
        int index = _tabItems.indexOf(item);
        if (index % 3 == 0) {
          return TabBarPageFirst();
        } else if (index % 3 == 1) {
          return TabBarPageSecond();
        } else {
          return TabBarPageThree();
        }
      }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: _headerSliverBuilder,
          body: TabBarView(
            children: _pageItems,
            controller: _tabController,
          )),
    );
  }

  List<Widget> _headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
          centerTitle: true,
          expandedHeight: 200,
          floating: false,
          pinned: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            background: BannerPage(),
            centerTitle: true,
            title: Text("这里是FlexibleSpace"),
          )
//   FlexibleSpaceBar(
//          centerTitle: true,
//          title: Text("这里是FlexibleSpace"),
//          background: Image.network(
//            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531798262708&di=53d278a8427f482c5b836fa0e057f4ea&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F342ac65c103853434cc02dda9f13b07eca80883a.jpg",
//            fit: BoxFit.cover,
//          )
//        ),
//        bottom: TabBar(
//            tabs: _tabItems.map((item) => Text(item)).toList(),
//            controller: _tabController,
//        ),
          ),
      SliverPersistentHeader(
          pinned: true,
          delegate: SliverAppBarDelegate(TabBar(
            tabs: _tabItems
                .map((item) => Container(
                      child: Center(
                        child: Text(item),
                      ),
                      height: double.infinity,
                    ))
                .toList(),
            controller: _tabController,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.green,
          )))
    ];
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: _tabBar,
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 48;

  @override
  // TODO: implement minExtent
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
