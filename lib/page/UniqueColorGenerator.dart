import 'dart:math';
import 'package:flutter/material.dart';

class UniqueColorGenerator{
  List<Color> colorList = [Colors.red, Colors.green, Colors.yellow, Colors.blue];
  Random random = Random();

  Color getColor(){
    return colorList[random.nextInt(colorList.length)];
  }

}