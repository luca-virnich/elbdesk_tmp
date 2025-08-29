import 'dart:ui';

import 'package:flutter/material.dart';

/// Theme data for customizing the appearance of the side navigation
class SideNavigationThemeData {
  const SideNavigationThemeData({
    required this.selectedBackgroundColor,
    required this.selectedBorderColor,
    required this.iconColor,
    required this.selectedIconColor,
    required this.textColor,
    required this.selectedTextColor,
    required this.sectionTextColor,
    required this.dividerColor,
    required this.hoverColor,
    required this.expandCollapseButtonColor,
    required this.itemBorderRadius,
    required this.itemPadding,
    required this.expandedWidth,
    required this.collapsedWidth,
    required this.selectedColor,
    required this.headerTextColor,
  });

  /// Background color for selected menu items
  /// Used in: expandable_side_navigation.dart:232 (when item.isSelected is true)
  final Color selectedBackgroundColor;
  
  /// Left border color for selected menu items (accent indicator)
  /// Used in: expandable_side_navigation.dart:241 (3px left border)
  final Color selectedBorderColor;
  
  /// Default icon color for non-selected menu items
  /// Used in: expandable_side_navigation.dart:258
  final Color iconColor;
  
  /// Icon color for selected menu items
  /// Used in: expandable_side_navigation.dart:257 (when isSelected)
  final Color selectedIconColor;
  
  /// Default text color for non-selected menu items
  /// Used in: expandable_side_navigation.dart:284
  final Color textColor;
  
  /// Text color for selected menu items
  /// Used in: expandable_side_navigation.dart:283 (when isSelected)
  final Color selectedTextColor;
  
  /// Text color for section headers (e.g., "MAIN MENU")
  /// Used in: expandable_side_navigation.dart:384 (_SideNavigationSectionWidget)
  final Color sectionTextColor;
  
  /// Color for divider lines between sections
  /// Used in: expandable_side_navigation.dart:73 (SideNavigationDivider)
  /// Also used in: expandable_side_navigation.dart:372,394 (section title lines)
  final Color dividerColor;
  
  /// Background color when hovering over menu items
  /// Used in: expandable_side_navigation.dart:223 (InkWell hoverColor)
  /// Also used in: expandable_side_navigation.dart:172 (expand/collapse button hover)
  final Color hoverColor;
  
  /// Icon color for the expand/collapse chevron button
  /// Used in: expandable_side_navigation.dart:155
  final Color expandCollapseButtonColor;
  
  /// Border radius for menu items and buttons (in pixels)
  /// Used in: expandable_side_navigation.dart:218,224,234,164
  final double itemBorderRadius;
  
  /// Padding around each menu item
  /// Used in: expandable_side_navigation.dart:227 (wraps entire menu item)
  /// Default should be EdgeInsets.symmetric(horizontal: 12, vertical: 2)
  final EdgeInsetsGeometry itemPadding;
  
  /// Width of side navigation when expanded (showing icons and labels)
  /// Used in: expandable_side_navigation.dart:48
  /// Default: 250
  final double expandedWidth;
  
  /// Width of side navigation when collapsed (showing only icons)
  /// Used in: expandable_side_navigation.dart:49
  /// Default: 72
  final double collapsedWidth;
  
  /// Alternative selected color (can override selectedBackgroundColor/selectedBorderColor)
  /// Used in: expandable_side_navigation.dart:232,241,257,283 (when provided)
  /// Typically used to override selection color for specific items
  final Color selectedColor;
  
  /// Text color for drawer header (mobile view)
  /// Used in: side_navigation_drawer.dart:42
  final Color headerTextColor;

  /// Creates a copy with the given fields replaced with new values
  SideNavigationThemeData copyWith({
    Color? selectedBackgroundColor,
    Color? selectedBorderColor,
    Color? iconColor,
    Color? selectedIconColor,
    Color? textColor,
    Color? selectedTextColor,
    Color? sectionTextColor,
    Color? dividerColor,
    Color? hoverColor,
    Color? expandCollapseButtonColor,
    double? itemBorderRadius,
    EdgeInsetsGeometry? itemPadding,
    double? expandedWidth,
    double? collapsedWidth,
    Color? selectedColor,
    Color? headerTextColor,
  }) {
    return SideNavigationThemeData(
      selectedBackgroundColor: selectedBackgroundColor ?? this.selectedBackgroundColor,
      selectedBorderColor: selectedBorderColor ?? this.selectedBorderColor,
      iconColor: iconColor ?? this.iconColor,
      selectedIconColor: selectedIconColor ?? this.selectedIconColor,
      textColor: textColor ?? this.textColor,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
      sectionTextColor: sectionTextColor ?? this.sectionTextColor,
      dividerColor: dividerColor ?? this.dividerColor,
      hoverColor: hoverColor ?? this.hoverColor,
      expandCollapseButtonColor: expandCollapseButtonColor ?? this.expandCollapseButtonColor,
      itemBorderRadius: itemBorderRadius ?? this.itemBorderRadius,
      itemPadding: itemPadding ?? this.itemPadding,
      expandedWidth: expandedWidth ?? this.expandedWidth,
      collapsedWidth: collapsedWidth ?? this.collapsedWidth,
      selectedColor: selectedColor ?? this.selectedColor,
      headerTextColor: headerTextColor ?? this.headerTextColor,
    );
  }

  /// Linearly interpolate between two [SideNavigationThemeData] objects.
  static SideNavigationThemeData? lerp(SideNavigationThemeData? a, SideNavigationThemeData? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;
    
    return SideNavigationThemeData(
      selectedBackgroundColor: Color.lerp(a.selectedBackgroundColor, b.selectedBackgroundColor, t)!,
      selectedBorderColor: Color.lerp(a.selectedBorderColor, b.selectedBorderColor, t)!,
      iconColor: Color.lerp(a.iconColor, b.iconColor, t)!,
      selectedIconColor: Color.lerp(a.selectedIconColor, b.selectedIconColor, t)!,
      textColor: Color.lerp(a.textColor, b.textColor, t)!,
      selectedTextColor: Color.lerp(a.selectedTextColor, b.selectedTextColor, t)!,
      sectionTextColor: Color.lerp(a.sectionTextColor, b.sectionTextColor, t)!,
      dividerColor: Color.lerp(a.dividerColor, b.dividerColor, t)!,
      hoverColor: Color.lerp(a.hoverColor, b.hoverColor, t)!,
      expandCollapseButtonColor: Color.lerp(a.expandCollapseButtonColor, b.expandCollapseButtonColor, t)!,
      itemBorderRadius: lerpDouble(a.itemBorderRadius, b.itemBorderRadius, t)!,
      itemPadding: EdgeInsetsGeometry.lerp(a.itemPadding, b.itemPadding, t)!,
      expandedWidth: lerpDouble(a.expandedWidth, b.expandedWidth, t)!,
      collapsedWidth: lerpDouble(a.collapsedWidth, b.collapsedWidth, t)!,
      selectedColor: Color.lerp(a.selectedColor, b.selectedColor, t)!,
      headerTextColor: Color.lerp(a.headerTextColor, b.headerTextColor, t)!,
    );
  }

}