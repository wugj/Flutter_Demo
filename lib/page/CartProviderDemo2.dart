import 'package:flutter/material.dart';

class InheritedProvider2<T> extends InheritedWidget{

  final T data;

  InheritedProvider2({@required this.data, Widget child}):super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}

Type _typeOf<T>() => T;

class ChangeNotiferProvider2<T extends ChangeNotifier> extends StatefulWidget {

  final Widget child;
  final T data;


  ChangeNotiferProvider2({Key key, this.child, this.data}):super(key: key);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context, {bool isListener = true}) {
    final type = _typeOf<InheritedProvider2<T>>();
    final provider =  isListener ? context.inheritFromWidgetOfExactType(type) as InheritedProvider2<T> :
          context.ancestorInheritedElementForWidgetOfExactType(type)?.widget as InheritedProvider2<T>;
    return provider.data;
  }

  @override
  _ChangeNotiferProviderState2 createState() => _ChangeNotiferProviderState2<T>();
}

class _ChangeNotiferProviderState2<T extends ChangeNotifier> extends State<ChangeNotiferProvider2<T>> {

  update(){
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.data.addListener(update);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.data.removeListener(update);
  }

  @override
  void didUpdateWidget(ChangeNotiferProvider2<ChangeNotifier> oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.data != widget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return InheritedProvider2<T>(data: widget.data, child: widget.child,);
  }
}



// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer2<T> extends StatelessWidget {
  Consumer2({
    Key key,
    @required this.builder,
    this.isListener = true
  })  : assert(builder != null),
        super(key: key);

  final bool isListener;

  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotiferProvider2.of<T>(context, isListener: isListener), //自动获取Model
    );
  }
}



class Item2{
  double price;
  int count;
  Item2(this.price, this.count);
}

class Cart2 extends ChangeNotifier{
  final List<Item2> _items = [];

  double get totalPrice => _items.fold(0, (value, item) => value + item.count * item.price);

  addItem(Item2 item){
    _items.add(item);
    notifyListeners();
  }

}

class CartProviderDemo2 extends StatefulWidget {
  @override
  _CartProviderDemoState createState() => _CartProviderDemoState();
}

class _CartProviderDemoState extends State<CartProviderDemo2> {

  final Cart2 cart = Cart2();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotiferProvider2(
        data: cart,
        child: Column(
          children: <Widget>[
            Consumer2<Cart2>(builder: (context, cart) => Text("totleprice:  ${cart.totalPrice.toString()}")),
            Consumer2<Cart2>(isListener: false, builder: (context, cart){
              print(" mylog:      raiseButton  ");
              return RaisedButton(
                onPressed: () => cart.addItem(Item2(10, 2)),
                child: Text("添加商品"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
