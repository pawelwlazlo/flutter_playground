import 'package:flutter/material.dart';

import '../../../theme.dart';

class ThemeService extends ChangeNotifier {
  bool isDarkModeOn = false;
  String selectedBank = 'ING';

  void toggleTheme() {
    isDarkModeOn = !isDarkModeOn;
    setTheme();
    notifyListeners();
  }

  void selectBank(String bankName) {
    selectedBank = bankName;
    setTheme();
    notifyListeners();
  }

  void setTheme() {
    final theme = AppTheme.getThemeForBank(selectedBank, isDarkModeOn);
    ThemeData.dark();
    ThemeData.light();
    if (isDarkModeOn) {
      ThemeData.dark().copyWith(
        colorScheme: theme.colorScheme,
        textTheme: theme.textTheme,
        scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
        appBarTheme: theme.appBarTheme,
        bottomAppBarTheme: theme.bottomAppBarTheme,
      );
    } else {
      ThemeData.light().copyWith(
        colorScheme: theme.colorScheme,
        textTheme: theme.textTheme,
        scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
        appBarTheme: theme.appBarTheme,
        bottomAppBarTheme: theme.bottomAppBarTheme,
      );
    }
  }
}
