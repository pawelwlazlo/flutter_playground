import 'package:flutter/material.dart';
import 'package:flutter_playground/color_schemes.g.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // *****************
  // static colors
  // *****************
  static const Color _iconColor = Colors.white;

  static const Color _accentColor = Color.fromRGBO(74, 217, 217, 1);

  // *****************
  // Text Style - light
  // *****************
  static final TextStyle _lightHeadingText = TextStyle(
      // color: lightColorScheme.onPrimary,
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.normal);

  static final TextStyle _lightBodyText = TextStyle(
      // color: lightColorScheme.onPrimary,
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      fontSize: 16);

  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadingText,
    displayMedium: _lightBodyText,
  );

  // *****************
  // Text Style - dark
  // *****************
  static final TextStyle _darkThemeHeadingTextStyle =
      _lightHeadingText.copyWith(color: lightColorScheme.primary);

  static final TextStyle _darkThemeBodyeTextStyle =
      _lightBodyText.copyWith(color: darkColorScheme.primary);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkThemeHeadingTextStyle,
    displayMedium: _darkThemeBodyeTextStyle,
  );

  // *****************
  // Theme light/dark
  // *****************

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: lightColorScheme.background,
      appBarTheme: AppBarTheme(
          color: lightColorScheme.background,
          iconTheme: IconThemeData(color: _iconColor)),
      colorScheme: lightColorScheme,
      textTheme: _lightTextTheme,
      bottomAppBarTheme: BottomAppBarTheme(color: lightColorScheme.background));

  static final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: darkColorScheme.background,
      appBarTheme: AppBarTheme(
          color: darkColorScheme.background,
          iconTheme: const IconThemeData(color: _iconColor)),
      colorScheme: darkColorScheme,
      textTheme: _darkTextTheme,
      bottomAppBarTheme: BottomAppBarTheme(color: darkColorScheme.background));
}
