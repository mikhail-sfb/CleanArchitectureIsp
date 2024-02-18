import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  Icon icon = const Icon(Icons.sunny);

  void switchTheme() {
    if (currentTheme == ThemeMode.light) {
      currentTheme = ThemeMode.dark;
      icon = const Icon(Icons.nightlight);
    } else {
      currentTheme = ThemeMode.light;
      icon = const Icon(Icons.sunny);
    }

    notifyListeners();
  }
}
