import 'dart:ui';

/// Theme data for window management features
/// Includes snap layouts, edge previews, and window manipulation UI
class WindowManagementThemeData {
  const WindowManagementThemeData({
    // Edge snap preview
    required this.snapPreviewColor,
    required this.snapPreviewBorderColor,
    required this.snapPreviewBorderWidth,
    required this.snapPreviewOpacity,
    // Snap overlay popup
    required this.snapOverlayBackgroundColor,
    required this.snapOverlayBorderColor,
    required this.snapOverlayShadowColor,
    required this.snapOverlayBorderRadius,
    // Snap layout grid
    required this.snapLayoutBackgroundColor,
    required this.snapLayoutBorderColor,
    required this.snapLayoutSegmentColor,
    required this.snapLayoutSegmentHoverColor,
    required this.snapLayoutSegmentBorderColor,
    required this.snapLayoutSegmentHoverBorderColor,
    required this.snapLayoutSegmentBorderWidth,
  });

  // Edge Snap Preview (shown when dragging window to screen edge)

  /// Background color for the snap preview overlay shown when dragging windows to edges
  /// Semi-transparent color that shows where window will snap
  /// Default: Theme.accentColor.withOpacity(0.3)
  final Color snapPreviewColor;

  /// Border color for the snap preview overlay
  /// Outlines the snap area for clarity
  /// Default: Theme.accentColor
  final Color snapPreviewBorderColor;

  /// Border width for snap preview in pixels
  /// Default: 2.0
  final double snapPreviewBorderWidth;

  /// Opacity for the entire snap preview
  /// Default: 0.8
  final double snapPreviewOpacity;

  // Snap Overlay Popup (shown on right-click of maximize button)

  /// Background color for the snap position selector popup
  /// Should contrast with window content
  /// Default: Theme.cardColor
  final Color snapOverlayBackgroundColor;

  /// Border color for the snap position selector popup
  /// Defines the popup outline
  /// Default: Theme.dividerColor
  final Color snapOverlayBorderColor;

  /// Shadow color for the snap position selector popup
  /// Creates elevation effect
  /// Default: Colors.black.withOpacity(0.2)
  final Color snapOverlayShadowColor;

  /// Border radius for snap overlay popup
  /// Default: 8.0
  final double snapOverlayBorderRadius;

  // Snap Layout Grid (grid of snap positions in overlay)

  /// Background color for snap layout preview grid
  /// Base color for the entire grid
  /// Default: Theme.cardColor
  final Color snapLayoutBackgroundColor;

  /// Border color for snap layout preview grid
  /// Outer border of the grid
  /// Default: Theme.dividerColor
  final Color snapLayoutBorderColor;

  /// Default color for snap layout segments
  /// Color when segment is not hovered
  /// Default: Colors.grey.withOpacity(0.3)
  final Color snapLayoutSegmentColor;

  /// Hover color for snap layout segments
  /// Color when user hovers over a segment
  /// Default: Theme.accentColor.withOpacity(0.5)
  final Color snapLayoutSegmentHoverColor;

  /// Border color for snap layout segments
  /// Segment divider lines
  /// Default: Theme.dividerColor
  final Color snapLayoutSegmentBorderColor;

  /// Border color for hovered snap layout segments
  /// Highlighted segment border
  /// Default: Theme.accentColor
  final Color snapLayoutSegmentHoverBorderColor;

  /// Border width for snap layout segments
  /// Default: 1.0
  final double snapLayoutSegmentBorderWidth;

