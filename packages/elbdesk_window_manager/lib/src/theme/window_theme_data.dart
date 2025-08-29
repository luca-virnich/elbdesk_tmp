import 'dart:ui';

import 'package:flutter/material.dart';

/// Theme data for customizing the appearance of floating windows
/// This covers the window container itself (background, borders, shadows)
class WindowThemeData {
  const WindowThemeData({
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.borderRadius,
    required this.shadowColor,
    required this.shadowBlurRadius,
    required this.shadowOffset,
    required this.resizeHandleColor,
    required this.resizeHandleHoverColor,
    required this.resizeHandleSize,
  });

  /// Background color of the floating window content area
  /// Used for the window's main container background
  /// Default: Colors.transparent (content defines its own background)
  final Color backgroundColor;
  
  /// Border color for the floating window frame
  /// Used when a border is desired around the window
  /// Default: Colors.transparent (no border)
  final Color borderColor;
  
  /// Width of the window border in pixels
  /// Set to 0.0 for no border
  /// Default: 0.0
  final double borderWidth;
  
  /// Corner radius for floating windows
  /// Applied to window container and shadow
  /// Default: 8.0
  /// Set to 0.0 for sharp corners (used in maximized/mobile state)
  final double borderRadius;
  
  /// Shadow color for floating windows
  /// Creates depth effect for floating windows
  /// Default: Colors.black.withOpacity(0.2)
  final Color shadowColor;
  
  /// Blur radius for window shadow
  /// Higher values create softer shadows
  /// Default: 10.0
  final double shadowBlurRadius;
  
  /// Offset for window shadow
  /// Determines shadow direction and distance
  /// Default: Offset(0, 5) - shadow below window
  final Offset shadowOffset;
  
  /// Color for window resize handles when visible
  /// Applied to resize handle indicators
  /// Default: Theme primary color with opacity
  final Color resizeHandleColor;
  
  /// Color for window resize handles when hovered
  /// Shows user the handle is interactive
  /// Default: Theme primary color
  final Color resizeHandleHoverColor;
  
  /// Size of resize handle hit areas in pixels
  /// Larger values make resizing easier
  /// Default: 12.0
  final double resizeHandleSize;

  /// Creates a copy with the given fields replaced with new values
  WindowThemeData copyWith({
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    double? borderRadius,
    Color? shadowColor,
    double? shadowBlurRadius,
    Offset? shadowOffset,
    Color? resizeHandleColor,
    Color? resizeHandleHoverColor,
    double? resizeHandleSize,
  }) {
    return WindowThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      resizeHandleColor: resizeHandleColor ?? this.resizeHandleColor,
      resizeHandleHoverColor: resizeHandleHoverColor ?? this.resizeHandleHoverColor,
      resizeHandleSize: resizeHandleSize ?? this.resizeHandleSize,
    );
  }

  /// Linearly interpolate between two [WindowThemeData] objects.
  static WindowThemeData? lerp(WindowThemeData? a, WindowThemeData? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    
    return WindowThemeData(
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
      borderColor: Color.lerp(a.borderColor, b.borderColor, t)!,
      borderWidth: lerpDouble(a.borderWidth, b.borderWidth, t)!,
      borderRadius: lerpDouble(a.borderRadius, b.borderRadius, t)!,
      shadowColor: Color.lerp(a.shadowColor, b.shadowColor, t)!,
      shadowBlurRadius: lerpDouble(a.shadowBlurRadius, b.shadowBlurRadius, t)!,
      shadowOffset: Offset.lerp(a.shadowOffset, b.shadowOffset, t)!,
      resizeHandleColor: Color.lerp(a.resizeHandleColor, b.resizeHandleColor, t)!,
      resizeHandleHoverColor: Color.lerp(a.resizeHandleHoverColor, b.resizeHandleHoverColor, t)!,
      resizeHandleSize: lerpDouble(a.resizeHandleSize, b.resizeHandleSize, t)!,
    );
  }
}