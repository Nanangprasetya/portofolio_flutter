import 'package:flutter/material.dart';

class ThemeUtil {
  ThemeUtil._();

  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // toggleableActiveColor: Colors.white,
    // accentColor: Colors.blue,
    // appBarTheme: AppBarTheme(
    //   color: Colors.blue,
    //   iconTheme: IconThemeData(
    //     color: Colors.white,
    //   ),
    // ),
    // textTheme: TextTheme(button: TextStyle(color: Colors.white)),
  );

  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.blue,
    toggleableActiveColor: Colors.blue,
    bottomAppBarColor: Colors.black,

    // appBarTheme: AppBarTheme(
    //   color: Colors.black,
    //   iconTheme: IconThemeData(
    //     color: Colors.white,
    //   ),
    // ),
    // textTheme: TextTheme(button: TextStyle(color: Colors.black54)),
  );
}
