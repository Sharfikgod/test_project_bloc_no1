import 'package:flutter/material.dart';

final _colorScheme = ColorScheme(
  primary: Colors.blueGrey,
  secondary: Colors.white,
  surface: Colors.white,
  background: Colors.white,
  error: Colors.red[700]!,
  onPrimary: Colors.white,
  onSecondary: Colors.blueGrey,
  onSurface: Colors.blueGrey,
  onBackground: Colors.blueGrey,
  onError: Colors.white,
  brightness: Brightness.light,
);

ThemeData getTheme(BuildContext context) {
  return ThemeData.from(colorScheme: _colorScheme);
}
