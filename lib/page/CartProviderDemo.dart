import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget{

  final T data;

  InheritedProvider({@required this.data, Widget child}):super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}

Type _typeOf<T>() => T;

class ChangeNotiferProvider<T extends ChangeNotifier> extends StatefulWidget {

  final Widget child;
  final T data;


  ChangeNotiferProvider({Key key, this.child, this.data}):super(key: key);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context, {bool isListener = true}) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider =  isListener ? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T> :
          context.ancestorInheritedElementForWidgetOfExactType(type)?.widget as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotiferProviderState createState() => _ChangeNotiferProviderState<T>();
}

class _ChangeNotiferProviderState<T extends ChangeNotifier> extends State<ChangeNotiferProvider<T>> {

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
  void didUpdateWidget(ChangeNotiferProvider<ChangeNotifier> oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.data != widget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(data: widget.data, child: widget.child,);
  }
}



// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget {
  Consumer({
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
      ChangeNotiferProvider.of<T>(context, isListener: isListener), //自动获取Model
    );
  }
}



class Item{
  double price;
  int count;
  Item(this.price, this.count);
}

class Cart extends ChangeNotifier{
  final List<Item> _items = [];

  double get totalPrice => _items.fold(0, (value, item) => value + item.count * item.price);

  addItem(Item item){
    _items.add(item);
    notifyListeners();
  }

}

class CartProviderDemo extends StatefulWidget {
  @override
  _CartProviderDemoState createState() => _CartProviderDemoState();
}

class _CartProviderDemoState extends State<CartProviderDemo> {

  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotiferProvider(
        data: cart,
        child: Column(
          children: <Widget>[
            Consumer<Cart>(builder: (context, cart) => Text("totleprice:  ${cart.totalPrice.toString()}")),
            Consumer<Cart>(isListener: false, builder: (context, cart){
              print(" mylog:      raiseButton  ");
              return RaisedButton(
                onPressed: () => cart.addItem(Item(10, 2)),
                child: Text("添加商品"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
