import 'package:flutter/material.dart';

/// Theme data for customizing the appearance of the mobile bottom bar
class MobileBottomBarThemeData {
  const MobileBottomBarThemeData({
    required this.borderColor,
    required this.iconColor,
    required this.activeIconColor,
    required this.disabledIconColor,
    required this.textColor,
    required this.activeTextColor,
    required this.disabledTextColor,
    required this.badgeBackgroundColor,
    required this.badgeTextColor,
    required this.shadowColor,
  });

  /// Top border color of the mobile bottom bar
  /// Used in: mobile_bottom_bar.dart:43 (Border.top)
  final Color borderColor;
  
  /// Default icon color for bottom bar items
  /// Used in: mobile_bottom_bar.dart:134 (when isEnabled && !isActive)
  final Color iconColor;
  
  /// Icon color for active/selected bottom bar items
  /// Used in: mobile_bottom_bar.dart:134 (when isEnabled && isActive)
  final Color activeIconColor;
  
  /// Icon color for disabled bottom bar items
  /// Used in: mobile_bottom_bar.dart:135 (when !isEnabled)
  final Color disabledIconColor;
  
  /// Default text color for bottom bar item labels
  /// Used in: mobile_bottom_bar.dart:137 (when isEnabled && !isActive)
  final Color textColor;
  
  /// Text color for active/selected bottom bar items
  /// Used in: mobile_bottom_bar.dart:137 (when isEnabled && isActive)
  final Color activeTextColor;
  
  /// Text color for disabled bottom bar item labels
  /// Used in: mobile_bottom_bar.dart:138 (when !isEnabled)
  final Color disabledTextColor;
  
  /// Background color for notification badges on items
  /// Used in: mobile_bottom_bar.dart:164 (Positioned badge Container)
  final Color badgeBackgroundColor;
  
  /// Text color for badge numbers/text
  /// Used in: mobile_bottom_bar.dart:174 (badge Text color)
  final Color badgeTextColor;
  
  /// Shadow color for the mobile bottom bar elevation effect
  /// Used in: mobile_bottom_bar.dart:47 (BoxShadow color)
  final Color shadowColor;

  /// Creates a copy with the given fields replaced with new values
  MobileBottomBarThemeData copyWith({
    Color? borderColor,
    Color? iconColor,
    Color? activeIconColor,
    Color? disabledIconColor,
    Color? textColor,
    Color? activeTextColor,
    Color? disabledTextColor,
    Color? badgeBackgroundColor,
    Color? badgeTextColor,
    Color? shadowColor,
  }) {
    return MobileBottomBarThemeData(
      borderColor: borderColor ?? this.borderColor,
      iconColor: iconColor ?? this.iconColor,
      activeIconColor: activeIconColor ?? this.activeIconColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
      textColor: textColor ?? this.textColor,
      activeTextColor: activeTextColor ?? this.activeTextColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      badgeBackgroundColor: badgeBackgroundColor ?? this.badgeBackgroundColor,
      badgeTextColor: badgeTextColor ?? this.badgeTextColor,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  /// Linearly interpolate between two [MobileBottomBarThemeData] objects.
  static MobileBottomBarThemeData? lerp(MobileBottomBarThemeData? a, MobileBottomBarThemeData? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    
    return MobileBottomBarThemeData(
      borderColor: Color.lerp(a.borderColor, b.borderColor, t)!,
      iconColor: Color.lerp(a.iconColor, b.iconColor, t)!,
      activeIconColor: Color.lerp(a.activeIconColor, b.activeIconColor, t)!,
      disabledIconColor: Color.lerp(a.disabledIconColor, b.disabledIconColor, t)!,
      textColor: Color.lerp(a.textColor, b.textColor, t)!,
      activeTextColor: Color.lerp(a.activeTextColor, b.activeTextColor, t)!,
      disabledTextColor: Color.lerp(a.disabledTextColor, b.disabledTextColor, t)!,
      badgeBackgroundColor: Color.lerp(a.badgeBackgroundColor, b.badgeBackgroundColor, t)!,
      badgeTextColor: Color.lerp(a.badgeTextColor, b.badgeTextColor, t)!,
      shadowColor: Color.lerp(a.shadowColor, b.shadowColor, t)!,
    );
  }
}