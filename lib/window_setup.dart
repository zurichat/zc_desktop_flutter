

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

/// Sets up the Window showing the app.
/// Window initial size, and Window Min Size, app Name on TaskBar
Future<void> setUpWindow() async {
  // Placing the window screen exactly in the middle and covering the available screen
  doWhenWindowReady(() {
    final initialSize = Size(1200, 720);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = 'Zuri chat v1.0.0 by HNG Internship';
    appWindow.show();
  });
}
