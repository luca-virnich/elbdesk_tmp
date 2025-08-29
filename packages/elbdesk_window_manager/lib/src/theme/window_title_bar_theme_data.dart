import 'dart:ui';

import 'package:flutter/material.dart';

/// Theme data for customizing window title bars
/// Supports both Windows and macOS style title bars
class WindowTitleBarThemeData {
  const WindowTitleBarThemeData({
    required this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    // Windows style control buttons
    required this.windowsControlButtonBackgroundColor,
    required this.windowsControlButtonHoverBackgroundColor,
    required this.windowsControlButtonIconColor,
    required this.windowsCloseButtonHoverBackgroundColor,
    required this.windowsCloseButtonHoverIconColor,
    // macOS style control buttons
    required this.macOSCloseButtonColor,
    required this.macOSCloseButtonHoverColor,
    required this.macOSMinimizeButtonColor,
    required this.macOSMinimizeButtonHoverColor,
    required this.macOSMaximizeButtonColor,
    required this.macOSMaximizeButtonHoverColor,
    required this.macOSButtonDisabledColor,
    required this.macOSCloseButtonIconColor,
    required this.macOSCloseButtonHoverIconColor,
    required this.macOSMinimizeButtonIconColor,
    required this.macOSMinimizeButtonHoverIconColor,
    required this.macOSMaximizeButtonIconColor,
    required this.macOSMaximizeButtonHoverIconColor,
  });

  /// Height of the window title bar in pixels
  /// Used for both draggable area and visual height
  /// Default: 32.0 for Windows, 28.0 for macOS
  final double height;
  
  /// Background color of the window title bar
  /// Used as the title bar container background
  /// Default: Matches window theme or app theme
  final Color backgroundColor;
  
  /// Text color for window title and title bar text
  /// Used for the main window title text
  /// Default: Contrasts with backgroundColor
  final Color textColor;
  
  /// Color for icons in the title bar (not control buttons)
  /// Used for window icon or custom action icons
  /// Default: Same as textColor
  final Color iconColor;

  // Windows Style Control Buttons
  
  /// Background color for minimize/maximize buttons (Windows style)
  /// Usually transparent to show only on hover
  /// Default: Colors.transparent
  final Color windowsControlButtonBackgroundColor;
  
  /// Hover background color for minimize/maximize buttons (Windows style)
  /// Shown when user hovers over the button
  /// Default: Colors.white.withOpacity(0.1)
  final Color windowsControlButtonHoverBackgroundColor;
  
  /// Icon color for minimize/maximize buttons when hovered (Windows style)
  /// Typically white or high contrast color
  /// Default: Colors.white
  final Color windowsControlButtonIconColor;
  
  /// Hover background color for close button (Windows style)
  /// Usually red to indicate destructive action
  /// Default: Color(0xFFE81123) - Windows 10 red
  final Color windowsCloseButtonHoverBackgroundColor;
  
  /// Icon color for close button when hovered (Windows style)
  /// Usually white for contrast against red background
  /// Default: Colors.white
  final Color windowsCloseButtonHoverIconColor;

  // macOS Style Control Buttons (Traffic Lights)
  
  /// Background color for macOS close button (red traffic light)
  /// Default: Color(0xFFFF5F57) - standard macOS red
  final Color macOSCloseButtonColor;
  
  /// Hover background color for macOS close button
  /// Default: Color(0xFFE0443E) - darker red
  final Color macOSCloseButtonHoverColor;
  
  /// Background color for macOS minimize button (yellow traffic light)
  /// Default: Color(0xFFFFBD2E) - standard macOS yellow
  final Color macOSMinimizeButtonColor;
  
  /// Hover background color for macOS minimize button
  /// Default: Color(0xFFDEA123) - darker yellow
  final Color macOSMinimizeButtonHoverColor;
  
  /// Background color for macOS maximize button (green traffic light)
  /// Default: Color(0xFF28CA42) - standard macOS green
  final Color macOSMaximizeButtonColor;
  
  /// Hover background color for macOS maximize button
  /// Default: Color(0xFF1AAB29) - darker green
  final Color macOSMaximizeButtonHoverColor;
  
