import 'package:flutter/material.dart';

class WidgetUitl {

  static final String IMAGE_PACK = "shrine_images";


  static Widget buildCard({double heihgt = 310, @required Widget child, double elevation = 5, }){
    return new SizedBox(
      height: heihgt,
      child: Card(
        elevation: elevation,
        color: Colors.yellowAccent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: child,
      ),
    );
  }


  static Widget buildStack(){
    return new Stack(
      alignment: Alignment(1, 0.8),
      children: <Widget>[
        buildCircleImage(radius: 170),
        buildCircleImage(radius: 150, image: buildProvideImage(image: "29-0.jpg")),
        buildCircleImage(radius: 120, image: buildProvideImage(image: "28-0.jpg")),
        buildCircleImage(radius: 100, image: buildProvideImage(image: "2-0.jpg")),
        buildCircleImage(radius: 50, image: buildProvideImage(image: "0-0.jpg")),
        new Container(
          decoration: BoxDecoration(
            color: Colors.black45
          ),
          child: buildText(fontsize: 20, color: Colors.white),
        )
      ],
    );
  }

  static Widget buildCircleImage({ImageProvider image, double radius = 100}){
    return CircleAvatar(
      backgroundImage: image == null ? buildProvideImage() : image,
      radius: radius,
    );
  }

  static Widget buildListTitle({String title = "title", String subtitle = "sub_title", IconData lead = Icons.theaters}){
    return ListTile(
      title: Text(
        title,
        style: new TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400
        ),
      ),
      subtitle: new Text(subtitle),
      leading: Icon(lead, color: Colors.blue[500],),
    );
  }


  static List<Widget> buildImageList({int count = 20}) {
    return new List<Widget>.generate(count, (int index) {
      return Container(
        child: Image.asset("${index + 1}-0.jpg", package: IMAGE_PACK, fit: BoxFit.cover,),
      );
    });
//    return new List<Widget>.generate(count, (int index) => new Container(
//      child: Image.asset("${index + 1}-0.jpg", package: IMAGE_PACK,),
//    ));
  }



  static Widget buildImage({String image = "30-0.jpg", String package = "shrine_images",  BoxFit fit = BoxFit.cover}){
    return Image.asset(image, package: package, fit: fit,);
  }

  static ImageProvider buildProvideImage({String image = "30-0.jpg", String package = "shrine_images",  BoxFit fit = BoxFit.cover}){
    return AssetImage(image, package: package);
  }

  static List<Widget> buildIconList({IconData icon = Icons.star}){
    return [
      Icon(icon, color: Colors.green[100]),
      new Icon(icon, color: Colors.green[300]),
      new Icon(icon, color: Colors.green[500]),
      new Icon(icon, color: Colors.green[800]),
      new Icon(icon, color: Colors.black),
      new Icon(icon, color: Colors.black),
    ];
  }

  static List<Widget> buildTextList() {
    return [
      buildTestByContainer(text: "悟空", color: Colors.black87),
      buildTestByContainer(text:"贝吉塔", color: Colors.blue, h: 40),
      buildTestByContainer(text:"悟饭", color: Colors.yellow, h: 60),
    ];
  }

  static Widget buildText({String text = "贝吉塔", Color color = Colors.black45, double fontsize = 12}){

    return new Text(
      text,
      style: new TextStyle(fontSize: fontsize, color: color,),
    );
  }

  static Widget buildTestByContainer( {String text, Color color = Colors.black, double h = 80, double w = 80}) {
    return new Container(
      color: color,
      height: h,
      width: w,
      alignment: Alignment.center,
      child: Padding(padding: EdgeInsets.all(4), child: buildText(text: text, color: Colors.red),),
    );
  }

  static Widget buildLogo(){
    return new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0),
    child: new FlutterLogo(),
    );
  }
}