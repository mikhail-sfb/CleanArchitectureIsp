import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  Icon icon = const Icon(
    Icons.sunny,
    color: Colors.yellow,
  );

  void switchTheme() {
    if (currentTheme == ThemeMode.light) {
      currentTheme = ThemeMode.dark;
        icon = const Icon(
        Icons.nightlight,
        color: Colors.white,
      );
    } else {
      currentTheme = ThemeMode.light;
      icon = const Icon(
        Icons.sunny,
        color: Colors.yellow,
      );
    }

    notifyListeners();
  }
}
