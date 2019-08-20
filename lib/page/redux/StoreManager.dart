
import 'package:redux/redux.dart';
import 'package:startup_namer/page/redux/Action.dart';
import 'package:startup_namer/page/redux/state/CountState.dart';

class StoreManager{
  static StoreManager _instance;
  StoreManager._();
  factory StoreManager() => instance();

  static StoreManager instance(){
    if (_instance == null) {
      _instance = StoreManager._();
    }
    return _instance;
  }
  Store _store;

  get store => _store;


  initStore(){
    _store = new Store<CountState>(reducer, initialState: CountState(0));
  }

  CountState reducer(CountState oldState, action){
    if(action == StateAction.increment){
      return CountState(oldState.count + 1);
    }
    return oldState;
  }

}