  /// Creates a copy with the given fields replaced with new values
  WindowManagementThemeData copyWith({
    // Edge snap preview
    Color? snapPreviewColor,
    Color? snapPreviewBorderColor,
    double? snapPreviewBorderWidth,
    double? snapPreviewOpacity,
    // Snap overlay popup
    Color? snapOverlayBackgroundColor,
    Color? snapOverlayBorderColor,
    Color? snapOverlayShadowColor,
    double? snapOverlayBorderRadius,
    // Snap layout grid
    Color? snapLayoutBackgroundColor,
    Color? snapLayoutBorderColor,
    Color? snapLayoutSegmentColor,
    Color? snapLayoutSegmentHoverColor,
    Color? snapLayoutSegmentBorderColor,
    Color? snapLayoutSegmentHoverBorderColor,
    double? snapLayoutSegmentBorderWidth,
  }) {
    return WindowManagementThemeData(
      // Edge snap preview
      snapPreviewColor: snapPreviewColor ?? this.snapPreviewColor,
      snapPreviewBorderColor:
          snapPreviewBorderColor ?? this.snapPreviewBorderColor,
      snapPreviewBorderWidth:
          snapPreviewBorderWidth ?? this.snapPreviewBorderWidth,
      snapPreviewOpacity: snapPreviewOpacity ?? this.snapPreviewOpacity,
      // Snap overlay popup
      snapOverlayBackgroundColor:
          snapOverlayBackgroundColor ?? this.snapOverlayBackgroundColor,
      snapOverlayBorderColor:
          snapOverlayBorderColor ?? this.snapOverlayBorderColor,
      snapOverlayShadowColor:
          snapOverlayShadowColor ?? this.snapOverlayShadowColor,
      snapOverlayBorderRadius:
          snapOverlayBorderRadius ?? this.snapOverlayBorderRadius,
      // Snap layout grid
      snapLayoutBackgroundColor:
          snapLayoutBackgroundColor ?? this.snapLayoutBackgroundColor,
      snapLayoutBorderColor:
          snapLayoutBorderColor ?? this.snapLayoutBorderColor,
      snapLayoutSegmentColor:
          snapLayoutSegmentColor ?? this.snapLayoutSegmentColor,
      snapLayoutSegmentHoverColor:
          snapLayoutSegmentHoverColor ?? this.snapLayoutSegmentHoverColor,
      snapLayoutSegmentBorderColor:
          snapLayoutSegmentBorderColor ?? this.snapLayoutSegmentBorderColor,
      snapLayoutSegmentHoverBorderColor:
          snapLayoutSegmentHoverBorderColor ??
          this.snapLayoutSegmentHoverBorderColor,
      snapLayoutSegmentBorderWidth:
          snapLayoutSegmentBorderWidth ?? this.snapLayoutSegmentBorderWidth,
    );
  }

  /// Linearly interpolate between two [WindowManagementThemeData] objects.
  static WindowManagementThemeData? lerp(
    WindowManagementThemeData? a,
    WindowManagementThemeData? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return WindowManagementThemeData(
      // Edge snap preview
      snapPreviewColor: Color.lerp(a.snapPreviewColor, b.snapPreviewColor, t)!,
      snapPreviewBorderColor: Color.lerp(
        a.snapPreviewBorderColor,
        b.snapPreviewBorderColor,
        t,
      )!,
      snapPreviewBorderWidth: lerpDouble(
        a.snapPreviewBorderWidth,
        b.snapPreviewBorderWidth,
        t,
      )!,
      snapPreviewOpacity: lerpDouble(
        a.snapPreviewOpacity,
        b.snapPreviewOpacity,
        t,
      )!,
      // Snap overlay popup
      snapOverlayBackgroundColor: Color.lerp(
        a.snapOverlayBackgroundColor,
        b.snapOverlayBackgroundColor,
        t,
      )!,
      snapOverlayBorderColor: Color.lerp(
        a.snapOverlayBorderColor,
        b.snapOverlayBorderColor,
        t,
      )!,
      snapOverlayShadowColor: Color.lerp(
        a.snapOverlayShadowColor,
        b.snapOverlayShadowColor,
        t,
      )!,
      snapOverlayBorderRadius: lerpDouble(
        a.snapOverlayBorderRadius,
        b.snapOverlayBorderRadius,
        t,
      )!,
      // Snap layout grid
      snapLayoutBackgroundColor: Color.lerp(
        a.snapLayoutBackgroundColor,
        b.snapLayoutBackgroundColor,
        t,
      )!,
      snapLayoutBorderColor: Color.lerp(
        a.snapLayoutBorderColor,
        b.snapLayoutBorderColor,
        t,
      )!,
      snapLayoutSegmentColor: Color.lerp(
        a.snapLayoutSegmentColor,
        b.snapLayoutSegmentColor,
        t,
      )!,
      snapLayoutSegmentHoverColor: Color.lerp(
        a.snapLayoutSegmentHoverColor,
        b.snapLayoutSegmentHoverColor,
        t,
      )!,
      snapLayoutSegmentBorderColor: Color.lerp(
        a.snapLayoutSegmentBorderColor,
        b.snapLayoutSegmentBorderColor,
        t,
      )!,
      snapLayoutSegmentHoverBorderColor: Color.lerp(
        a.snapLayoutSegmentHoverBorderColor,
        b.snapLayoutSegmentHoverBorderColor,
        t,
      )!,
      snapLayoutSegmentBorderWidth: lerpDouble(
        a.snapLayoutSegmentBorderWidth,
        b.snapLayoutSegmentBorderWidth,
        t,
      )!,
    );
  }
}