  /// Color for disabled macOS control buttons (unfocused window)
  /// Default: Color(0xFF808080) - gray
  final Color macOSButtonDisabledColor;
  
  /// Icon color for macOS close button (× symbol)
  /// Default: Color(0xFF5C0000) - dark red
  final Color macOSCloseButtonIconColor;
  
  /// Icon color for macOS close button when hovered
  /// Default: Color(0xFFFFFFFF) - white
  final Color macOSCloseButtonHoverIconColor;
  
  /// Icon color for macOS minimize button (− symbol)
  /// Default: Color(0xFF995700) - dark yellow/brown
  final Color macOSMinimizeButtonIconColor;
  
  /// Icon color for macOS minimize button when hovered
  /// Default: Color(0xFFFFFFFF) - white
  final Color macOSMinimizeButtonHoverIconColor;
  
  /// Icon color for macOS maximize button (+ or ⤢ symbol)
  /// Default: Color(0xFF006500) - dark green
  final Color macOSMaximizeButtonIconColor;
  
  /// Icon color for macOS maximize button when hovered
  /// Default: Color(0xFFFFFFFF) - white
  final Color macOSMaximizeButtonHoverIconColor;

  /// Creates a copy with the given fields replaced with new values
  WindowTitleBarThemeData copyWith({
    double? height,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    // Windows style
    Color? windowsControlButtonBackgroundColor,
    Color? windowsControlButtonHoverBackgroundColor,
    Color? windowsControlButtonIconColor,
    Color? windowsCloseButtonHoverBackgroundColor,
    Color? windowsCloseButtonHoverIconColor,
    // macOS style
    Color? macOSCloseButtonColor,
    Color? macOSCloseButtonHoverColor,
    Color? macOSMinimizeButtonColor,
    Color? macOSMinimizeButtonHoverColor,
    Color? macOSMaximizeButtonColor,
    Color? macOSMaximizeButtonHoverColor,
    Color? macOSButtonDisabledColor,
    Color? macOSCloseButtonIconColor,
    Color? macOSCloseButtonHoverIconColor,
    Color? macOSMinimizeButtonIconColor,
    Color? macOSMinimizeButtonHoverIconColor,
    Color? macOSMaximizeButtonIconColor,
    Color? macOSMaximizeButtonHoverIconColor,
  }) {
    return WindowTitleBarThemeData(
      height: height ?? this.height,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      // Windows style
      windowsControlButtonBackgroundColor: windowsControlButtonBackgroundColor ?? this.windowsControlButtonBackgroundColor,
      windowsControlButtonHoverBackgroundColor: windowsControlButtonHoverBackgroundColor ?? this.windowsControlButtonHoverBackgroundColor,
      windowsControlButtonIconColor: windowsControlButtonIconColor ?? this.windowsControlButtonIconColor,
      windowsCloseButtonHoverBackgroundColor: windowsCloseButtonHoverBackgroundColor ?? this.windowsCloseButtonHoverBackgroundColor,
      windowsCloseButtonHoverIconColor: windowsCloseButtonHoverIconColor ?? this.windowsCloseButtonHoverIconColor,
      // macOS style
      macOSCloseButtonColor: macOSCloseButtonColor ?? this.macOSCloseButtonColor,
      macOSCloseButtonHoverColor: macOSCloseButtonHoverColor ?? this.macOSCloseButtonHoverColor,
      macOSMinimizeButtonColor: macOSMinimizeButtonColor ?? this.macOSMinimizeButtonColor,
      macOSMinimizeButtonHoverColor: macOSMinimizeButtonHoverColor ?? this.macOSMinimizeButtonHoverColor,
      macOSMaximizeButtonColor: macOSMaximizeButtonColor ?? this.macOSMaximizeButtonColor,
      macOSMaximizeButtonHoverColor: macOSMaximizeButtonHoverColor ?? this.macOSMaximizeButtonHoverColor,
      macOSButtonDisabledColor: macOSButtonDisabledColor ?? this.macOSButtonDisabledColor,
      macOSCloseButtonIconColor: macOSCloseButtonIconColor ?? this.macOSCloseButtonIconColor,
      macOSCloseButtonHoverIconColor: macOSCloseButtonHoverIconColor ?? this.macOSCloseButtonHoverIconColor,
      macOSMinimizeButtonIconColor: macOSMinimizeButtonIconColor ?? this.macOSMinimizeButtonIconColor,
      macOSMinimizeButtonHoverIconColor: macOSMinimizeButtonHoverIconColor ?? this.macOSMinimizeButtonHoverIconColor,
      macOSMaximizeButtonIconColor: macOSMaximizeButtonIconColor ?? this.macOSMaximizeButtonIconColor,
      macOSMaximizeButtonHoverIconColor: macOSMaximizeButtonHoverIconColor ?? this.macOSMaximizeButtonHoverIconColor,
    );
  }

