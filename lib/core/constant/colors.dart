import 'package:flutter/material.dart';

class AppColor {
  static const  Color black = Color(0xFF000000);
  static const  Color white = Color(0xFFffffff);
  static const  Color grey = Color(0xFF766F69);
  static const  Color primaryColorLight = Color(0xFF97BFE5);
  static const  Color backgroundColorLight = Color(0xFFE2EEF8);

  static LinearGradient bottomNavigationBar=LinearGradient(
    colors: [Color(0xff635bd7), Color(0xff5c92ff), Color(0xffe6e6e6)],
    stops: [0, 0.5, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  )
  ;

  //dark
  static const  Color primaryColorDark = Color(0xFF052A51);
  static const  Color backgroundColorDark = Color(0xFF2C557A);

}
