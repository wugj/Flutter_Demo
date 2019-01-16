import 'package:flutter/material.dart';
import 'package:startup_namer/AppFactory.dart';
import 'package:flutter/rendering.dart';

void main() {

//  debugPaintSizeEnabled = true;
  runApp(new AppFactoroy().getWidget(AppFactoroy.WIDGET_TEXT_FIELD_TEST));
}


