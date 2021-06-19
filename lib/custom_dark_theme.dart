import 'package:flutter/material.dart';
import 'color_palette.dart';

ThemeData customDarkTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: mainThemeColor,
    scaffoldBackgroundColor: mainThemeColor,
    // backgroundColor: subThemeColor,
    appBarTheme: AppBarTheme(
      foregroundColor: mainContentColor,
      color: mainThemeColor,
      centerTitle: true,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: mainContentColor,
        fontFamily: 'TextMeOne',
        fontWeight: FontWeight.w700,
        fontSize: 25.0,
      ),
    ),
    textTheme: TextTheme(
      // headline6: TextStyle(
      //   color: subContentColor,
      //   fontWeight: FontWeight.w700,
      // ),
      // headline5: TextStyle(
      //   color: mainContentColor,
      // ),
      // headline4: TextStyle(
      //   color: mainContentColor,
      // ),
      // headline3: TextStyle(
      //   color: mainContentColor,
      // ),
      // headline2: TextStyle(
      //   color: mainContentColor,
      // ),
      // headline1: TextStyle(
      //   color: mainContentColor,
      // ),
      // bodyText1: TextStyle(
      //   color: mainContentColor,
      // ),
      bodyText2: TextStyle(
        color: mainContentColor,
        fontFamily: 'TextMeOne',
        fontWeight: FontWeight.w700,
        fontSize: 22.0,
      ),
    ),
  );
}
