import 'package:flutter/material.dart';

List<ThemeData> getThemes() {
  return [
    lightTheme,
    darkTheme,
    aubergineTheme,
    versatiles,
    aubergineTheme2,
    aubergineTheme3,
    coast,
    triadic,
    complimentary,
    automatic,
    nocture,
    expensive
  ];
}

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(0, 184, 124, 1),
        iconTheme: IconThemeData(color: Colors.white)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(0, 184, 124, 1)));

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(color: Colors.white)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black12));

final ThemeData versatiles = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(0, 184, 124, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    backgroundColor: Colors.white, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(0, 184, 124, 1)));

final ThemeData aubergineTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white)),
    backgroundColor: Colors.white, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(0, 184, 124, 1)));

final ThemeData aubergineTheme2 = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(254, 161, 98, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    backgroundColor: Colors.white, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(0, 184, 124, 1)));

final ThemeData aubergineTheme3 = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(220, 26, 163, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    backgroundColor: Colors.white, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(0, 184, 124, 1)));

final ThemeData coast = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(37, 120, 93, 1),
        iconTheme: IconThemeData(color: Colors.white)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(21, 74, 57, 1)));

final ThemeData triadic = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(153, 28, 116, 1),
        iconTheme: IconThemeData(color: Colors.white)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(124, 19, 93, 1)));

final ThemeData complimentary = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(9, 12, 81, 1),
        iconTheme: IconThemeData(color: Colors.white)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(6, 8, 58, 1)));

final ThemeData automatic = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(2, 156, 106, 1),
        iconTheme: IconThemeData(color: Colors.white)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(0, 184, 124, 1)));

final ThemeData nocture = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(201, 196, 157, 1),
        iconTheme: IconThemeData(color: Colors.white)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(6, 8, 58, 1)));

final ThemeData expensive = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.black87,
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(0, 42, 54, 1),
        iconTheme: IconThemeData(color: Colors.white)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromRGBO(7, 53, 66, 1)));
//rgba(21, 74, 57, 1) background: rgba(37, 120, 93, 1);
//background: rgba(124, 19, 93, 1); background: rgba(153, 28, 116, 1);
//background: rgba(6, 8, 58, 1); background: rgba(9, 12, 81, 1);
//background: rgba(0, 184, 124, 1); background: rgba(2, 156, 106, 1);
//background: rgba(6, 8, 58, 1); background: rgba(201, 196, 157, 1);
//background: rgba(7, 53, 66, 1); background: rgba(0, 42, 54, 1);


//background: rgba(254, 161, 98, 1);
//background: rgba(220, 26, 163, 1);