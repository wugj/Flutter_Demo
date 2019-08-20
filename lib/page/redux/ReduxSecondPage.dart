import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:startup_namer/page/redux/Action.dart';
import 'package:startup_namer/page/redux/StoreManager.dart';
import 'package:startup_namer/page/redux/state/CountState.dart';

class ReduxTestSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
      store: StoreManager.instance().store,
      child:Scaffold(
          appBar: AppBar(title: Text("redux 第二个页面"), leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context),),),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'You have pushed the button this many times:',
                ),
                StoreConnector<CountState, int>(
                  converter: (store) => store.state.count,
                  builder: (context, count){
                    return Text(count.toString(), style: Theme.of(context).textTheme.display1,);
                  },
                )
              ],
            ),
          ),
          floatingActionButton: StoreConnector<CountState, VoidCallback>(
              builder: (context, callback){
                return FloatingActionButton(onPressed: callback, child: Icon(Icons.add),);
              },
              converter: (store){
                return () => store.dispatch(StateAction.increment);
              }
          ),
        ),
    );
  }
}
