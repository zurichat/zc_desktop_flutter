import 'package:flutter/material.dart';

class ThemeModell {
  final int index;
  final String title;

  ThemeModell({required this.index, required this.title});
}

List<ThemeData> getThemes() {
  return [lightTheme, darkTheme, aubergineTheme, versatile];
}

final ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(0, 184, 124, 1),
      iconTheme: IconThemeData(color: Colors.white)),
  dialogBackgroundColor: Colors.white,
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.dark(
      brightness: Brightness.light, primary: Colors.black),
  dividerColor: Colors.black,
);

final ThemeData aubergineTheme = ThemeData(
  appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(0, 184, 124, 1),
      iconTheme: IconThemeData(color: Colors.white)),
  dialogBackgroundColor: Colors.white,
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  accentColor: Color.fromRGBO(0, 184, 124, 1),
  colorScheme: const ColorScheme.dark(
      brightness: Brightness.light, primary: Colors.black),
  dividerColor: Colors.black,
);

final ThemeData versatile = ThemeData(
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white)),
  dialogBackgroundColor: Colors.white,
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  accentColor: Color.fromRGBO(0, 184, 124, 1),
  colorScheme: const ColorScheme.dark(
      brightness: Brightness.light, primary: Colors.black),
  dividerColor: Colors.black,
);

final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white)),
    dialogBackgroundColor: Colors.black,
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    accentColor: Colors.black,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.dark, primary: Colors.white),
    dividerColor: Colors.white);
