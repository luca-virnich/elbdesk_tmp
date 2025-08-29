import 'dart:ui';

import 'package:flutter/material.dart';

/// Theme data for customizing the appearance of the desktop taskbar
class TaskbarThemeData {
  const TaskbarThemeData({
    required this.borderColor,
    required this.height,
    // General icon colors
    required this.iconColor,
    required this.iconActiveColor,
    required this.iconDisabledColor,
    required this.iconHoverColor,
    // Specific control button colors
    required this.minimizeAllIconColor,
    required this.minimizeAllIconDisabledColor,
    required this.restoreAllIconColor,
    required this.restoreAllIconDisabledColor,
    required this.overviewIconColor,
    required this.overviewIconActiveColor,
    required this.overviewIconDisabledColor,
    // Chevron colors
    required this.chevronIconColor,
    required this.chevronIconDisabledColor,
    // Text colors
    required this.textColor,
    required this.textActiveColor,
    required this.textDisabledColor,
    // Tile colors
    required this.tileBackgroundColor,
    required this.tileActiveBackgroundColor,
    required this.tileHoverBackgroundColor,
    required this.tileHighlightColor,
    required this.tileMinimizedOpacity,
    // Chevron background
    required this.chevronBackgroundGradient,
    // Icon button hover effects
    required this.iconButtonHoverBackgroundColor,
    required this.iconButtonBorderRadius,
  });

  // Background and borders
  /// Top border color of the taskbar (1px line)
  /// Used in: desktop_taskbar.dart:53 (Border.top)
  final Color borderColor;
  
  /// Height of the taskbar in pixels
  /// Used in: desktop_taskbar.dart:48 (Container height)
  /// Default: 48.0
  final double height;

  // General icon colors (fallback for specific controls)
  /// Default icon color for taskbar tiles when not active
  /// Used in: taskbar_tile.dart:111, stacked_taskbar_tile.dart:232
  final Color iconColor;
  
  /// Icon color for active/focused window tiles
  /// Used in: taskbar_tile.dart:111, stacked_taskbar_tile.dart:231
  final Color iconActiveColor;
  
  /// Icon color for disabled taskbar items
  /// Currently UNUSED - consider using for disabled states
  final Color iconDisabledColor;
  
  /// Icon color when hovering over taskbar items
  /// Currently UNUSED - tiles use iconColor/iconActiveColor
  final Color iconHoverColor;

  // Specific control button colors
  /// Icon color for "minimize all" button
  /// Used in: desktop_taskbar.dart:141 (when hasActiveWindows)
  final Color minimizeAllIconColor;
  
  /// Icon color for "minimize all" when no windows are active
  /// Used in: desktop_taskbar.dart:141 (when !hasActiveWindows)
  final Color minimizeAllIconDisabledColor;
  
  /// Icon color for "restore all" button
  /// Used in: desktop_taskbar.dart:163 (when hasMinimizedWindows)
  final Color restoreAllIconColor;
  
  /// Icon color for "restore all" when no windows are minimized
  /// Used in: desktop_taskbar.dart:163 (when !hasMinimizedWindows)
  final Color restoreAllIconDisabledColor;
  
  /// Icon color for window overview button
  /// Used in: desktop_taskbar.dart:185 (when hasWindows)
  final Color overviewIconColor;
  
  /// Icon color for window overview when active/open
  /// Used in: desktop_taskbar.dart:185 (when showOverview)
  final Color overviewIconActiveColor;
  
  /// Icon color for window overview when no windows exist
  /// Used in: desktop_taskbar.dart:185 (when !hasWindows)
  final Color overviewIconDisabledColor;

  // Chevron colors
  /// Icon color for overflow chevron (») when tiles overflow
  /// Used in: desktop_taskbar.dart:311 (when hasOverflowTiles)
  final Color chevronIconColor;
  
  /// Icon color for chevron when no overflow tiles exist
  /// Used in: desktop_taskbar.dart:311 (when !hasOverflowTiles)
  final Color chevronIconDisabledColor;

  // Text colors
  /// Default text color for window titles in taskbar
  /// Used in: taskbar_tile.dart:128
  final Color textColor;
  
  /// Text color for active/focused window titles
  /// Used in: taskbar_tile.dart:128 (when isActive)
  final Color textActiveColor;
  
  /// Text color for disabled taskbar items
  /// Currently UNUSED - consider using for disabled states
  final Color textDisabledColor;

