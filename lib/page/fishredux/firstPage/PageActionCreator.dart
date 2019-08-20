
import 'package:fish_redux/fish_redux.dart';

enum PageAction{update, onEdit}

class PageActionCreator{
  static Action update(String title, String content){
    print(" mylog:   first   action update  ");
    return Action(
      PageAction.update,
      payload: <String, String>{'title': title, 'content': content}
    );
  }

  static Action add(String title, String content){
    print(" mylog:   first   action edit  ");
    return Action( PageAction.onEdit );
  }
}