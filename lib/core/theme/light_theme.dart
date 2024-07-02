import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.light),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
  );
}
