import 'package:flutter/material.dart';

final apptheme = ThemeData(
    // Define the default brightness and colors.
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 37, 12, 53),
      // ···
      brightness: Brightness.dark,
    ),

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      // ···
      titleLarge: TextStyle(fontWeight: .bold),
      bodyMedium: TextStyle(fontWeight: .normal),
      displaySmall: TextStyle(fontWeight: .w200),
    ),
  );