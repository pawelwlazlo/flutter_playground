import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static final Color _lightPrimaryColor = Colors.blueGrey.shade50;
  static final Color _lightPrimaryVariantColor = Colors.blueGrey.shade800;
  static final Color _lightOnPrimaryColor = Colors.blueGrey.shade200;
  static const Color _lightTextColorPrimary = Colors.black;
  static const Color _appbarColorLight = Colors.blue;

  static final Color _darkPrimaryColor = Colors.blueGrey.shade900;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static final Color _darkOnPrimaryColor = Colors.blueGrey.shade300;
  static const Color _darkTextColorPrimary = Colors.white;
  static final Color _appbarColorDark = Colors.blueGrey.shade800;

  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(74, 217, 217, 1);

  // *****************
  // Colors for banks
  // *****************
  static const Color _ingBackgroundColor = Color(0xFFFF6200);
  static const Color _bnpParibasBackgroundColor = Colors.red;
  static const Color _aliorBankBackgroundColor = Colors.green;

  // *****************
  // Text Style - light
  // *****************
  static const TextStyle _lightHeadingText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontSize: 20,
      fontWeight: FontWeight.bold);

  static const TextStyle _lightBodyText = TextStyle(
      color: _lightTextColorPrimary,
      fontFamily: "Rubik",
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 16);

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    displayMedium: _lightBodyText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: _darkTextColorPrimary);

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyText.copyWith(color: _darkTextColorPrimary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    displayMedium: _darkThemeBodyeTextStyle,
  );

  // *****************
  // Theme light/dark
  // *****************

  static ThemeData getThemeForBank(String bankName, bool isDarkMode) {
    Color primaryColor;
    Color primaryVariantColor;
    Color onPrimaryColor;
    Color textColorPrimary;
    Color appbarColor;
    Color background;

    switch (bankName) {
      case 'ING':
        background = isDarkMode
            ? _ingBackgroundColor.withOpacity(1)
            : _ingBackgroundColor.withOpacity(0.7);
        primaryColor =
            isDarkMode ? Colors.blueGrey.shade900 : _ingBackgroundColor;
        primaryVariantColor =
            isDarkMode ? _darkPrimaryVariantColor : _lightPrimaryVariantColor;
        onPrimaryColor =
            isDarkMode ? _darkOnPrimaryColor : _lightOnPrimaryColor;
        textColorPrimary =
            isDarkMode ? _darkTextColorPrimary : _lightTextColorPrimary;
        appbarColor = isDarkMode ? _appbarColorDark : _appbarColorLight;
        break;
      case 'Bnp Paribas':
        background = isDarkMode
            ? _bnpParibasBackgroundColor.withOpacity(0.7)
            : _bnpParibasBackgroundColor.withOpacity(0.3);
        primaryColor =
            isDarkMode ? Colors.blueGrey.shade900 : _bnpParibasBackgroundColor;
        primaryVariantColor =
            isDarkMode ? _darkPrimaryVariantColor : _lightPrimaryVariantColor;
        onPrimaryColor =
            isDarkMode ? _darkOnPrimaryColor : _lightOnPrimaryColor;
        textColorPrimary =
            isDarkMode ? _darkTextColorPrimary : _lightTextColorPrimary;
        appbarColor = isDarkMode ? _appbarColorDark : _appbarColorLight;
        break;
      case 'AliorBank':
        background = isDarkMode
            ? _aliorBankBackgroundColor.withOpacity(0.7)
            : _aliorBankBackgroundColor.withOpacity(0.3);
        primaryColor =
            isDarkMode ? Colors.blueGrey.shade900 : _aliorBankBackgroundColor;
        primaryVariantColor =
            isDarkMode ? _darkPrimaryVariantColor : _lightPrimaryVariantColor;
        onPrimaryColor =
            isDarkMode ? _darkOnPrimaryColor : _lightOnPrimaryColor;
        textColorPrimary =
            isDarkMode ? _darkTextColorPrimary : _lightTextColorPrimary;
        appbarColor = isDarkMode ? _appbarColorDark : _appbarColorLight;
        break;
      default:
        background = isDarkMode
            ? _darkPrimaryColor
            : _lightPrimaryColor.withOpacity(0.3);
        primaryColor = isDarkMode ? _darkPrimaryColor : _lightPrimaryColor;
        primaryVariantColor =
            isDarkMode ? _darkPrimaryVariantColor : _lightPrimaryVariantColor;
        onPrimaryColor =
            isDarkMode ? _darkOnPrimaryColor : _lightOnPrimaryColor;
        textColorPrimary =
            isDarkMode ? _darkTextColorPrimary : _lightTextColorPrimary;
        appbarColor = isDarkMode ? _appbarColorDark : _appbarColorLight;
        break;
    }

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        color: appbarColor,
        iconTheme: const IconThemeData(color: _iconColor),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blueGrey,
        primaryColorDark: primaryColor,
        accentColor: _accentColor,
        backgroundColor: background,
        cardColor: primaryVariantColor,
        errorColor: Colors.redAccent,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ).copyWith(
        onPrimary: onPrimaryColor,
        primaryContainer: primaryVariantColor,
      ),
      textTheme: isDarkMode ? _darkTextTheme : _lightTextTheme,
      bottomAppBarTheme: BottomAppBarTheme(color: appbarColor),
    );
  }
}
