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
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(0, 184, 124, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(0, 184, 124, 1),
          brightness: Brightness.light,
        )
        .copyWith(background: Colors.white));

final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Colors.black12,
          brightness: Brightness.dark,
        )
        .copyWith(background: Colors.black87));

final ThemeData versatiles = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(0, 184, 124, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(0, 184, 124, 1),
          brightness: Brightness.light,
        )
        .copyWith(background: Colors.white));

final ThemeData aubergineTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(0, 184, 124, 1),
          brightness: Brightness.light,
        )
        .copyWith(background: Colors.white));

final ThemeData aubergineTheme2 = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(254, 161, 98, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(0, 184, 124, 1),
          brightness: Brightness.light,
        )
        .copyWith(background: Colors.white));

final ThemeData aubergineTheme3 = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(220, 26, 163, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(0, 184, 124, 1),
          brightness: Brightness.light,
        )
        .copyWith(background: Colors.white));

final ThemeData coast = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(37, 120, 93, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(21, 74, 57, 1),
          brightness: Brightness.dark,
        )
        .copyWith(background: Colors.black87));

final ThemeData triadic = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(153, 28, 116, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(124, 19, 93, 1),
          brightness: Brightness.dark,
        )
        .copyWith(background: Colors.black87));

final ThemeData complimentary = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(9, 12, 81, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(6, 8, 58, 1),
          brightness: Brightness.dark,
        )
        .copyWith(background: Colors.black87));

final ThemeData automatic = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(2, 156, 106, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(0, 184, 124, 1),
          brightness: Brightness.dark,
        )
        .copyWith(background: Colors.black87));

final ThemeData nocture = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(201, 196, 157, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(6, 8, 58, 1),
          brightness: Brightness.dark,
        )
        .copyWith(background: Colors.black87));

final ThemeData expensive = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(0, 42, 54, 1),
        iconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          secondary: Color.fromRGBO(7, 53, 66, 1),
          brightness: Brightness.dark,
        )
        .copyWith(background: Colors.black87));
//rgba(21, 74, 57, 1) background: rgba(37, 120, 93, 1);
//background: rgba(124, 19, 93, 1); background: rgba(153, 28, 116, 1);
//background: rgba(6, 8, 58, 1); background: rgba(9, 12, 81, 1);
//background: rgba(0, 184, 124, 1); background: rgba(2, 156, 106, 1);
//background: rgba(6, 8, 58, 1); background: rgba(201, 196, 157, 1);
//background: rgba(7, 53, 66, 1); background: rgba(0, 42, 54, 1);


//background: rgba(254, 161, 98, 1);
//background: rgba(220, 26, 163, 1);