
import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF00a8a8),
  toggleableActiveColor: const Color(0xFF0c6980),
  colorScheme: const ColorScheme(
    primary: Color(0xFF0c6980),
    secondary: Color(0xFF00a8a8), 
    background: Colors.white,
    brightness: Brightness.light,
    error: Colors.red,
    onBackground: Colors.black,
    onError: Colors.black,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    primaryVariant: Colors.black,
    secondaryVariant: Colors.black,
    surface: Colors.black,

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF00a8a8))
      
    )
  ),
  textTheme: const TextTheme(
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Color(0xFFFFFFFF)
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Color(0xFF272928)
    )
  )
);