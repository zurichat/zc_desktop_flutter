import 'package:flutter/material.dart';

List<ThemeData> getThemes() {
  return [lightThemes, darkThemes, aubergineThemes, versatiles];
}

final ThemeData lightThemes = ThemeData(
  appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(0, 184, 124, 1),
      iconTheme: IconThemeData(color: Colors.white)),
  dialogBackgroundColor: Colors.white,
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  dividerColor: Colors.black,
);

final ThemeData aubergineThemes = ThemeData(
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

final ThemeData versatiles = ThemeData(
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

final ThemeData darkThemes = ThemeData(
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
