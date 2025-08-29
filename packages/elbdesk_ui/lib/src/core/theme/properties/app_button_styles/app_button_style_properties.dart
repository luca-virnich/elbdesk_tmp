import 'package:flutter/material.dart';

class AppButtonStyleProperties {
  const AppButtonStyleProperties({
    required this.borderRadius,
    required this.foregroundColor,
    required this.shadowColor,
    required this.backgroundColor,
    required this.overlayColor,
    required this.borderColor,
    required this.borderColorDisabled,
    required this.foregroundColorDisabled,
    required this.foregroundColorOnHover,
    required this.borderColorOnHover,
    required this.backgroundColorDisabled,
    required this.elevation,
  });

  final double borderRadius;
  final Color foregroundColor;
  final Color foregroundColorDisabled;
  final Color foregroundColorOnHover;
  final Color shadowColor;
  final Color backgroundColor;
  final Color overlayColor;
  final Color borderColor;
  final Color borderColorDisabled;
  final Color borderColorOnHover;
  final Color backgroundColorDisabled;
  final double elevation;
}
