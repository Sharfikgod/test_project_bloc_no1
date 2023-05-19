import 'package:flutter/material.dart';

extension BuildContextThemeData on BuildContext {
  ThemeData get theme => Theme.of(this);
}