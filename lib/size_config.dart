


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

double getProportionateScreenHeight(double height) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (height / 812)*screenHeight;
}

double getProportionateScreenWidth(double width) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (width / 375.0)*screenWidth;
}