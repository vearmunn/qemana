import 'package:flutter/material.dart';

class AppTheme {
  // Define Colors
  static const Color customPurple = Color(0xff413DEE);
  static const Color customLightGreen = Color.fromARGB(88, 21, 205, 104);
  static const Color customBlack = Color(0xff160F06);
  static const Color mainColor = Color(0xffF99E2E);
  static const Color mainShade = Color(0xffFFF2E2);
  static const Color navalBlue = Color(0xff007BFF);
  static const Color customPurple2 = Color(0xff9C27B0);

  // Light Mode Color Scheme
  static ColorScheme lightColorScheme = const ColorScheme.light(
    primary: mainColor,
    secondary: customPurple,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: customBlack,
  );

  // Dark Mode Color Scheme
  static ColorScheme darkColorScheme = const ColorScheme.dark(
    primary: mainColor,
    secondary: customPurple,
    surface: Color(0xff1E1E1E),
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onSurface: Colors.white,
  );

  // Text Styles
  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: customBlack),
    displayMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: customBlack),
    bodyLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: customBlack),
    bodyMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.normal, color: customBlack),
    bodySmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
    labelSmall: TextStyle(
        fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
  );

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    textTheme: textTheme,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
    useMaterial3: false,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    textTheme:
        textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
    useMaterial3: false,
  );
}