  // Tile colors
  /// Background color for inactive window tiles
  /// Used in: taskbar_tile.dart:97
  final Color tileBackgroundColor;
  
  /// Background color for active/focused window tiles
  /// Used in: taskbar_tile.dart:97 (when isActive)
  final Color tileActiveBackgroundColor;
  
  /// Background color when hovering over window tiles
  /// Used in: taskbar_tile.dart:89 (Material hover effect)
  final Color tileHoverBackgroundColor;
  
  /// Background color for highlighted/flashing window tiles
  /// Used in: taskbar_tile.dart for window attention requests
  /// Typically an orange color like Windows uses
  final Color tileHighlightColor;
  
  /// Opacity applied to minimized window tiles (0.0-1.0)
  /// Used in: taskbar_tile.dart:59, stacked_taskbar_tile.dart:190
  /// Default: 0.6 (60% opacity)
  final double tileMinimizedOpacity;

  // Chevron background
  /// Gradient background for the overflow chevron area
  /// Used in: desktop_taskbar.dart:294 (Container decoration)
  /// Creates fade effect from transparent to taskbar background
  final Gradient chevronBackgroundGradient;

  // Icon button hover effects  
  /// Background color for icon buttons when hovered
  /// Used in: desktop_taskbar.dart:135,157,179,305 (all control buttons)
  final Color iconButtonHoverBackgroundColor;
  
  /// Border radius for icon button hover backgrounds
  /// Used in: desktop_taskbar.dart:136,158,180,306
  /// Default: 4.0
  final double iconButtonBorderRadius;

  /// Creates a copy with the given fields replaced with new values
  TaskbarThemeData copyWith({
    Color? borderColor,
    double? height,
    Color? iconColor,
    Color? iconActiveColor,
    Color? iconDisabledColor,
    Color? iconHoverColor,
    Color? minimizeAllIconColor,
    Color? minimizeAllIconDisabledColor,
    Color? restoreAllIconColor,
    Color? restoreAllIconDisabledColor,
    Color? overviewIconColor,
    Color? overviewIconActiveColor,
    Color? overviewIconDisabledColor,
    Color? chevronIconColor,
    Color? chevronIconDisabledColor,
    Color? textColor,
    Color? textActiveColor,
    Color? textDisabledColor,
    Color? tileBackgroundColor,
    Color? tileActiveBackgroundColor,
    Color? tileHoverBackgroundColor,
    Color? tileHighlightColor,
    double? tileMinimizedOpacity,
    Gradient? chevronBackgroundGradient,
    Color? iconButtonHoverBackgroundColor,
    double? iconButtonBorderRadius,
  }) {
    return TaskbarThemeData(
      borderColor: borderColor ?? this.borderColor,
      height: height ?? this.height,
      iconColor: iconColor ?? this.iconColor,
      iconActiveColor: iconActiveColor ?? this.iconActiveColor,
      iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
      iconHoverColor: iconHoverColor ?? this.iconHoverColor,
      minimizeAllIconColor: minimizeAllIconColor ?? this.minimizeAllIconColor,
      minimizeAllIconDisabledColor:
          minimizeAllIconDisabledColor ?? this.minimizeAllIconDisabledColor,
      restoreAllIconColor: restoreAllIconColor ?? this.restoreAllIconColor,
      restoreAllIconDisabledColor:
          restoreAllIconDisabledColor ?? this.restoreAllIconDisabledColor,
      overviewIconColor: overviewIconColor ?? this.overviewIconColor,
      overviewIconActiveColor:
          overviewIconActiveColor ?? this.overviewIconActiveColor,
      overviewIconDisabledColor:
          overviewIconDisabledColor ?? this.overviewIconDisabledColor,
      chevronIconColor: chevronIconColor ?? this.chevronIconColor,
      chevronIconDisabledColor:
          chevronIconDisabledColor ?? this.chevronIconDisabledColor,
      textColor: textColor ?? this.textColor,
      textActiveColor: textActiveColor ?? this.textActiveColor,
      textDisabledColor: textDisabledColor ?? this.textDisabledColor,
      tileBackgroundColor: tileBackgroundColor ?? this.tileBackgroundColor,
      tileActiveBackgroundColor:
          tileActiveBackgroundColor ?? this.tileActiveBackgroundColor,
      tileHoverBackgroundColor:
          tileHoverBackgroundColor ?? this.tileHoverBackgroundColor,
      tileMinimizedOpacity: tileMinimizedOpacity ?? this.tileMinimizedOpacity,
      chevronBackgroundGradient:
          chevronBackgroundGradient ?? this.chevronBackgroundGradient,
      iconButtonHoverBackgroundColor:
          iconButtonHoverBackgroundColor ?? this.iconButtonHoverBackgroundColor,
      iconButtonBorderRadius: iconButtonBorderRadius ?? this.iconButtonBorderRadius,
      tileHighlightColor: tileHighlightColor ?? this.tileHighlightColor,
    );
  }

