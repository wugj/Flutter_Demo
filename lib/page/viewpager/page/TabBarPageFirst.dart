import 'package:flutter/material.dart';

class TabBarPageFirst extends StatefulWidget {
  @override
  _TabBarPageFirstState createState() => _TabBarPageFirstState();
}

class _TabBarPageFirstState extends State<TabBarPageFirst> with AutomaticKeepAliveClientMixin {
  final _suggestions = <String>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  ScrollController _scrollController = new ScrollController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(" mylog:      第一个页面创建  ");
    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
          _refresh();
      }
    });
    _refresh();
  }

  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
    );
  }

  generateWordPairs() {
    return [
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444"
    ];
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        controller: _scrollController,
        itemCount: _getItemCount(),
        itemBuilder: (context, i) {
          return _buildItem(i);
        });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // See AutomaticKeepAliveClientMixin.
    return RefreshIndicator(child: _buildSuggestions(), onRefresh: _refresh);
  }

  Future<dynamic> _refresh() async {
    print(" mylog:      开始刷新  ");
    Future.delayed(Duration(seconds: 10))
    .then((value){
      print(" mylog:      刷新成功  ");
      setState(() {
        _suggestions.clear();
        _suggestions.addAll(generateWordPairs());
      });
    });
  }

  void _load(){
    print(" mylog:      开始加载更多  ");
    Future.delayed(Duration(seconds: 5))
        .then((value){
      print(" mylog:     加载更多成功  ");
      setState(() {
        _suggestions.addAll(generateWordPairs());
      });
    });
  }

  _getItemCount() {
    if(_suggestions.isEmpty) {
      return 1;
    }else{
      return _suggestions.length + 1;
    }
  }

  Widget _buildItem(int i) {
    if(_suggestions.isEmpty){
      return CircularProgressIndicator();
    }else if (i == _suggestions.length){
      _load();
      return Container(
        width: double.infinity,
        height: 48,
        child: Center(
          child: CircularProgressIndicator(backgroundColor: Colors.yellow,),
        ),
      );
    }else{
      return _buildRow(_suggestions[i]);
    }
  }
}