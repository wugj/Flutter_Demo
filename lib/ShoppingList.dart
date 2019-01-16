import 'package:flutter/material.dart';

class Product{
  const Product({this.name});
  final String name;
}

typedef void CartChangeCallback(Product product, bool inCart);

class ShoppingList extends StatefulWidget{

  ShoppingList({Key key, this.products}) : super(key : key);

  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ShoppingListState();
  }

}

class _ShoppingListState extends State<ShoppingList>{

  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChange(Product product, bool inCart){
    setState((){
      if(inCart){
        _shoppingCart.remove(product);
      }else{
        _shoppingCart.add(product);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print(" 初次加载 shopping State");
  }

  @override
  void dispose() {
    super.dispose();
    print(" 销毁 shopping State");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("购物车"),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 10.0),
        children: widget.products.map((Product product){
         var shoppingListItem = new ShoppingListItem(
           product: product,
           inCart: _shoppingCart.contains(product),
           onCartChange: _handleCartChange,
         );
         print("创建 widget：" + shoppingListItem.hashCode.toString());
         return shoppingListItem;
        }).toList(),
      ),
    );
  }

}

class ShoppingListItem extends StatelessWidget{

  ShoppingListItem({Product product, this.inCart, this.onCartChange}) : product = product, super(key : new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangeCallback onCartChange;

  Color _getColor(BuildContext context){
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if(!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: (){
        onCartChange(product, inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
