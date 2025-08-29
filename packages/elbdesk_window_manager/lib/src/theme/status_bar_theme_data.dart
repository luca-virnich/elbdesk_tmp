import 'dart:ui';

/// Theme data for customizing the appearance of the status bar
class StatusBarThemeData {
  const StatusBarThemeData({
    required this.height,
    required this.backgroundColor,
  });

  /// Height of the status bar in pixels
  /// Default: 30.0
  final double height;

  /// Background color of the status bar
  /// Used as the background for the top status bar area
  final Color backgroundColor;

  /// Creates a copy with the given fields replaced with new values
  StatusBarThemeData copyWith({
    double? height,
    Color? backgroundColor,
  }) {
    return StatusBarThemeData(
      height: height ?? this.height,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  /// Linearly interpolate between two [StatusBarThemeData] objects.
  static StatusBarThemeData? lerp(
    StatusBarThemeData? a,
    StatusBarThemeData? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return StatusBarThemeData(
      height: lerpDouble(a.height, b.height, t)!,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t)!,
    );
  }
}
