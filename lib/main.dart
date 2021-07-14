import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:calculator/Calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      AdaptiveTheme(
          light: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
            accentColor: Colors.amber,
          ),
          dark: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
            accentColor: Colors.amber,
          ),
          initial: AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp(
            title: 'Adaptive Theme Demo',
            theme: theme,
            darkTheme: darkTheme,
            home: Calculator(),
          ),
      )
  );
}