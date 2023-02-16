import 'package:flutter/material.dart';

import 'colors.dart';
import 'spacings.dart';

ThemeData appThemeData = ThemeData(
  scaffoldBackgroundColor: darkBackground,
  appBarTheme: const AppBarTheme(
    color: darkBackground,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: primaryPurple),
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.grey,
    indent: x4,
    endIndent: x4,
    thickness: 0.2,
  ),
  iconTheme: const IconThemeData(color: primaryPurple),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: primaryPurple,
    ),
    bodyMedium: TextStyle(fontSize: 16.0, color: Colors.white),
  ),
  disabledColor: disabledColor,
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) => Colors.grey),
  ),
);
