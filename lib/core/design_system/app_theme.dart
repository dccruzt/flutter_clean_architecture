import 'package:flutter/material.dart';

import 'colors.dart';
import 'spacings.dart';

ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: darkBlue,
  appBarTheme: const AppBarTheme(
    color: darkBlue,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Colors.blue),
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.grey,
    indent: x4,
    endIndent: x4,
    thickness: 0.2,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.blue,
    ),
    bodyMedium: TextStyle(fontSize: 16.0, color: customWhite),
  ),
  disabledColor: disabledColor,
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
  ),
);
