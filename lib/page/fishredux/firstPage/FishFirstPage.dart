import 'package:fish_redux/fish_redux.dart' as FishRedux;
import 'package:flutter/material.dart';
import 'package:startup_namer/common/WidgetFactory.dart';

import 'PageActionCreator.dart';
import 'PageState.dart';


class FishFirstPage extends FishRedux.Page<PageState, Map<String, dynamic>>{

  FishFirstPage():super(
    reducer: buildReducter(),
    initState: initState,
    view: buildView,
    effect: buildEffect()
  );

}

FishRedux.Effect<PageState> buildEffect(){
  print(" mylog:      build effect  ");
  return FishRedux.combineEffects(<Object, FishRedux.Effect<PageState>>{
    FishRedux.Lifecycle.initState: _effectInit,
    FishRedux.Lifecycle.dispose: _effectdispose,
    PageAction.onEdit: _onEdit,
  });
}


void _effectInit(FishRedux.Action action, FishRedux.Context<PageState> ctx){
  print(" mylog:      _effectInit  ");
  ctx.dispatch(PageActionCreator.update("init title", "init content"));

}

String _input;

void _effectdispose(FishRedux.Action action, FishRedux.Context<PageState> ctx){
  print(" mylog:      _effectdispose  ");
}

void _onEdit(FishRedux.Action action, FishRedux.Context<PageState> ctx){
  print(" mylog:      _onUpdate  ");
  showDialog(context: ctx.context,
    builder: (_) => new AlertDialog(
        title: Text("Modify content"),
        content: TextField(
          onChanged: (_){
            _input = _;
          },
        ),
        actions:<Widget>[
          new FlatButton(child:new Text("CANCEL"), onPressed: (){
            Navigator.of(ctx.context).pop();
          },),
          new FlatButton(child:new Text("OK"), onPressed: (){
            Navigator.of(ctx.context).pop<String>(_input);  //确定按钮关闭对话框携带数据
          },)
        ]
    )
  ).then( (_){
    ctx.dispatch(PageActionCreator.update("title", "content"));
  });
}

FishRedux.Reducer<PageState> buildReducter(){
  print(" mylog:      first  build reductersssssssssssssssssss  ");
  return FishRedux.asReducer<PageState>(<Object, FishRedux.Reducer<PageState>>{
    PageAction.update: _update,
    PageAction.onEdit: _add,

  });
}

PageState _update(PageState state, FishRedux.Action action){
  print(" mylog:      first  update State  ");
  final Map<String, String> update = action.payload ?? <String, String>{};
  final PageState newState = state.clone();
  newState.title = update["title"] ?? newState.title;
  newState.content = update["content"] ?? newState.content;
  return newState;
}

PageState _add(PageState state, FishRedux.Action action){
  print(" mylog:      first  update State  ");
  final Map<String, String> update = action.payload ?? <String, String>{};
  final PageState newState = state.clone();
  newState.title += "+1";
  newState.content += "+1";
  return newState;
}

Widget buildView(PageState state, FishRedux.Dispatch dispatch, FishRedux.ViewService viewService){
  print(" mylog:      first  build View  ");
  return Scaffold(
    appBar: WidgetFactory.buildAppBar(state.title),
    body: Center(child: Text(state.content),),
    floatingActionButton: FloatingActionButton(onPressed: (){
        dispatch(PageActionCreator.add("新 title", "hello"));
    },
      child: Icon(Icons.edit),
    ),
  );
}