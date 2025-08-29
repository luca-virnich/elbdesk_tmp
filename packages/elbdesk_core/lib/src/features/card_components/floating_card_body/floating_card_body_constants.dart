import 'package:flutter/material.dart';

/// Constants for FloatingCardBody layout calculations
class FloatingCardBodyConstants {
  FloatingCardBodyConstants._();

  /// Breakpoint for mobile vs desktop layout
  static const double mobileBreakpoint = 768;

  /// Entity notes panel dimensions
  static const double notesPanelWidth = 450;

  /// Card navigation dimensions
  static const double navigationExpandedWidth = 200;
  static const double navigationCollapsedWidth = 70;

  /// Divider padding between navigation and content
  static const double navigationDividerPadding = 12;

  /// Mobile-specific constants
  static const double mobileTabBarHeight = kToolbarHeight;

  /// Animation durations (if needed in future)
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  /// Helper methods for calculations
  static double calculateContentWidth({
    required double totalWidth,
    required bool isDesktopView,
    bool isNotesOpen = false,
    bool hasNavigation = false,
    bool isNavigationExpanded = true,
  }) {
    if (!isDesktopView) {
      return totalWidth;
    }

    var contentWidth = totalWidth;

    if (isNotesOpen) {
      contentWidth -= notesPanelWidth;
    }

    if (hasNavigation) {
      contentWidth -= isNavigationExpanded
          ? navigationExpandedWidth
          : navigationCollapsedWidth;
      contentWidth -= navigationDividerPadding;
    }

    return contentWidth;
  }

  /// Check if layout should use mobile view
  static bool isMobileView(double width) => width < mobileBreakpoint;

  /// Check if layout should use desktop view
  static bool isDesktopView(double width) => width >= mobileBreakpoint;
}
