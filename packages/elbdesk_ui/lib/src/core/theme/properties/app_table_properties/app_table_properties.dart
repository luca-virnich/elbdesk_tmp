import 'package:flutter/material.dart';

class AppTableProperties {
  const AppTableProperties({
    required this.hoverColor,
    required this.selectedColor,
    required this.borderColor,
    required this.checkedBoxIconColor,
    required this.titleBorderColor,
    required this.activeColor,
  });

  final Color hoverColor;
  final Color selectedColor;
  final Color borderColor;
  final Color checkedBoxIconColor;
  final Color titleBorderColor;
  final Color activeColor;
}
