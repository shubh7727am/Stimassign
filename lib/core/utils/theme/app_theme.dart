import 'package:flutter/material.dart';
import 'package:stimassign/core/utils/color_resources.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,

    textTheme: TextTheme(
      displayLarge: TextStyle(fontFamily: 'Oswald'),
      displayMedium: TextStyle(fontFamily: 'Oswald'),
      displaySmall: TextStyle(fontFamily: 'Oswald'),
      headlineLarge: TextStyle(fontFamily: 'Oswald'),
      headlineMedium: TextStyle(fontFamily: 'Oswald'),
      headlineSmall: TextStyle(fontFamily: 'Oswald'),
      titleLarge: TextStyle(fontFamily: 'Oswald'),
      titleMedium: TextStyle(fontFamily: 'Oswald'),
      titleSmall: TextStyle(fontFamily: 'Oswald'),
      bodyLarge: TextStyle(fontFamily: 'Oswald'),
      bodyMedium: TextStyle(fontFamily: 'Oswald'),
      bodySmall: TextStyle(fontFamily: 'Oswald'),
      labelLarge: TextStyle(fontFamily: 'Oswald'),
      labelMedium: TextStyle(fontFamily: 'Oswald'),
      labelSmall: TextStyle(fontFamily: 'Oswald'),
    ),

    appBarTheme: const AppBarTheme(
      color: ColorResources.screenBgColorDark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
    ),
    scaffoldBackgroundColor: ColorResources.screenBgColorDark,
  );
}
