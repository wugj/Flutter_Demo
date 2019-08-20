
import 'package:fish_redux/fish_redux.dart';

class PageState extends Cloneable<PageState>{

  String title;
  String content;


  PageState({this.title, this.content});

  @override
  PageState clone() {
    // TODO: implement clone
    return PageState()..title = title..content = content;
  }
}

PageState initState(Map<String, dynamic> args){
  print(" mylog:      初始化 state  ");
  return PageState(title: "fish redux first page", content: "content");
}