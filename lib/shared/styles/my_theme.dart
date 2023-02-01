import 'package:flutter/material.dart';

import 'colors.dart';

class my_theme {

  static ThemeData lightmode = ThemeData(
    primaryColor: black,
    colorScheme: ColorScheme(onError: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red,
        background: Colors.transparent,
        onPrimary: Colors.white,
        primary: Colors.black,
        brightness: Brightness.light,
        onBackground: black,
        onSurface: Colors.black,
        secondary: black,
        surface: Colors.grey),
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      color: Colors.white,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white,
      ),
      subtitle1: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white
      ),
      subtitle2: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: yallow,
      unselectedItemColor: grey,
    ),
  );
  static ThemeData darktmode = ThemeData(
    primaryColor: Colors.white,
    colorScheme: ColorScheme(onError: black,
        onSecondary: black,
        error: Colors.red,
        background: Colors.transparent,
        onPrimary: black,
        primary: Colors.white,
        brightness: Brightness.light,
        onBackground: black,
        onSurface: Colors.white,
        secondary: Colors.white,
        surface: Colors.grey),
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: black,
      ),
      color: black,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black,
      ),
      subtitle1: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black
      ),
      subtitle2: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: yallow,
      unselectedItemColor: grey,
    ),
  );
}