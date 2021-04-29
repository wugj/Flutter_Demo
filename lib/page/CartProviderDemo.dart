import 'package:flutter/material.dart';
import 'package:startup_namer/page/CustomPageScrollViewDemo.dart';

// ignore: must_be_immutable
class InheritedProvider<T> extends InheritedWidget {

  InheritedProvider({
    this.data,
    Widget child
  }) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider oldWidget) {
    return true;
  }

}
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {

  ChangeNotifierProvider({
    Key key,
    @required this.data,
    @required this.child

}): super(key: key);

  T data;
  Widget child;

  static T of<T>(BuildContext context, {bool isListener = true}){
    // final type = _typeOf<InheritedProvider<T>>();
    // final InheritedProvider provider = isListener  ?
    // context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>() :
    // context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>();
    // return provider.data;

    // final type = _typeOf<InheritedProvider<T>>();
    final provider =  isListener ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget
    as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState createState() => _ChangeNotifierProviderState<T>();
}

Type _typeOf<T>() => T;

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider> {

  void update(){
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<ChangeNotifier> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.data != widget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.data.addListener(update);
  }

  @override
  void dispose() {
    super.dispose();
    widget.data.removeListener(update);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
          data: widget.data,
          child: widget.child,
    );
  }
}

class Item{
  double price;
  int count;
  Item(this.price, this.count);
}

class Cart extends ChangeNotifier {

  final List<Item> _list = [];

  double get totalPrice => _list.fold(3,
          (previousValue, element) => previousValue + element.count * element.price);

  void add(Item item){
    _list.add(item);
    notifyListeners();
  }
}

class Consumer<T> extends StatelessWidget{
  Consumer({
    Key key,
     this.builder,
     this.isListener = true
  });

  final bool isListener;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context, isListener: isListener));
  }
}


class CartProviderDemo extends StatefulWidget {
  @override
  _CartProviderWdigetState createState() => _CartProviderWdigetState();
}

class _CartProviderWdigetState extends State<CartProviderDemo> {

  final Cart cart = Cart();
  @override
  Widget build(BuildContext context) {
    println(" demo build");
    return Center(
      child: ChangeNotifierProvider(
          data: cart,
          child: Column(
            children: <Widget>[
              Consumer<Cart>(
                builder: (context, cart){
                  return Text("总价：${cart.totalPrice}");
                },
              ),
              Builder(builder: (context){
                return RaisedButton(onPressed: (){
                  // 此处 context是 Builder 是  InheritedProvider 子节点
                  ChangeNotifierProvider
                      .of<Cart>(context, isListener: false)
                  // cart
                      .add(Item(20, 3));
                });
              }),
              RaisedButton(onPressed: (){
                // 此处 context是 CartProviderDemo 所以找不到 向上查找
                ChangeNotifierProvider
                    .of<Cart>(context, isListener: false)
                // cart
                    .add(Item(10, 3));
              }),
              Consumer<Cart>(isListener: false, builder: (context, cart){
                print(" mylog:      raiseButton  ");
                return RaisedButton(
                  onPressed: () => cart.add(Item(10, 2)),
                  child: Text("添加商品"),
                );
              })
            ],
          )
      ),
    );
  }
}



