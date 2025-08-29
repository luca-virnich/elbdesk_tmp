import 'dart:ui';

import 'package:flutter/material.dart';

/// Theme data for customizing the appearance of the window overview
class WindowOverviewThemeData {
  const WindowOverviewThemeData({
    required this.backgroundColor,
    required this.overlayColor,
    required this.tileBackgroundColor,
    required this.tileActiveBorderColor,
    required this.tileTitleBarBackgroundColor,
    required this.tileTitleBarActiveBackgroundColor,
    required this.tileTitleTextColor,
    required this.tileTitleActiveTextColor,
    required this.tilePreviewTextColor,
    required this.tileShadowColor,
    required this.tileBorderRadius,
  });

  /// Background color behind the window overview grid
  /// Currently UNUSED - overview uses transparent background
  /// Consider using for a subtle background tint
  final Color backgroundColor;
  
  /// Semi-transparent overlay color that dims the main content
  /// Used in: window_overview_dialog.dart:201 (backdrop overlay)
  /// Typically black with low opacity (e.g., Colors.black.withValues(alpha: 0.5))
  final Color overlayColor;
  
  /// Background color for window preview tiles
  /// Used in: window_overview_tile.dart:85 (Container decoration)
  final Color tileBackgroundColor;
  
  /// Border color for the currently active/selected window tile
  /// Used in: window_overview_tile.dart:90 (when isActive is true)
  /// Shows which window is currently focused
  final Color tileActiveBorderColor;
  
  /// Background color for tile title bars
  /// Used in: window_overview_tile.dart:103 (Container color)
  final Color tileTitleBarBackgroundColor;
  
  /// Background color for active window's title bar
  /// Used in: window_overview_tile.dart:103 (when isActive)
  final Color tileTitleBarActiveBackgroundColor;
  
  /// Text color for window titles in overview
  /// Used in: window_overview_tile.dart:121 (Text style)
  final Color tileTitleTextColor;
  
  /// Text color for active window's title
  /// Used in: window_overview_tile.dart:121 (when isActive)
  final Color tileTitleActiveTextColor;
  
  /// Text color for "No preview available" message
  /// Used in: window_overview_tile.dart:156 (when window is minimized)
  final Color tilePreviewTextColor;
  
  /// Shadow color for window preview tiles
  /// Used in: window_overview_tile.dart:94 (BoxShadow)
  /// Provides depth and separation between tiles
  final Color tileShadowColor;
  
  /// Corner radius for window preview tiles
  /// Used in: window_overview_tile.dart:87 (BorderRadius.circular)
  /// Default: 8.0
  final double tileBorderRadius;

  /// Creates a copy with the given fields replaced with new values
  WindowOverviewThemeData copyWith({
    Color? backgroundColor,
    Color? overlayColor,
    Color? tileBackgroundColor,
    Color? tileActiveBorderColor,
    Color? tileTitleBarBackgroundColor,
    Color? tileTitleBarActiveBackgroundColor,
    Color? tileTitleTextColor,
    Color? tileTitleActiveTextColor,
    Color? tilePreviewTextColor,
    Color? tileShadowColor,
    double? tileBorderRadius,
  }) {
    return WindowOverviewThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      overlayColor: overlayColor ?? this.overlayColor,
      tileBackgroundColor: tileBackgroundColor ?? this.tileBackgroundColor,
      tileActiveBorderColor: tileActiveBorderColor ?? this.tileActiveBorderColor,
      tileTitleBarBackgroundColor: tileTitleBarBackgroundColor ?? this.tileTitleBarBackgroundColor,
      tileTitleBarActiveBackgroundColor: tileTitleBarActiveBackgroundColor ?? this.tileTitleBarActiveBackgroundColor,
      tileTitleTextColor: tileTitleTextColor ?? this.tileTitleTextColor,
      tileTitleActiveTextColor: tileTitleActiveTextColor ?? this.tileTitleActiveTextColor,
      tilePreviewTextColor: tilePreviewTextColor ?? this.tilePreviewTextColor,
      tileShadowColor: tileShadowColor ?? this.tileShadowColor,
      tileBorderRadius: tileBorderRadius ?? this.tileBorderRadius,
    );
  }

  /// Linearly interpolate between two [WindowOverviewThemeData] objects.
  static WindowOverviewThemeData? lerp(WindowOverviewThemeData? a, WindowOverviewThemeData? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    
    return WindowOverviewThemeData(
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
      overlayColor: Color.lerp(a.overlayColor, b.overlayColor, t)!,
      tileBackgroundColor: Color.lerp(a.tileBackgroundColor, b.tileBackgroundColor, t)!,
      tileActiveBorderColor: Color.lerp(a.tileActiveBorderColor, b.tileActiveBorderColor, t)!,
      tileTitleBarBackgroundColor: Color.lerp(a.tileTitleBarBackgroundColor, b.tileTitleBarBackgroundColor, t)!,
      tileTitleBarActiveBackgroundColor: Color.lerp(a.tileTitleBarActiveBackgroundColor, b.tileTitleBarActiveBackgroundColor, t)!,
      tileTitleTextColor: Color.lerp(a.tileTitleTextColor, b.tileTitleTextColor, t)!,
      tileTitleActiveTextColor: Color.lerp(a.tileTitleActiveTextColor, b.tileTitleActiveTextColor, t)!,
      tilePreviewTextColor: Color.lerp(a.tilePreviewTextColor, b.tilePreviewTextColor, t)!,
      tileShadowColor: Color.lerp(a.tileShadowColor, b.tileShadowColor, t)!,
      tileBorderRadius: lerpDouble(a.tileBorderRadius, b.tileBorderRadius, t)!,
    );
  }

}