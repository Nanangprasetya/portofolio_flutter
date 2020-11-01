import 'package:flutter/material.dart';

class ThemeUtil {
  ThemeUtil._();

  static final _primery50 = Colors.purple[50];
  static final _primery200 = Colors.purple[200];
  static final _primery300 = Colors.purple[300];
  static final _primery700 = Colors.purple[700];
  static final _primary = Colors.purple[900];
  static final _secondary = Colors.teal;
  static final _primeryDark = Colors.black;
  static final _surface = Colors.white;

  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: _primary,
    accentColor: _secondary,
    toggleableActiveColor: _secondary,
    backgroundColor: _primery200,
    cursorColor: _secondary,
    primaryColorDark: _primery700,
    primaryColorLight: _primary,
    secondaryHeaderColor: _primery50,
    textSelectionColor: _primery200,
    textSelectionHandleColor: _primery300,
    indicatorColor: _primary,
    buttonColor: _primary,
    colorScheme: ColorScheme.light(
      primary: _primary,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: _primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _secondary,
      foregroundColor: _surface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black38),
      focusColor: Colors.black12,
    ),
    sliderTheme: _sliderThemeData(),
  );

  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primeryDark,
    accentColor: _secondary,
    toggleableActiveColor: _secondary,
    cursorColor: _secondary,
    bottomAppBarColor: _primeryDark,
    textSelectionColor: _primary,
    primaryColorDark: _primeryDark,
    indicatorColor: _surface,
    buttonColor: _primary,
    buttonTheme: ButtonThemeData(
      buttonColor: _primary,
    ),
      colorScheme: ColorScheme.dark(
      primary: _primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _secondary,
      foregroundColor: _surface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white38),
      focusColor: Colors.black12,
    ),
    sliderTheme: _sliderThemeData(),
  );

  static SliderThemeData _sliderThemeData() {
    return SliderThemeData(
      thumbColor: _secondary,
      activeTrackColor: _secondary,
      inactiveTrackColor: _secondary.withOpacity(0.24),
      inactiveTickMarkColor: _secondary.withOpacity(0.54),
      overlayColor: _secondary.withOpacity(0.12),
      valueIndicatorColor: _secondary,
    );
  }
}