  /// Linearly interpolate between two [TaskbarThemeData] objects.
  static TaskbarThemeData? lerp(TaskbarThemeData? a, TaskbarThemeData? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    
    return TaskbarThemeData(
      borderColor: Color.lerp(a.borderColor, b.borderColor, t)!,
      height: lerpDouble(a.height, b.height, t)!,
      iconColor: Color.lerp(a.iconColor, b.iconColor, t)!,
      iconActiveColor: Color.lerp(a.iconActiveColor, b.iconActiveColor, t)!,
      iconDisabledColor: Color.lerp(a.iconDisabledColor, b.iconDisabledColor, t)!,
      iconHoverColor: Color.lerp(a.iconHoverColor, b.iconHoverColor, t)!,
      minimizeAllIconColor: Color.lerp(a.minimizeAllIconColor, b.minimizeAllIconColor, t)!,
      minimizeAllIconDisabledColor: Color.lerp(a.minimizeAllIconDisabledColor, b.minimizeAllIconDisabledColor, t)!,
      restoreAllIconColor: Color.lerp(a.restoreAllIconColor, b.restoreAllIconColor, t)!,
      restoreAllIconDisabledColor: Color.lerp(a.restoreAllIconDisabledColor, b.restoreAllIconDisabledColor, t)!,
      overviewIconColor: Color.lerp(a.overviewIconColor, b.overviewIconColor, t)!,
      overviewIconActiveColor: Color.lerp(a.overviewIconActiveColor, b.overviewIconActiveColor, t)!,
      overviewIconDisabledColor: Color.lerp(a.overviewIconDisabledColor, b.overviewIconDisabledColor, t)!,
      chevronIconColor: Color.lerp(a.chevronIconColor, b.chevronIconColor, t)!,
      chevronIconDisabledColor: Color.lerp(a.chevronIconDisabledColor, b.chevronIconDisabledColor, t)!,
      textColor: Color.lerp(a.textColor, b.textColor, t)!,
      textActiveColor: Color.lerp(a.textActiveColor, b.textActiveColor, t)!,
      textDisabledColor: Color.lerp(a.textDisabledColor, b.textDisabledColor, t)!,
      tileBackgroundColor: Color.lerp(a.tileBackgroundColor, b.tileBackgroundColor, t)!,
      tileActiveBackgroundColor: Color.lerp(a.tileActiveBackgroundColor, b.tileActiveBackgroundColor, t)!,
      tileHoverBackgroundColor: Color.lerp(a.tileHoverBackgroundColor, b.tileHoverBackgroundColor, t)!,
      tileHighlightColor: Color.lerp(a.tileHighlightColor, b.tileHighlightColor, t)!,
      tileMinimizedOpacity: lerpDouble(a.tileMinimizedOpacity, b.tileMinimizedOpacity, t)!,
      chevronBackgroundGradient: Gradient.lerp(a.chevronBackgroundGradient, b.chevronBackgroundGradient, t)!,
      iconButtonHoverBackgroundColor: Color.lerp(a.iconButtonHoverBackgroundColor, b.iconButtonHoverBackgroundColor, t)!,
      iconButtonBorderRadius: lerpDouble(a.iconButtonBorderRadius, b.iconButtonBorderRadius, t)!,
    );
  }

  // Helper methods - no longer needed since all properties are required
  Color getMinimizeAllIconColor() => minimizeAllIconColor;
  Color getMinimizeAllIconDisabledColor() => minimizeAllIconDisabledColor;
  Color getRestoreAllIconColor() => restoreAllIconColor;
  Color getRestoreAllIconDisabledColor() => restoreAllIconDisabledColor;
  Color getOverviewIconColor() => overviewIconColor;
  Color getOverviewIconActiveColor() => overviewIconActiveColor;
  Color getOverviewIconDisabledColor() => overviewIconDisabledColor;
  Color getChevronIconColor() => chevronIconColor;
  Color getChevronIconDisabledColor() => chevronIconDisabledColor;
}
