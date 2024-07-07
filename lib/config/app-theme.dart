import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Color.fromRGBO(117, 117, 117, 1);
  static ThemeData myTheme = ThemeData(
    primaryColor: Colors.black,
    hintColor: primaryColor,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(117, 117, 117, 1),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
