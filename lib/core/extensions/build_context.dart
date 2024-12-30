import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  Brightness get brightness => MediaQuery.of(this).platformBrightness;

  TextTheme get textStyle => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Size get mqSize => MediaQuery.of(this).size;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  ScaffoldMessengerState get scaffold => ScaffoldMessenger.of(this);
}