  /// Linearly interpolate between two [WindowTitleBarThemeData] objects.
  static WindowTitleBarThemeData? lerp(WindowTitleBarThemeData? a, WindowTitleBarThemeData? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    
    return WindowTitleBarThemeData(
      height: lerpDouble(a.height, b.height, t)!,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
      textColor: Color.lerp(a.textColor, b.textColor, t)!,
      iconColor: Color.lerp(a.iconColor, b.iconColor, t)!,
      // Windows style
      windowsControlButtonBackgroundColor: Color.lerp(a.windowsControlButtonBackgroundColor, b.windowsControlButtonBackgroundColor, t)!,
      windowsControlButtonHoverBackgroundColor: Color.lerp(a.windowsControlButtonHoverBackgroundColor, b.windowsControlButtonHoverBackgroundColor, t)!,
      windowsControlButtonIconColor: Color.lerp(a.windowsControlButtonIconColor, b.windowsControlButtonIconColor, t)!,
      windowsCloseButtonHoverBackgroundColor: Color.lerp(a.windowsCloseButtonHoverBackgroundColor, b.windowsCloseButtonHoverBackgroundColor, t)!,
      windowsCloseButtonHoverIconColor: Color.lerp(a.windowsCloseButtonHoverIconColor, b.windowsCloseButtonHoverIconColor, t)!,
      // macOS style
      macOSCloseButtonColor: Color.lerp(a.macOSCloseButtonColor, b.macOSCloseButtonColor, t)!,
      macOSCloseButtonHoverColor: Color.lerp(a.macOSCloseButtonHoverColor, b.macOSCloseButtonHoverColor, t)!,
      macOSMinimizeButtonColor: Color.lerp(a.macOSMinimizeButtonColor, b.macOSMinimizeButtonColor, t)!,
      macOSMinimizeButtonHoverColor: Color.lerp(a.macOSMinimizeButtonHoverColor, b.macOSMinimizeButtonHoverColor, t)!,
      macOSMaximizeButtonColor: Color.lerp(a.macOSMaximizeButtonColor, b.macOSMaximizeButtonColor, t)!,
      macOSMaximizeButtonHoverColor: Color.lerp(a.macOSMaximizeButtonHoverColor, b.macOSMaximizeButtonHoverColor, t)!,
      macOSButtonDisabledColor: Color.lerp(a.macOSButtonDisabledColor, b.macOSButtonDisabledColor, t)!,
      macOSCloseButtonIconColor: Color.lerp(a.macOSCloseButtonIconColor, b.macOSCloseButtonIconColor, t)!,
      macOSCloseButtonHoverIconColor: Color.lerp(a.macOSCloseButtonHoverIconColor, b.macOSCloseButtonHoverIconColor, t)!,
      macOSMinimizeButtonIconColor: Color.lerp(a.macOSMinimizeButtonIconColor, b.macOSMinimizeButtonIconColor, t)!,
      macOSMinimizeButtonHoverIconColor: Color.lerp(a.macOSMinimizeButtonHoverIconColor, b.macOSMinimizeButtonHoverIconColor, t)!,
      macOSMaximizeButtonIconColor: Color.lerp(a.macOSMaximizeButtonIconColor, b.macOSMaximizeButtonIconColor, t)!,
      macOSMaximizeButtonHoverIconColor: Color.lerp(a.macOSMaximizeButtonHoverIconColor, b.macOSMaximizeButtonHoverIconColor, t)!,
    );
  }
}