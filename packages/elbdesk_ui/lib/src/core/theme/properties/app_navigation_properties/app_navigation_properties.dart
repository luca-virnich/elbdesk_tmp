import 'package:flutter/material.dart';

class AppNavigationProperties {
  const AppNavigationProperties({
    required this.foregroundTextColor,
    required this.foregroundIconColor,
    required this.foregroundActiveTextColor,
    required this.borderRadius,
    required this.overlayColor,
    required this.foregroundActiveIconColor,
    required this.errorBadgeBackgroundColor,
    required this.errorBadgeForegroundColor,
  });

  final Color foregroundTextColor;
  final Color foregroundIconColor;
  final Color foregroundActiveTextColor;
  final double borderRadius;
  final Color overlayColor;
  final Color foregroundActiveIconColor;
  final Color errorBadgeBackgroundColor;
  final Color errorBadgeForegroundColor;
}
