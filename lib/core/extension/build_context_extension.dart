import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  TextTheme get textStyle => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Size get mqSize => MediaQuery.of(this).size;
  EdgeInsets get padding => MediaQuery.of(this).padding;
}
